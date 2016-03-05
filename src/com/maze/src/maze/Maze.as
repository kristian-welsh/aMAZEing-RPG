package com.maze.src.maze {
	import com.maze.src.Drawer;
	import com.maze.src.maze.edge.MazeEdgeDrawer;
	import com.maze.src.maze.join.MazeJoinDrawer;
	import com.maze.src.random.Random;
	import com.Settings;
	import flash.geom.Point;
	import org.flashdevelop.utils.FlashConnect;
	
	// 0 = unvisited
	// 1 = visited
	// Should seperate maze data object from wall placement functions
	public class Maze {
		
		public var maze:Array = [];
		public var hWalls:Array = [];
		public var vWalls:Array = [];
		public var jumps:Array = [];
		public var startingPoint:Point;
		public var graphicDrawer:Drawer;
		public var mazeEdgeDrawer:MazeEdgeDrawer;
		public var mazeJoinDrawer:MazeJoinDrawer;
		public var randomGenerator:Random;
		
		public function Maze(randomGenerator:Random, graphicDrawer:Drawer, edgeDrawer:MazeEdgeDrawer = null, joinDrawer:MazeJoinDrawer = null) {
			this.graphicDrawer = graphicDrawer;
			this.mazeEdgeDrawer = edgeDrawer || new MazeEdgeDrawer();
			this.mazeJoinDrawer = joinDrawer || new MazeJoinDrawer();
			
			mazeEdgeDrawer.setVWallCallback(addVWallAt);
			mazeEdgeDrawer.setHWallCallback(addHWallAt);
			mazeJoinDrawer.setVWallCallback(addVWallAt);
			mazeJoinDrawer.setHWallCallback(addHWallAt);
			this.randomGenerator = randomGenerator || new Random();
		}
		
		public function create(start:Point):void {
			createRowArrays();
			makeAllMazeUnvisited();
			startingPoint = start;
			generate();
			drawHWalls();
			drawVWalls();
		}
		
		private function drawHWalls():void {
			for (var i:uint = 0; i < hWalls.length; i++)
				graphicDrawer.drawHWallAt(hWalls[i]);
		}
		
		private function drawVWalls():void {
			for (var i:uint = 0; i < vWalls.length; i++)
				graphicDrawer.drawVWallAt(vWalls[i]);
		}
		
		private function createRowArrays():void {
			times(Settings.NUM_ROWS, function(i:uint):void {
				maze.push([]);
			});
		}
		
		private function makeAllMazeUnvisited():void {
			times(Settings.NUM_ROWS, function(i:uint):void {
				makeAllColumnsUnvisited(maze[i]);
			});
		}
		
		private function makeAllColumnsUnvisited(row:Array):void {
			times(Settings.NUM_COLUMNS, function(i:uint):void {
				row.push(0);
			});
		}
		
		private function generate():void {
			var previousPoint:Point;
			var currentPoint:Point = startingPoint;
			var validDirections:Array = [];
			var direction:Point = new Point(0, 0);
			for (var i:uint = 0; i < maze.length * maze[0].length; i++) {
				if (!direction) {
					// if processing jumped to this position, pick a direction to not draw a wall in.
					previousPoint = currentPoint.add(getSingleDisallowedDirection(currentPoint));
				}
				process(currentPoint, previousPoint);
				validDirections = getAllowedDirections(currentPoint);
				direction = randomGenerator.randomElement(validDirections) as Point;
				previousPoint = currentPoint;
				currentPoint = (direction ? currentPoint.add(direction) : getUnprocesedCell(currentPoint));
			}
		}
		
		// inverse functions as wall detection
		private function getAllowedDirections(currentPoint:Point):Array {
			var returnMe:Array = [];
			if (getVisiedValueAt(currentPoint.add(new Point(1, 0))) == 0) {
				returnMe.push(new Point(1, 0));
			}
			if (getVisiedValueAt(currentPoint.add(new Point(-1, 0))) == 0) {
				returnMe.push(new Point(-1, 0));
			}
			if (getVisiedValueAt(currentPoint.add(new Point(0, 1))) == 0) {
				returnMe.push(new Point(0, 1));
			}
			if (getVisiedValueAt(currentPoint.add(new Point(0, -1))) == 0) {
				returnMe.push(new Point(0, -1));
			}
			return returnMe;
		}
		
		// duplicated in getAllowedDirection() and MazeJoinDrawer.js
		private function getSingleDisallowedDirection(currentPoint:Point):Point {
			var allowed:Array = getAllowedDirections(currentPoint);
			if (getVisiedValueAt(currentPoint.add(new Point(1, 0))) == 1) {
				return new Point(1, 0);
			}
			if (getVisiedValueAt(currentPoint.add(new Point(-1, 0))) == 1) {
				return new Point(-1, 0);
			}
			if (getVisiedValueAt(currentPoint.add(new Point(0, 1))) == 1) {
				return new Point(0, 1);
			}
			if (getVisiedValueAt(currentPoint.add(new Point(0, -1))) == 1) {
				return new Point(0, -1);
			}
			throw new Error(":( no disallowed direction, it jumped to an isolated cell");
		}
		
		private function shouldStopGenerating(currentPoint:Point):Boolean {
			return currentPoint.x >= Settings.NUM_COLUMNS;
		}
		
		private function process(cell:Point, prevCell:Point):void {
			setCellVisited(cell);
			mazeEdgeDrawer.process(cell);
			mazeJoinDrawer.process(cell, prevCell, maze)
		}
		
		private function getVisiedValueAt(point:Point):int {
			if (point.y < 0 || point.x < 0 || point.x >= Settings.NUM_COLUMNS || point.y >= Settings.NUM_ROWS)
				return -1;
			return maze[point.y][point.x];
		}
		
		private function setCellVisited(currentPoint:Point):void {
			maze[currentPoint.y][currentPoint.x] = 1;
		}
		
		private function addVWallAt(currentPoint:Point):void {
			vWalls.push(currentPoint);
		}
		
		private function addHWallAt(currentPoint:Point):void {
			hWalls.push(currentPoint);
		}
		
		private function getUnprocesedCell(currentPoint:Point):Point {
			for (var y:uint = 0; y < maze.length; y++)
				for (var x:uint = 0; x < maze[y].length; x++)
					if (maze[y][x] === 0)
						return new Point(x, y);
			return null; // !!!??
		}
		
		public function getHWalls():Array {
			return hWalls;
		}
		
		public function getVWalls():Array {
			return vWalls;
		}
	
	}
}
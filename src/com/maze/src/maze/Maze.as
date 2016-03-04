package com.maze.src.maze {
	import com.maze.src.Drawer;
	import com.maze.src.maze.edge.MazeEdgeDrawer;
	import com.maze.src.maze.join.MazeJoinDrawer;
	import com.maze.src.random.Random;
	
	// 0 = unvisited
	// 1 = visited
	// Should seperate maze data object from wall placement functions
	public class Maze {
		
		var maze = [];
		var hWalls = [];
		var vWalls = [];
		var jumps = [];
		var startingPoint;
		var graphicDrawer = graphicDrawer;
		var mazeEdgeDrawer = edgeDrawer || new MazeEdgeDrawer();
		var mazeJoinDrawer = joinDrawer || new MazeJoinDrawer();
		
		public function Maze(randomGenerator:Random, graphicDrawer:Drawer, edgeDrawer:MazeEdgeDrawer = null, joinDrawer:MazeJoinDrawer = null) {
			var graphicDrawer = graphicDrawer;
			var mazeEdgeDrawer = edgeDrawer || new MazeEdgeDrawer();
			var mazeJoinDrawer = joinDrawer || new MazeJoinDrawer();
			
			mazeEdgeDrawer.setVWallCallback(addVWallAt);
			mazeEdgeDrawer.setHWallCallback(addHWallAt);
			mazeJoinDrawer.setVWallCallback(addVWallAt);
			mazeJoinDrawer.setHWallCallback(addHWallAt);
			randomGenerator = randomGenerator || new Random();
		}
		
		public function create(start):void {
			createRowArrays();
			makeAllMazeUnvisited();
			startingPoint = start;
			generate();
			for (var i = 0; i < hWalls.length; i++) {
				graphicDrawer.drawHWallAt(hWalls[i]);
			}
			for (i = 0; i < vWalls.length; i++) {
				graphicDrawer.drawVWallAt(vWalls[i]);
			}
		}
		
		private function createRowArrays():void {
			times(NUM_ROWS, function() {
				maze.push([]);
			});
		}
		
		private function makeAllMazeUnvisited() {
			times(NUM_ROWS, function(i) {
				makeAllColumnsUnvisited(maze[i]);
			});
		}
		
		private function makeAllColumnsUnvisited(row) {
			times(NUM_COLUMNS, function() {
				row.push(0);
			});
		}
		
		private function generate() {
			var previousPoint = null;
			var currentPoint = startingPoint;
			var validDirections = [];
			var direction = new Point(0, 0);
			for (i = 0; i < maze.length * maze[0].length; i++) {
				if (!direction) {
					// if processing jumped to this position, pick a direction to not draw a wall in.
					previousPoint = currentPoint.add(getSingleDisallowedDirection(currentPoint));
				}
				process(currentPoint, previousPoint);
				validDirections = getAllowedDirections(currentPoint);
				direction = randomGenerator.randomElement(validDirections);
				previousPoint = currentPoint;
				currentPoint = (direction ? currentPoint.add(direction) : getUnprocesedCell(currentPoint));
			}
		}
		
		// inverse functions as wall detection
		private function getAllowedDirections(currentPoint) {
			var returnMe = [];
			if (getCellAt(currentPoint.add(1, 0)) == 0) {
				returnMe.push(new Point(1, 0));
			}
			if (getCellAt(currentPoint.add(-1, 0)) == 0) {
				returnMe.push(new Point(-1, 0));
			}
			if (getCellAt(currentPoint.add(0, 1)) == 0) {
				returnMe.push(new Point(0, 1));
			}
			if (getCellAt(currentPoint.add(0, -1)) == 0) {
				returnMe.push(new Point(0, -1));
			}
			return returnMe;
		}
		
		// duplicated in getAllowedDirection() and MazeJoinDrawer.js
		private function getSingleDisallowedDirection(currentPoint) {
			var returnMe = [];
			var allowed = getAllowedDirections(currentPoint);
			if (allowed.indexOf())
				if (getCellAt(currentPoint.add(1, 0)) == 1) {
					return new Point(1, 0);
				}
			if (getCellAt(currentPoint.add(-1, 0)) == 1) {
				return new Point(-1, 0);
			}
			if (getCellAt(currentPoint.add(0, 1)) == 1) {
				return new Point(0, 1);
			}
			if (getCellAt(currentPoint.add(0, -1)) == 1) {
				return new Point(0, -1);
			}
			throw ":( no disallowed direction, it jumped to an isolated cell"
		}
		
		private function randomElement(array) {
			return array[randomFunction(0, array.length - 1)];
		}
		
		private function shouldStopGenerating(currentPoint) {
			return currentPoint.getX() >= NUM_COLUMNS;
		}
		
		private function process(cell, prevCell) {
			setCellVisited(cell);
			mazeEdgeDrawer.process(cell);
			mazeJoinDrawer.process(cell, prevCell, maze)
		}
		
		private function getCellAt(point) {
			if (point.getY() < 0 || point.getX() < 0 || point.getX() >= NUM_COLUMNS || point.getY() >= NUM_ROWS)
				return -1;
			return maze[point.getY()][point.getX()];
		}
		
		private function setCellVisited(currentPoint) {
			maze[currentPoint.getY()][currentPoint.getX()] = 1;
		}
		
		private function addVWallAt(currentPoint) {
			vWalls.push(currentPoint);
		}
		
		private function addHWallAt(currentPoint) {
			hWalls.push(currentPoint);
		}
		
		private function getUnprocesedCell(currentPoint) {
			for (var y = 0; y < maze.length; y++) {
				for (var x = 0; x < maze[y].length; x++) {
					if (maze[y][x] === 0) {
						console.log("Start: x: " + currentPoint.getX() + ", y:" + currentPoint.getY() + "\nNew Point: x: " + x + ", y: " + y + "\n");
						return new Point(x, y);
					}
				}
			}
		}
		
		public function getHWalls() {
			return hWalls;
		}
		
		public function getVWalls() {
			return vWalls;
		}
	
	}
}
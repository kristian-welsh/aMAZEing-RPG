package com.maze.src.maze.join{
	import com.maze.src.maze.Maze;
	import com.Settings;
	import flash.geom.Point;
	
	public class MazeJoinDrawer {
		private var addVWallAt:Function;
		private var addHWallAt:Function;
		
		public function setVWallCallback(callback:Function):void {
			addVWallAt = callback;
		}
		
		public function setHWallCallback(callback:Function):void {
			addHWallAt = callback;
		}
		
		public function process(currentPoint:Point, previousPoint:Point, maze:Array):void {
			placeVWallIfAtJoin(currentPoint, previousPoint, maze);
			placeHWallIfAtJoin(currentPoint, previousPoint, maze);
		}
		
		private function placeVWallIfAtJoin(currentPoint:Point, previousPoint:Point, maze:Array):void {
			if (getCellAt(currentPoint.add(new Point(1, 0)), maze) == 1 && !currentPoint.add(new Point(1, 0)).equals(previousPoint)) {
				addVWallAt(currentPoint.add(new Point(1, 0)));
			}
			if (getCellAt(currentPoint.add(new Point(-1, 0)), maze) == 1 && !currentPoint.add(new Point(-1, 0)).equals(previousPoint)) {
				addVWallAt(currentPoint);
			}
		}
		
		private function placeHWallIfAtJoin(currentPoint:Point, previousPoint:Point, maze:Array):void {
			if (getCellAt(currentPoint.add(new Point(0, 1)), maze) == 1 && !currentPoint.add(new Point(0, 1)).equals(previousPoint)) {
				addHWallAt(currentPoint.add(new Point(0, 1)));
			}
			if (getCellAt(currentPoint.add(new Point(0, -1)), maze) == 1 && !currentPoint.add(new Point(0, -1)).equals(previousPoint)) {
				addHWallAt(currentPoint);
			}
		}
		
		private function getCellAt(point:Point, maze:Array):int {
			if (point.y < 0 || point.x < 0 || point.x >= Settings.NUM_COLUMNS || point.y >= Settings.NUM_ROWS)
				return -1;
			return maze[point.y][point.x];
		}
	}
}
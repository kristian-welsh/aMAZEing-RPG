package com.maze.src.maze.join{
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
		
		public function process(currentPoint:Point, previousPoint:Point, maze:Maze):void {
			placeVWallIfAtJoin(currentPoint, previousPoint, maze);
			placeHWallIfAtJoin(currentPoint, previousPoint, maze);
		}
		
		private function placeVWallIfAtJoin(currentPoint:Point, previousPoint:Point, maze:Maze):void {
			if (getCellAt(currentPoint.add(1, 0), maze) == 1 && !currentPoint.add(1, 0).equals(previousPoint)) {
				addVWallAt(currentPoint.add(1, 0));
			}
			if (getCellAt(currentPoint.add(-1, 0), maze) == 1 && !currentPoint.add(-1, 0).equals(previousPoint)) {
				addVWallAt(currentPoint);
			}
		}
		
		private function placeHWallIfAtJoin(currentPoint:Point, previousPoint:Point, maze:Maze):void {
			if (getCellAt(currentPoint.add(0, 1), maze) == 1 && !currentPoint.add(0, 1).equals(previousPoint)) {
				addHWallAt(currentPoint.add(0, 1));
			}
			if (getCellAt(currentPoint.add(0, -1), maze) == 1 && !currentPoint.add(0, -1).equals(previousPoint)) {
				addHWallAt(currentPoint);
			}
		}
		
		private function getCellAt(point:Point, maze:Maze):uint {
			if (point.getY() < 0 || point.getX() < 0 || point.getX() >= NUM_COLUMNS || point.getY() >= NUM_ROWS)
				return -1;
			return maze[point.getY()][point.getX()];
		}
	}
}
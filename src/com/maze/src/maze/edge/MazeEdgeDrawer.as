package com.maze.src.maze.edge {
	import com.Settings;
	import flash.geom.Point;
	
	public class MazeEdgeDrawer {
		private var addVWallAt:Function;
		private var addHWallAt:Function;
		
		public function setVWallCallback(callback:Function):void {
			addVWallAt = callback;
		}
		
		public function setHWallCallback(callback:Function):void {
			addHWallAt = callback;
		}
		
		public function process(currentPoint:Point):void {
			placeVWallIfAtMazeEdge(currentPoint);
			placeHWallIfAtMazeEdge(currentPoint);
		}
		
		private function placeVWallIfAtMazeEdge(currentPoint:Point):void {
			// leave entrance & exit
			if (currentPoint.y == Math.round(Settings.NUM_ROWS / 2))
				return;
			// draw walls in all other places.
			if (currentPoint.x == 0)
				addVWallAt(currentPoint);
			if (currentPoint.x == Settings.NUM_ROWS - 1)
				addVWallAt(new Point(currentPoint.x + 1, currentPoint.y));
		}
		
		private function placeHWallIfAtMazeEdge(currentPoint:Point):void {
			if (currentPoint.y == 0)
				addHWallAt(currentPoint);
			if (currentPoint.y == Settings.NUM_COLUMNS - 1)
				addHWallAt(new Point(currentPoint.x, currentPoint.y + 1));
		}
	}
}
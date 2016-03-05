package com.maze.src {
	import com.maze.src.maze.edge.MazeEdgeDrawer;
	import com.maze.src.maze.join.MazeJoinDrawer;
	import com.maze.src.maze.Maze;
	import com.maze.src.random.Random;
	import com.Settings;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class MazeSetup {
		public function doIt():DisplayObject {
			var display:Sprite = new Sprite();
			var drawer:Drawer = new Drawer(display);
			var maze:Maze = new Maze(new Random(), drawer, new MazeEdgeDrawer(), new MazeJoinDrawer());
			initGraphics(display);
			maze.create(new Point(0, 0));
			return display;
		}
		
		private function initGraphics(display:Sprite):void {
			display.graphics.lineStyle(Settings.WALL_DEPTH);
			display.graphics.beginFill(0xDDDDDD);
			display.graphics.drawRect(Settings.EDGE_PADDING, Settings.EDGE_PADDING, Settings.EDGE_PADDING + Settings.CANVAS_WIDTH - Settings.TILE_WIDTH, Settings.EDGE_PADDING + Settings.CANVAS_HEIGHT - Settings.TILE_HEIGHT);
			display.graphics.endFill();
		}
	}
}
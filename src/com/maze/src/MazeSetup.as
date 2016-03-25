package com.maze.src {
	import com.maze.src.maze.edge.MazeEdgeDrawer;
	import com.maze.src.maze.join.MazeJoinDrawer;
	import com.maze.src.maze.Maze;
	import com.maze.src.random.Random;
	import com.Settings;
	import flash.display.DisplayObject;
	import flash.display.JointStyle;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class MazeSetup {
		public function doIt():DisplayObject {
			var display:Sprite = new Sprite();
			var drawer:Drawer = new Drawer(display);
			var maze:Maze = new Maze(new Random(), drawer, new MazeEdgeDrawer(), new MazeJoinDrawer());
			display.graphics.lineStyle(Settings.WALL_DEPTH, 0x0000000, 1, false, "normal", "square");
			maze.create(new Point(0, 0));
			return display;
		}
	}
}
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
		
		public function doIt():Array {
			var startPoint:Point = new Point(0, 0);
			var drawer:Drawer = new Drawer();
			var maze:Maze = new Maze(new Random(), drawer, new MazeEdgeDrawer(), new MazeJoinDrawer());
			maze.create(startPoint);
			return drawer.walls;
		}
	}
}
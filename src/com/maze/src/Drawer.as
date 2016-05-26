package com.maze.src {
	import com.obstacle.HWall;
	import com.obstacle.VWall;
	import flash.geom.Point;
	
	public class Drawer {
		public var walls:Array;
		
		public function Drawer() {
			this.walls = [];
		}
		
		public function drawHWallAt(point:Point):void {
			walls.push(new HWall(point));
		}
		
		public function drawVWallAt(point:Point):void {
			walls.push(new VWall(point));
		}
	}
}
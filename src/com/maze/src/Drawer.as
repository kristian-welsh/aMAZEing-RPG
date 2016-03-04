package com.maze.src {
	import com.Settings;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	
	public class Drawer {
		private var graphics:Graphics;
		
		public function Drawer(display:DisplayObject) {
			this.graphics = display.graphics;
		}
		
		public function drawHWallAt(point):void {
			graphics.moveTo(Settings.EDGE_PADDING + point.getX() * Settings.TILE_WIDTH, Settings.EDGE_PADDING + point.getY() * Settings.TILE_HEIGHT);
			graphics.lineTo(Settings.EDGE_PADDING + (point.getX() + 1) * Settings.TILE_WIDTH, Settings.EDGE_PADDING + point.getY() * Settings.TILE_HEIGHT);
		}
		
		public function drawVWallAt(point):void {
			graphics.moveTo(Settings.EDGE_PADDING + point.getX() * Settings.TILE_WIDTH, Settings.EDGE_PADDING + point.getY() * Settings.TILE_HEIGHT);
			graphics.lineTo(Settings.EDGE_PADDING + point.getX() * Settings.TILE_WIDTH, Settings.EDGE_PADDING + (point.getY() + 1) * Settings.TILE_HEIGHT);
		}
	}
}
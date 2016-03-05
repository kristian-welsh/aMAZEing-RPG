package com.maze.src {
	import com.Settings;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Drawer {
		private var graphics:Graphics;
		
		public function Drawer(display:Sprite) {
			this.graphics = display.graphics;
		}
		
		public function drawHWallAt(point:Point):void {
			graphics.moveTo(Settings.EDGE_PADDING + point.x * Settings.TILE_WIDTH, Settings.EDGE_PADDING + point.y * Settings.TILE_HEIGHT);
			graphics.lineTo(Settings.EDGE_PADDING + (point.x + 1) * Settings.TILE_WIDTH, Settings.EDGE_PADDING + point.y * Settings.TILE_HEIGHT);
		}
		
		public function drawVWallAt(point:Point):void {
			graphics.moveTo(Settings.EDGE_PADDING + point.x * Settings.TILE_WIDTH, Settings.EDGE_PADDING + point.y * Settings.TILE_HEIGHT);
			graphics.lineTo(Settings.EDGE_PADDING + point.x * Settings.TILE_WIDTH, Settings.EDGE_PADDING + (point.y + 1) * Settings.TILE_HEIGHT);
		}
	}
}
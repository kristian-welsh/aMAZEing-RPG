package com.obstacle {
	import com.Settings;
	import com.collision.Collider;
	import flash.display.CapsStyle;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class VWall extends Sprite implements Collider {
		public var lineThickness:uint = 10;
		
		public function VWall(position:Point) {
			super();
			drawWall(position);
		}
		
		private function drawWall(point:Point):void {
			graphics.lineStyle(Settings.WALL_DEPTH, 0, 1, false, "normal", CapsStyle.SQUARE);
			graphics.moveTo(0, 0);
			graphics.lineTo(0, Settings.TILE_HEIGHT);
			x = Settings.EDGE_PADDING + point.x * Settings.TILE_WIDTH;
			y = Settings.EDGE_PADDING + point.y * Settings.TILE_HEIGHT;
		}
		
		/* INTERFACE com.collision.Collider */
		
		public function getX():Number {
			return x - lineThickness / 2;
		}
		
		public function getY():Number {
			return y - lineThickness / 2;
		}
		
		public function getWidth():Number {
			return width;
		}
		
		public function getHeight():Number {
			return height;
		}
	}
}
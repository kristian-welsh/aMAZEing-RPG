package com.obstacle {
	import flash.display.CapsStyle;
	import flash.display.Sprite;
	
	public class Obstacle extends Sprite {
		public var lineThickness:uint = 10;
		
		public function Obstacle() {
			super();
			graphics.lineStyle(lineThickness, 0, 1, false, "normal", CapsStyle.SQUARE);
			graphics.lineTo(500, 0);
			x = 10
			y = 250
		}
	}
}
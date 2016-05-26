package com.player {
	import com.Colours;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	public class PlayerView {
		private var graphics:Sprite = new Sprite();
		
		public function PlayerView() {
			drawGraphics();
		}
		
		private function drawGraphics():void {
			graphics.graphics.beginFill(com.Colours.LIGHT_RED);
			graphics.graphics.moveTo(0, 0);
			graphics.graphics.lineTo(25, 0);
			graphics.graphics.lineTo(25, 25);
			graphics.graphics.lineTo(0, 25);
			graphics.graphics.lineTo(0, 0);
			graphics.graphics.endFill();
		}
		
		public function getGraphics():DisplayObject {
			return graphics;
		}
		
		public function updatePosition(data:Object):void {
			graphics.x = data.x;
			graphics.y = data.y;
		}
	}
}
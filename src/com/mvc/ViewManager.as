package com.mvc {
	import com.signal.Signaler;
	import com.signal.Signals;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	public class ViewManager {
		private var modelSignaler:Signaler;
		private var graphics:Sprite = new Sprite();
		
		public function ViewManager(container:DisplayObjectContainer, modelSignaler:Signaler) {
			container.addChild(graphics);
			this.modelSignaler = modelSignaler;
			
			modelSignaler.awaitSignal(Signals.PLAYER_MOVEMENT, foop);
		}
		
		public function foop(data:Object):void {
		}
	}
}
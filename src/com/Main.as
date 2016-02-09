package com{
	import com.signal.Signals;
	import com.timing.GameLoop;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.mvc.*;
	
	public class Main extends Sprite {
		static private const FPS:uint = 480;
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var loop:GameLoop = new GameLoop(1000 / FPS);
			var controller:ControllerManager = new ControllerManager(stage);
			var model:ModelManager = new ModelManager(loop.getSignaler(), controller.getKeys());
			var view:ViewManager = new ViewManager(stage, model.getSignaler());
			loop.play();
		}
	}
}
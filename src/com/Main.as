package com{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.mvc.*;
	
	public class Main extends Sprite {
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var model:ModelManager = new ModelManager();
			var view:ViewManager = new ViewManager(stage, model.getSignaler());
			model.doThing();
			var controller:ControllerManager = new ControllerManager();
		}
	}
}
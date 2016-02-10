package com{
	import asunit.textui.TestRunner;
	import com.signal.Signals;
	import com.test.TestCases;
	import com.timing.GameLoop;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.mvc.*;
	
	public class Main extends Sprite {
		static private const FPS:uint = 480;
		private var testRunner:TestRunner = new TestRunner();
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			if(CONFIG::debug)
				startTests();
			else if(CONFIG::release)
				startGame();
		}
		
		private function startTests():void {
			stage.addChild(testRunner);
			testRunner.start(TestCases, null, true);
		}
		
		private function startGame():void {
			var loop:GameLoop = new GameLoop(1000 / FPS);
			var controller:ControllerManager = new ControllerManager(stage);
			var model:ModelManager = new ModelManager(loop.getSignaler(), controller.getKeys());
			var view:ViewManager = new ViewManager(stage, model.getSignaler());
			loop.play();
		}
	}
}
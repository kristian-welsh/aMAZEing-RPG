package com{
	import asunit.textui.TestRunner;
	import com.maze.src.MazeSetup;
	import com.test.TestCases;
	import com.timing.GameLoop;
	import flash.display.DisplayObject;
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
			var mazeSetup:MazeSetup = new MazeSetup();
			var mazeWalls:Array = mazeSetup.doIt();
			var model:ModelManager = new ModelManager(loop.getSignaler(), controller.getKeys(), mazeWalls);
			var view:ViewManager = new ViewManager(stage, model.getSignaler());
			for each(var wall:DisplayObject in mazeWalls)
				stage.addChild(wall);
			model.start()
			loop.play();
		}
	}
}
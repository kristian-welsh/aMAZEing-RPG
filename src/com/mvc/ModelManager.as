package com.mvc {
	import com.keys.Keys;
	import com.obstacle.HWall;
	import com.obstacle.VWall;
	import com.player.PlayerModel;
	import com.signal.*;
	import flash.ui.Keyboard;
	
	public class ModelManager implements SignalProducer {
		private var signaler:Signaler = new Signaler();
		private var tickSignaler:Signaler;
		private var player:PlayerModel;
		private var keys:Keys;
		
		public function ModelManager(tickSignaler:Signaler, keys:Keys, obstacles:Array) {
			super();
			tickSignaler.awaitSignal(Signals.TICK_MODELS, tick);
			
			player = new PlayerModel(obstacles);
			this.keys = keys;
			signaler.propagate(player.getSignaler());
		}
		
		public function start():void {
			player.start();
		}
		
		public function tick(data:Object = null):void {
			player.updatePosition(keys.isPressed(Keyboard.LEFT),
				keys.isPressed(Keyboard.UP),
				keys.isPressed(Keyboard.RIGHT),
				keys.isPressed(Keyboard.DOWN));
		}
		
		public function getSignaler():Signaler {
			return signaler;
		}
	}
}
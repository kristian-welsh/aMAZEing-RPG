package com.mvc {
	import com.keys.Keys;
	import com.PlayerModel;
	import com.signal.*;
	import flash.ui.Keyboard;
	
	public class ModelManager implements SignalProducer {
		private var signaler:Signaler = new Signaler();
		private var tickSignaler:Signaler;
		private var player:PlayerModel;
		private var keys:Keys;
		
		public function ModelManager(tickSignaler:Signaler, keys:Keys) {
			super();
			tickSignaler.awaitSignal(Signals.TICK_MODELS, tick);
			
			player = new PlayerModel();
			this.keys = keys;
			signaler.propagate(player.getSignaler());
		}
		
		public function tick():void {
			player.updatePosition(keys.isPressed(Keyboard.LEFT),
				keys.isPressed(Keyboard.UP),
				keys.isPressed(Keyboard.RIGHT),
				keys.isPressed(Keyboard.DOWN));
			
			signaler.signal(Signals.PLAYER_MOVEMENT, {"x":10, "y":20});
		}
		
		public function getSignaler():Signaler {
			return signaler;
		}
	}
}
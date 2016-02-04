package com.mvc {
	import com.signal.*;
	
	public class ModelManager implements SignalProducer {
		private var signaler:Signaler = new Signaler();
		
		public function doThing():void {
			signaler.signal(Signals.PLAYER_MOVEMENT, {"x":10, "y":20});
		}
		
		public function getSignaler():Signaler {
			return signaler;
		}
	}
}
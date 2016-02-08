package com {
	import com.signal.Signaler;
	import com.signal.SignalProducer;
	import com.signal.Signals;
	
	public class PlayerModel implements SignalProducer {
		private var signaler:Signaler = new Signaler();
		
		public function getSignaler():Signaler {
			return signaler;
		}
		
		public function updatePosition(left:Boolean, up:Boolean, right:Boolean, down:Boolean):void {
			signaler.signal(Signals.PLAYER_MOVEMENT, { "x": 50, "y": 300 } );
		}
	}
}
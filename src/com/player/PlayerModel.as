package com.player {
	import com.signal.Signaler;
	import com.signal.SignalProducer;
	import com.signal.Signals;
	import org.flashdevelop.utils.FlashConnect;
	
	public class PlayerModel implements SignalProducer {
		private const SPEED:Number = 3;
		
		private var signaler:Signaler = new Signaler();
		private var x:Number = 100;
		private var y:Number = 300;
		
		public function getSignaler():Signaler {
			return signaler;
		}
		
		public function updatePosition(left:Boolean, up:Boolean, right:Boolean, down:Boolean):void {
			if (left && !right)
				setX(x - SPEED);
			if (!left && right)
				setX(x + SPEED);
			
			if (up && !down)
				setY(y - SPEED);
			if (!up && down)
				setY(y + SPEED);
		}
		
		private function setX(input:Number):void {
			x = input;
			signalMovement();
		}
		
		private function setY(input:Number):void {
			y = input;
			signalMovement();
		}
		
		private function signalMovement():void {
			signaler.signal(Signals.PLAYER_MOVEMENT, { "x": x, "y": y } );
		}
	}
}
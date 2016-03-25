package com.player {
	import asunit.util.Properties;
	import com.collision.CollisionDetector;
	import com.signal.Signaler;
	import com.signal.SignalProducer;
	import com.signal.Signals;
	import org.flashdevelop.utils.FlashConnect;
	
	public class PlayerModel implements SignalProducer {
		private const SPEED:Number = 3;
		
		private var signaler:Signaler = new Signaler();
		private var x:Number = 100;
		private var y:Number = 300;
		private var collisionDetection:CollisionDetector
		
		public function PlayerModel(obstacles:Array) {
			collisionDetection = new CollisionDetector(obstacles);
			super();
		}
		
		public function getSignaler():Signaler {
			return signaler;
		}
		
		public function updatePosition(left:Boolean, up:Boolean, right:Boolean, down:Boolean):void {
			var newPos:Array = collisionDetection.detect(x, y, left, up, right, down, SPEED);
			/*
			if (left && !right)
				setX(x - SPEED);
			if (!left && right)
				setX(x + SPEED);
			
			if (up && !down)
				setY(y - SPEED);
			if (!up && down)
				setY(y + SPEED);
				*/
			setX(newPos[0]);
			setY(newPos[1]);
		}
		
		public function start():void {
			signalMovement();
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
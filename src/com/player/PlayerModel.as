package com.player {
	import com.collision.Collider;
	import com.collision.CollisionDetector;
	import com.signal.SignalProducer;
	import com.signal.Signaler;
	import com.signal.Signals;
	
	public class PlayerModel implements SignalProducer, Collider {
		private const SPEED:Number = 3;
		
		private var x:Number = 20;
		private var y:Number = 300;
		private var width:Number = 25;
		private var height:Number = 25;
		private var signaler:Signaler = new Signaler();
		private var collisionDetection:CollisionDetector;
		
		public function PlayerModel(obstacles:Array) {
			collisionDetection = new CollisionDetector(obstacles);
			super();
		}
		
		public function getSignaler():Signaler {
			return signaler;
		}
		
		public function updatePosition(left:Boolean, up:Boolean, right:Boolean, down:Boolean):void {
			var newPos:Array = collisionDetection.detect(this, left, up, right, down, SPEED);
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
			signaler.signal(Signals.PLAYER_MOVEMENT, {"x": x, "y": y});
		}
		
		/* INTERFACE com.collision.Collider */
		
		public function getX():Number {
			return x;
		}
		
		public function getY():Number {
			return y;
		}
		
		public function getWidth():Number {
			return width;
		}
		
		public function getHeight():Number {
			return height;
		}
	}
}

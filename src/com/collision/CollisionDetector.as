package com.collision {
	import com.obstacle.Obstacle;
	public class CollisionDetector {
		private var colliders:Array;
		
		public function CollisionDetector(colliders:Array) {
			this.colliders = colliders;
			
		}
		
		// output array is [x, y]
		public function detect(x:Number, y:Number, left:Boolean, up:Boolean, right:Boolean, down:Boolean, speed:Number):Array {
			var result = [x, y];
			var curCollider:Obstacle;
			for (var i = 0; i < colliders.length; i++) {
				curCollider = colliders[i] as Obstacle;
				switch(true) {
					case left:
						result[0] -= speed;
						break;
					case right:
						result[0] += speed;
						break;
				}
				switch(true) {
					case up:
						result[1] -= speed;
						break;
					case down:
						result[1] += speed;
						break;
				}
			}
			return result;
		}
	}
}
package com.collision {
	import com.obstacle.HWall;
	import flash.globalization.NumberFormatter;
	
	// arguments could be passed in as (movingObject, directionInfo, stationaryObject) in future.
	// presently collides only one moving object with some stationary objects
	// collision between two or more moving objects can be simulated imperfectly by considering each object's collisions and movement seperately as if only it is moving.
	public class CollisionDetector {
		private var colliders:Array;
		
		// might be better to pass at run time? Depends upon how i want to use class, presently this belongs to moving object and coliders are known at instantiation.
		public function CollisionDetector(colliders:Array) {
			this.colliders = colliders;
		}
		
		// output array is [x, y]
		public function detect(player:Collider, left:Boolean, up:Boolean, right:Boolean, down:Boolean, speed:Number):Array {
			var result:Array = [player.getX(), player.getY()];
			var curCollider:Collider;
			
			if (left) {
				result[0] -= speed;
			} else if (right) {
				result[0] += speed;
			}
			if (up) {
				result[1] -= speed;
			} else if (down) {
				result[1] += speed;
			}
			for (var i:uint = 0; i < colliders.length; i++) {
				curCollider = colliders[i] as Collider;
				if(left) {
					if (leftCollision(player, speed, curCollider)) {
						result[0] = curCollider.getX() + curCollider.getWidth() + 1;
					}
				}
				if(right) {
					if (rightCollision(player, speed, curCollider)) {
						result[0] = curCollider.getX() - player.getWidth() - 1;
					}
				}
				if(up) {
					if (upCollision(player, speed, curCollider)) {
						result[1] = curCollider.getY() + curCollider.getHeight() + 1;
					}
				}
				if(down) {
					if (downCollision(player, speed, curCollider)) {
						result[1] = curCollider.getY() - player.getHeight() - 1;
					}
				}
			}
			return result;
		}
		
		private function leftCollision(player:Collider, speed:Number, obstacle:Collider):Boolean {
			if (player.getY() <= obstacle.getY() + obstacle.getHeight() && player.getY() + player.getHeight() >= obstacle.getY()) {
				if (player.getX() >= obstacle.getX() + obstacle.getWidth() && player.getX() - speed <= obstacle.getX() + obstacle.getWidth()) {
					return true;
				}
			}
			return false;
		}
		
		private function rightCollision(player:Collider, speed:Number, obstacle:Collider):Boolean {
			if (player.getY() <= obstacle.getY() + obstacle.getHeight() && player.getY() + player.getHeight() >= obstacle.getY()) {
				if (player.getX() + player.getWidth() <= obstacle.getX() && player.getX() + player.getWidth() + speed >= obstacle.getX()) {
					return true;
				}
			}
			return false;
		}
		
		private function upCollision(player:Collider, speed:Number, obstacle:Collider):Boolean {
			if (player.getX() <= obstacle.getX() + obstacle.getWidth() && player.getX() + player.getWidth() >= obstacle.getX()) {
				if (player.getY() >= obstacle.getY() + obstacle.getHeight() && player.getY() - speed <= obstacle.getY() + obstacle.getHeight()) {
					return true;
				}
			}
			return false;
		}
		
		private function downCollision(player:Collider, speed:Number, obstacle:Collider):Boolean {
			if (player.getX() <= obstacle.getX() + obstacle.getWidth() && player.getX() + player.getWidth() >= obstacle.getX()) {
				if (player.getY() + player.getHeight() <= obstacle.getY() && player.getY() + player.getHeight() + speed >= obstacle.getY()) {
					return true;
				}
			}
			return false;
		}
	}
}

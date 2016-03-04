package com.maze.src.random {
	
	public class Random {
		public function intInBounds(lowest:int, highest:int):int {
			return Math.round(lowest + Math.random() * (highest - lowest));
		}
		
		public function randomElement(array:Array):Object {
			return array[this.intInBounds(0, array.length - 1)];	
		}
	}
}
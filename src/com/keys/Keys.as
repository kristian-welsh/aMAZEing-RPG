package com.keys {
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	
	/**
	 * Provides an on demand method of inspecting keyboard state.
	 */
	public class Keys {
		private var dispatcher:EventDispatcher;
		private var keys:Object = {}
		
		public function Keys(dispatcher:EventDispatcher) {
			this.dispatcher = dispatcher;
			
			dispatcher.addEventListener(KeyboardEvent.KEY_DOWN, press);
			dispatcher.addEventListener(KeyboardEvent.KEY_UP, release);
		}
		
		private function press(e:KeyboardEvent):void {
			keys[e.keyCode] = true;
		}
		
		private function release(e:KeyboardEvent):void {
			keys[e.keyCode] = false;
		}
		
		public function isPressed(keyCode:uint):Boolean {
			return keys[keyCode];
		}
	}
}
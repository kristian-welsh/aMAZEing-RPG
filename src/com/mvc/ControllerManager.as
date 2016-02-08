package com.mvc {
	import com.keys.Keys;
	import flash.events.EventDispatcher;
	public class ControllerManager {
		private var keys:Keys;
		
		public function ControllerManager(dispatcher:EventDispatcher) {
			keys = new Keys(dispatcher);
		}
		
		public function getKeys():Keys {
			return keys;
		}
	}
}
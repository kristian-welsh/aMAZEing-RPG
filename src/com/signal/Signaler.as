package com.signal {
	public class Signaler {
		private var callbacks:Array = [];
		
		public function signal(signalType:Object, data:Object):void {
			for each(var callback:Object in callbacks)
				if (callback.type === signalType)
					callback.func(data);
		}
		
		public function awaitSignal(signalType:Object, callback:Function):void {
			callbacks.push( { "type":signalType, "func":callback } );
		}
	}
}
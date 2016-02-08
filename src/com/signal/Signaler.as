package com.signal {
	public class Signaler {
		private var callbacks:Array = [];
		
		public function signal(signalType:Object, data:Object = null):void {
			for each(var callback:Object in callbacks)
				if (callback.type === signalType || callback.type === Signals.PROPOGATE)
					callback.func(data, signalType);
		}
		
		public function awaitSignal(signalType:Object, callback:Function):void {
			callbacks.push( { "type":signalType, "func":callback } );
		}
		
		public function propagate(object:Signaler):void {
			object.awaitSignal(Signals.PROPOGATE, function(data:Object, signalType:Object):void {
				signal(signalType, data);
			});
		}
	}
}
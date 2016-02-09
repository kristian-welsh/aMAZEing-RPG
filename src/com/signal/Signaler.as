package com.signal {
	import org.flashdevelop.utils.FlashConnect;
	public class Signaler {
		private var callbacks:Array = [];
		
		public function signal(signalType:Object, data:Object = null):void {
			data = data || { };
			for each(var callback:Object in callbacks) {
				if (callback.type === signalType || callback.type === Signals.PROPOGATE) {
					data["signalType"] = signalType;
					callback.func(data);
				}
			}
		}
		
		public function awaitSignal(signalType:Object, callback:Function):void {
			callbacks.push( { "type":signalType, "func":callback } );
		}
		
		public function propagate(object:Signaler):void {
			object.awaitSignal(Signals.PROPOGATE, function(data:Object):void {
				signal(data.signalType, data);
			});
		}
	}
}
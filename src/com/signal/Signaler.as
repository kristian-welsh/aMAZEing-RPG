package com.signal {
	public class Signaler {
		private var callbacks:Array = [];
		
		/**
		 * Triger any registered functions that are waiting for a signal of type signalType.
		 * @param	signalType	The signal type that is being signaled, only functions awaiting this signal type are called.
		 * @param	data	An object containing all data that needs to be transfered to awaiting functions.
		 */
		public function signal(signalType:Object, data:Object = null):void {
			data = data || { };
			for each(var callback:Object in callbacks) {
				if (callback.type === signalType || callback.type === Signals.PROPOGATE) {
					data["signalType"] = signalType;
					callback.func(data);
				}
			}
		}
		
		/**
		 * Wait for a signal of type signalType to be transmitted before calling the callback function.
		 * @param	signalType	The type of signal to await.
		 * @param	callback	The function that is to be called when the apropriate signal is transmited.
		 */
		public function awaitSignal(signalType:Object, callback:Function):void {
			callbacks.push( { "type":signalType, "func":callback } );
		}
		
		/**
		 * Object will wait for any signal from original, then transmits the same signal.
		 * @param	original	Signaler to propagate signals from.
		 */
		public function propagate(original:Signaler):void {
			original.awaitSignal(Signals.PROPOGATE, function(data:Object):void {
				signal(data.signalType, data);
			});
		}
	}
}
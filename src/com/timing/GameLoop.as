package com.timing {
	import com.signal.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * Currently acts as a wrapper for Timers and TimerEvents, provides structural flexibility.
	 */
	public class GameLoop implements SignalProducer {
		private var signaler:Signaler = new Signaler();
		private var timer:Timer;
		
		/**
		 * @param	delay How many miliseconds to wait between game ticks
		 */
		public function GameLoop(delay:uint) {
			timer = new Timer(delay);
			timer.addEventListener(TimerEvent.TIMER, tick);
		}
		
		private function tick(e:TimerEvent):void {
			signaler.signal(Signals.TICK_MODELS);
			signaler.signal(Signals.TICK_VIEWS);
		}
		
		/**
		 * Start or continue the game loop's opperation.
		 */
		public function play():void {
			timer.start();
		}
		
		/**
		 * Stop or pause the game loop's opperation.
		 */
		public function pause():void {
			timer.stop();
		}
		
		public function getSignaler():Signaler {
			return signaler;
		}
	}
}
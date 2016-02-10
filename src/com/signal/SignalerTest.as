package com.signal {
	import kris.test.SuiteProvidingTestCase;
	
	public class SignalerTest extends SuiteProvidingTestCase {
		static private const TEST_SIGNAL:Object = { };
		
		private var signaler:Signaler;
		private var propagator:Signaler;
		private var receivedData:Object;
		
		public function SignalerTest(testMethod:String = null) {
			super([
				function_not_called_if_other_signal_transmitted,
				function_transmits_correct_data_object_with_signal,
				signals_propogate_correctly
				], testMethod);
		}
		
		private function logCall(data:Object):void {
			receivedData = data;
		}
		
		override protected function setUp():void {
			signaler = new Signaler();
			propagator = new Signaler();
			receivedData = null;
		}
		
		public function function_not_called_if_other_signal_transmitted():void {
			signaler.awaitSignal(TEST_SIGNAL, logCall);
			signaler.signal( { }, { } );
			assertNull("Awaiting function was called but should not have been.", receivedData);
		}
		
		public function function_transmits_correct_data_object_with_signal():void {
			var submittedData:Object = { };
			signaler.awaitSignal(TEST_SIGNAL, logCall);
			signaler.signal(TEST_SIGNAL, submittedData);
			assertEquals("Received data object is not the object that was submitted.", receivedData, submittedData);
			assertEquals("Received data was not given the correct signal type variable.", TEST_SIGNAL, receivedData.signalType);
		}
		
		public function signals_propogate_correctly():void {
			var submittedData:Object = { };
			propagator.propagate(signaler);
			propagator.awaitSignal(TEST_SIGNAL, logCall);
			signaler.signal(TEST_SIGNAL, submittedData);
			assertEquals("Signal was not propogated correctly.", receivedData, submittedData);
		}
	}
}
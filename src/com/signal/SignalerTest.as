package com.signal {
	import kris.test.SuiteProvidingTestCase;
	
	public class SignalerTest extends SuiteProvidingTestCase {
		private var testSubject:Signaler;
		
		public function SignalerTest(testMethod:String=null) {
			super([
				foo
				], testMethod);
		}
		
		override protected function setUp():void {
			testSubject = new Signaler();
		}
		
		public function foo():void {
			// test goes here
		}
	}
}
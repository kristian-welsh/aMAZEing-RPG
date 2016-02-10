package com.signal {
	import kris.test.SuiteProvidingTestCase;
	
	public class SignalerTest extends SuiteProvidingTestCase {	
		public function SignalerTest(testMethod:String=null) {
			super([
				foo
				], testMethod);
		}
		
		public function foo():void {
			// test goes here
		}
	}
}
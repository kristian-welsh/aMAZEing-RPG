package com.test {
	import com.signal.SignalerTest;
	import kris.test.TestSuiteCollector;
	
	public class TestCases extends TestSuiteCollector {
		public function TestCases() {
			super()
			includeTestsFrom(SignalerTest);
		}
	}
}
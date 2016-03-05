package {
  public function times(numCalls:uint, func:Function):void {
    for (var curCall:uint = 0; curCall < numCalls; curCall++)
      func(curCall);
  }
}
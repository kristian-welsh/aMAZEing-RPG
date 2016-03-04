package com.maze.lib {
  public function times(numCalls:uint, func:Function):void {
    for (var curCall = 0; curCall < numCalls; curCall++)
      func(curCall);
  }
}
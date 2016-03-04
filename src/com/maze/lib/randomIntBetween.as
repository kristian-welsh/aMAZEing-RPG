package com.maze.lib {
  public function randomIntBetween(lowerBound:int, upperBound:int):int {
    return Math.round(Math.random() * (upperBound - lowerBound)) + lowerBound;
  }
}
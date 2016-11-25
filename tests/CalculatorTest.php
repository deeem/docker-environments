<?php

use PHPUnit\Framework\TestCase;

class CalculatorTest extends TestCase
{
    public function testAdd()
    {
      $calculator = new App\Calculator;
      $result = $calculator->add(3,4);
      $this->assertEquals(7, $result);
    }
}

module Test.Main where


import Prelude
import Test.Unit (suite, test, timeout)
import Recruder (create, read, update, remove)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert

main = runTest do
  suite "cruders"
    test "create" do
      Assert.assert "if new value is false should return false" ( (create true) == true)

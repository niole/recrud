module Main where

import Control.Monad.Eff.Console
import Data.Show (show)
import Recruder (create)

main = log ( show (create true false) )

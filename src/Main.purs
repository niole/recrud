module Main where

import Control.Monad.Eff.Console
import Data.Show (show)
import Recruder (create, read, update, remove)

main = log ( show ( update true (\_ -> false) (\_ -> true)) )

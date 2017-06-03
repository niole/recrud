module Main where
import Control.Monad.Eff.Console
import Data.Show (show)


data Primitive = String | Number | Boolean
type Accessor = String
type LT = String
type LTE = String
type GT = String
type GTE = String
type EQ = String
data RelationalOp = LT | LTE | GT | GTE | EQ

type Filter =
  { operator :: RelationalOp
  ,value :: Primitive
  }

type SelectWhere =
  {
  accessor :: Accessor
  ,where :: Select
  }

type SelectAccessor =
  {
  accessor :: Accessor
  }

data Select = SelectAccessor | SelectWhere

class Recruder a where
  create :: a -> a -> a
  read :: a -> Filter -> a
  update :: a -> Select -> Filter -> a
  remove :: a -> Filter -> a

instance recruderBoolean :: Recruder Boolean where
  create _ new = new
  read state _ = state
  update state select filter = state
  remove state filter = state

main = log ( show (create true false) )

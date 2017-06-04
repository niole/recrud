module Recruder (
  class Recruder
  , create
  , update
  , remove
  , RelationalOp
  , Primitive
  , Select
  , Filter
  , SelectWhere
  , SelectAccessor
  , Accessor
) where

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

data Select = SelectAccessor | SelectWhere | Primitive

class Recruder a where
  create :: a -> a -> a
  update :: a -> Select -> Filter -> a
  remove :: a -> Filter -> a

instance recruderBoolean :: Recruder Boolean where
  create _ new = new
  update state select _ = state
  remove state filter = state

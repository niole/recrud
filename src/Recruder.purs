module Recruder (
  class Recruder
  , read
  , create
  , update
  , remove
  , Primitive
  , Filter
) where

data Primitive = String | Number | Boolean
type Transformer a = a -> a
type Filter a = a -> Boolean

class Recruder a where
  create :: a -> a
  read :: a -> Filter a -> a
  update :: a -> Transformer a -> Filter a -> a
  remove :: a -> Filter a -> a

instance recruderBoolean :: Recruder Boolean where
  create new = new
  read state _ = state
  update state trans _ = trans state
  remove state _ = state

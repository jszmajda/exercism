{-# LANGUAGE OverloadedStrings #-}

module Forth
  ( ForthError(..)
  , ForthState
  , evalText
  , toList
  , empty
  ) where

import Data.Text (Text)

data ForthError
     = DivisionByZero
     | StackUnderflow
     | InvalidWord
     | UnknownWord Text
     deriving (Show, Eq)

data ForthState = Num a => [a]

data ForthASTNode = Number
                  | ArithOp(..)
                  | StackOp(..)
                  | DefineWordStart
                  | DefineWordEnd
                  | WordName

data ArithOp = Add | Sub  | Div  | Mul
data StackOp = Dup | Drop | Swap | Over

empty :: ForthState
empty = []

evalText :: Text -> ForthState -> Either ForthError ForthState
evalText text stack = combine particles
  where
    combine = map (apply stack particle)
    particles = parse $ unwords text

parse :: [String]

apply :: ForthState -> ForthASTNode -> ForthState
apply stack

toList :: ForthState -> [Int]
toList stack = error "You need to implement this function."

-- Defining types with the "data" construct. Names of types must
-- start with a capital letter.
data Vector2D = Vector2D Double Double

-- You can create a vector as follows:
--   Vector2D 3 4

-- Defining some useful functions on vectors.
vectorLength :: Vector2D -> Double
vectorLength (Vector2D x y) =
  sqrt ((x ^ 2) + (y ^ 2))

addVectors :: Vector2D -> Vector2D -> Vector2D
addVectors (Vector2D x1 y1) (Vector2D x2 y2) =
  Vector2D (x1 + x2) (y1 + y2)

-- Examples of using user defined vectors:
--
--   > vectorLength (Vector2D 3 4)
--   5.0
--   > vectorLength (addVectors (Vector2D 3 0) (Vector2D 0 4))
--   5.0


-- Defining a type with multiple "value constructors".
-- The type declaration is divided into 2 parts. The first part
-- is before the "=" symbol. It consists of the keyword "data"
-- followed by the name of the type being defined. The second
-- part consists of a list of value constructors with each
-- value constructor being separated from the others with the
-- symbol "|". The definition bellow consists of 2 value constructors.
-- The first one is for Circles and the second one is for Rectangles.
-- Each value constructor consists of the name of the constructor
-- which must start with a capital letter followed by the types
-- of the values that the constructor expects. A value constructor
-- can be thought of as a function that when applied returns a
-- value of the type being defined. Circle and Rectangle are not
-- types - they are value constructors that when called produce
-- values of type "Shape".
data Shape = Circle Double Double Double
           | Rectangle Double Double Double Double


-- Functions on Shapes:
shapeArea :: Shape -> Double
shapeArea (Circle _ _ radius) = pi * radius * radius
shapeArea (Rectangle x1 y1 x2 y2) = (x2 - x1) * (y2 - y1)

isRound :: Shape -> Bool
isRound (Circle _ _ _) = True
isRound _ = False

-- Examples of using Shape:
--
--   > shapeArea (Rectangle 0 0 10 10)
--   100.0
--   > shapeArea (Circle 0 0 10)
--   314.1592653589793
--   > isRound (Circle 0 0 10)
--   True
--   > isRound (Rectangle 0 0 10 10)
--   False
--


-- Haskell built-in type Bool:
--
-- data Bool = True | False
--
-- Bool has no argument value constructors True and False.
--
-- Haskell built-in type Maybe:
--
-- data Maybe a = Nothing | Just a
--
-- This definition is different from the ones seen so far. Besides the name
-- of the type beginning defined there is a "type parameter" "a". The idea is
-- that "a" can take on the value of any concrete type. The expression
-- "Maybe a" is called a "type constructor" (not to be confused with value
-- constructors). When a type constructor is passed in a concrete type (like
-- Int) a concrete type is created (like Maybe Int). For more information:
--
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses#type-parameters

-- Example function that uses Maybe:

divide :: Int -> Int -> Maybe Int
divide a 0 = Nothing
divide a b = Just (div a b)

-- Using divide:
--
--   > divide 10 0
--   Nothing
--   > divide 10 3
--   Just 3
--

-- Defining a "recursive" data type for a binary tree.
data Tree a = Empty
            | Node a (Tree a) (Tree a) 

-- Some functions on trees:
treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight (Node a left right) =
  1 + max (treeHeight left) (treeHeight right)

treeSize :: Tree a -> Int
treeSize Empty = 0
treeSize (Node a left right) =
  1 + treeSize left + treeSize right

exampleTree :: Tree Int
exampleTree =
  (Node 5
        (Node 3
              (Node 1 Empty Empty)
              (Node 4 Empty Empty))
        (Node 10
              (Node 7 Empty Empty)
              (Node 11 Empty Empty)))


-- Example usage of the functions above:
--
--   > treeDepth exampleTree
--   3
--   > treeSize exampleTree
--   7


-- Typeclasses are like interfaces in languages like Java and C#.
-- They specify a set of functions that a given type should provide
-- implementations of if it wants to be an instance of the typeclass.
-- 
-- Here are some common typeclasses defined in the Haskell standard library:
--
-- class Eq a where
--   (==) :: a -> a -> Bool
--   (/=) :: a -> a -> Bool
--
-- class Show a where
--   show :: a -> String
--
-- The "Eq" typeclass defines the functions for equality. The types that are
-- instances of this class can be compared using "==" and "/=".
-- 
-- The "Show" typeclass defines how a type should be represented as a String.
-- It does so by requiring instances of the class to implement a function
-- called "show" that converts a value of the type to a String.
--
-- For more information on typeclasses see:
--
--   http://learnyouahaskell.com/making-our-own-types-and-typeclasses#typeclasses-102
--
-- For even more useful information on Haskell typeclasses along with other
-- useful information check out the Haskell Search Engine - Hoogle:
--
--   http://www.haskell.org/hoogle/


-- Making the "Vector2D" type an instance of the "Eq" typeclass.
instance Eq Vector2D where
  (==) (Vector2D x1 y1) (Vector2D x2 y2) =
    x1 == x2 && y1 == y2

-- Making the "Vector2D" type an instance of the "Show" typeclass.
instance Show Vector2D where
  show (Vector2D x y) = "x: " ++ show x ++ " y: " ++ show y


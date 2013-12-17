-- Цялото упражнение - http://learnyouahaskell.com/making-our-own-types-and-typeclasses
-- чрез type, създаваме синоним към даден тип в Haskell
type Product = (String, Double)
 
-- Тук Haskell ще разбере, че Product е просто синоним за (String, Double)
-- Функцията я викаме така : doublePrice ("TV", 100)
doublePrice :: Product -> Product
doublePrice (name, price) = (name, price * 2)


-- Още един пример са зъдаване на синоним 
type Name = String

sayHello :: Name -> String
sayHello name = concat ["Hello ", name, "!"]

-- С ключовата дума data създаваме нов тип в Haskell
-- Синтаксисът е следен:
-- data <ИметоНаТипа> = <ИметоНаValueConstructor-a> <Type> <Type> ...
-- Когато Haskell види Vector2D, последван от два Double-a, ще създаде нов тип Vector2D 
data Vector2d = Vector2d Double Double

-- Ако искате да вкараме Vector2D в TypeClass-a Show (за да може да направим show (Vector2D 5 5))
-- Правим инстанция на Show за типа Vector2D, където описваме част от функцията show
-- С Pattern Matching за нашия тип
instance Show Vector2d where
  show (Vector2d a b) = "Vector2D::" ++ show [a,b]

-- По съшия начин, ако искале да вкараме Vector2D в TypeClass-a Eq, за да може да правим ==
-- Създаваме нова инстанция и описваме как се държи Функцията (==) в случая на два Vector2D-та
instance Eq Vector2d where
  (==) (Vector2d a1 b1) (Vector2d a2  b2) = a1 == a2 && b1 == b2 


addVectors :: Vector2d -> Vector2d -> Vector2d
addVectors (Vector2d x1 y1) (Vector2d x2 y2) = (Vector2d (x1 + x2) (y1 + y2))

-- в Haskell, може да имаме един тип с няколко Value Constructor-a
-- В случая, типът е Shape, а value constructorite са Circle, последван от 1 Double
-- И Triangle, последван от 3 Double-a
data Shape = Circle Double | Triangle Double Double Double

instance Show Shape where
  show (Circle radius) = "I am a circle with a radius of " ++ show radius
  show (Triangle a b c) = "I am triangle with a vector of sides :" ++ show [a,b,c]

instance Eq Shape where
  (==) (Circle r1) (Circle r2) = r1 == r2
  (==) (Triangle a1 b1 c1) (Triangle a2 b2 c2) = [a1, b1, c1] == [a2, b2, c2]
  (==) _ _ = False -- catch-all pattern-a просто казваме, че е False. Не сравняваме кръг с триъгълник

-- Още един пример за това колко е мощен pattern matching-a като имаме custom типове
areaOfShape :: Shape -> Double
areaOfShape (Circle radius) = pi * (radius ^ 2)
areaOfShape (Triangle a b c) = sqrt (p * (p - a) * (p - b) * (p - c))
  where p = (a + b + c) / 2

-- Ако искаме да проверим даден Shape с кой value constructor е направен
-- Отново ползваме Pattern Matching
isTriangle :: Shape -> Bool
isTriangle (Triangle _ _ _) = True
isTriangle _ = False

-- Може да създадем тип, който да има параметър за тип :)
-- Подобен пример е Maybe в Haskell 
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses#type-parameters
-- data Maybe a = Just a | Nothing
-- Just 5 създава тип Maybe Int
divide :: Int -> Int -> Maybe Int
divide a 0 = Nothing
divide a b = Just (div a b)

addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes (Just a) (Just b) = Just (a + b)
addMaybes _ _ = Nothing

-- Тук създаваме рекурсивен тип за репрезентиране на двоично дърво
data Tree a = Empty | Node a (Tree a) (Tree a)

-- Начин за репрезентация на дървото като Strin g
-- > Node 1 (Node 2 Empty Empty) (Node 3 Empty Empty)
-- ((null<--2-->null)<--1-->(null<--3-->null))
instance (Show a) => Show (Tree a) where
  show (Empty) = "null"
  show (Node value left right) = concat ["(", show left, "<--", show value, "-->", show right, ")"]


-- Вмъкване на елемент в двоично наредено дърво
insertInTree :: (Ord a) => a -> (Tree a) -> (Tree a)
insertInTree x Empty = Node x Empty Empty
insertInTree x (Node value left right)
  | x == value = Node x left right
  | x < value  = Node value (insertInTree x left) right
  | otherwise = Node value left (insertInTree x right)

-- Търсене на елемент в двоично наредено дърво
treeSearch :: (Ord a) => a -> (Tree a) -> Bool
treeSearch x Empty = False
treeSearch x (Node value left right)
  | x == value = True
  | x < value = treeSearch x left
  | x > value = treeSearch x right

-- Обхождане на двоичното дървото "ляв-корен-десен"
-- Ако дървото е наредено, това ще изкара елементите сортирани
leftRootRight :: (Tree a) -> [a]
leftRootRight Empty = []
leftRootRight (Node value left right) = (leftRootRight left) ++ [value] ++ (leftRootRight right)

-- Разгледайте и примерите на първа група
-- https://github.com/IvanIvanov/fp2013/blob/master/lab1/lab11-examples.hs

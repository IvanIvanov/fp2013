data BTree = Empty | BTree Int BTree BTree

levelSum :: BTree -> Int -> Int
levelSum Empty _ = 0
levelSum (BTree value left right) level
  | level == 0 = value
  | otherwise  = levelSum left (level - 1) + levelSum right (level - 1)

treeHeight :: BTree -> Int
treeHeight Empty = 0
treeHeight (BTree value left right) =
  1 + max (treeHeight left) (treeHeight right)

isIncreasing :: [Int] -> Bool
isIncreasing [] = True
isIncreasing (x:[]) = True
isIncreasing (x:y:xs)
  | x >= y = False
  | otherwise = isIncreasing (y:xs)

cone :: BTree -> Bool
cone tree =
  isIncreasing (map (levelSum tree) [0..(treeHeight tree - 1)])


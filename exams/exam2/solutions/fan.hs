data BTree = Empty | BTree Int BTree BTree

levelMax :: BTree -> Int -> Int
levelMax Empty _ = 0
levelMax (BTree value left right) level
  | level == 0 = value
  | otherwise  = max (levelMax left (level - 1)) (levelMax right (level - 1))

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

fan :: BTree -> Bool
fan tree =
  isIncreasing (map (levelMax tree) [0..(treeHeight tree - 1)])


data Tree a = Empty
            | Node a (Tree a) (Tree a)

treeLevel :: Tree a -> Int -> [a]
treeLevel Empty level = []
treeLevel (Node x left right) level
  | level == 0 = [x]
  | otherwise = (treeLevel left (level - 1)) ++ (treeLevel right (level - 1))

treeLevels :: Tree a -> [[a]]
treeLevels tree =
  map (\level -> treeLevel tree level) [0..(levels tree)]

levels :: Tree a -> Int
levels Empty = -1
levels (Node x left right) =
  1 + max (levels left) (levels right)


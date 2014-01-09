data Tree a = Empty
            | Node a (Tree a) (Tree a)

treeLevel :: Tree a -> Int -> [a]
treeLevel Empty level = []
treeLevel (Node x left right) level
  | level == 0 = [x]
  | otherwise = (treeLevel left (level - 1)) ++ (treeLevel right (level - 1))


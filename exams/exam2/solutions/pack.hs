pack :: [Int] -> [(Int,Int)]
pack [] = []
pack items@(x:xs) =
  (x, len) : pack (drop len items)
  where len = length (takeWhile (==x) items)


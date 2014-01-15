subsequence :: (Eq a) => [a] -> [a] -> Bool
subsequence items1 items2
  | items1 == [] = True
  | items2 == [] = False
  | head items1 == head items2 = subsequence (tail items1) (tail items2)
  | otherwise = subsequence items1 (tail items2)


prefix :: (Eq a) => [a] -> [a] -> Bool
prefix list1 list2
  | list1 == [] = True
  | list2 == [] = False
  | head list1 == head list2 = prefix (tail list1) (tail list2)
  | otherwise = False


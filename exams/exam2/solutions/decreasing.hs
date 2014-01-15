decreasing :: (Int -> Int) -> Int -> Int -> Bool
decreasing f a b
  | a >= b = True
  | f a > f (a + 1) = decreasing f (a + 1) b
  | otherwise = False


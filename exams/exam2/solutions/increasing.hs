increasing :: (Int -> Int) -> Int -> Int -> Bool
increasing f a b
  | a >= b = True
  | f a < f (a + 1) = increasing f (a + 1) b
  | otherwise = False


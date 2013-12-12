numberToDigitList :: Int -> [Int]
numberToDigitList n
  | n < 10 = [n]
  | otherwise = (numberToDigitList (div n 10)) ++ [rem n 10]


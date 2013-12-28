numbersWith :: Integer -> [Integer]
numbersWith digit =
  filter (\x -> containsDigit x digit) [1..]

containsDigit :: Integer -> Integer -> Bool
containsDigit n digit
  | n == 0            = False
  | rem n 10 == digit = True
  | otherwise         = containsDigit (div n 10) digit


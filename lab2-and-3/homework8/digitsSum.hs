digitsSum :: Integral a => a -> a
digitsSum 0 = 0
digitsSum n = (n `mod` 10) + digitsSum (n `div` 10)

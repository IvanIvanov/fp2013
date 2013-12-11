-- Смятаме лице на триъгълник по формулата на Херон
areaOfTriangle :: Floating a => a -> a -> a -> a
areaOfTriangle a b c = sqrt ( p * (p - a) * (p - b) * (p - c) )
  where
    p = (a + b + c) / 2

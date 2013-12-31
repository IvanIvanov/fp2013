allTheSame :: (Eq a) =>  [a] -> Bool
allTheSame (x:xs) = (sum (map f xs)) == 0
  where 
    f item
      | item == x = 0
      | otherwise = 1

-- първо правим списък от двойките на l1 и l2 с zip
-- след това Map-ваме върху него и преобразуваме всеки tuple
-- от вида (l1, l2) в число равно на length l1 - length l2
-- и накрая проверяваме дали преобразувания списък се състои от еднакви числа
matchLengths :: [[Int]] -> [[Int]] -> Bool
matchLengths l1 l2 = allTheSame $ map (\(x, y) -> diff length x y) $ zip l1 l2
  where
  	diff f xs ys = (f xs) - (f ys)

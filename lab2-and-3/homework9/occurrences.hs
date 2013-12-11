-- връща броя на срещания на n в l
countN :: (Eq a) => a -> [a] -> Int
countN _ [] = 0
countN n l = length $ filter (\x -> x == n) l

-- преобразуваме първия списък като на мястото на всеки елемент
-- слагаме броя на срещанията му в l2
occurrences :: (Eq a) => [a] -> [a] -> [Int]
occurrences l1 l2 = map (\x -> countN x l2) l1

-- Инфиксни функции
-- 5 + 3
-- (+) 5 3
-- calculator 5 5 (+)
--calculator :: (Num a) => a -> a -> (a -> a -> a) -> a
calculator left right oper = oper left right

-- tuples
-- (1,2), fst, snd
-- събираме двойки с числа
addTuples :: (Integral a) => (a,a) -> (a,a) -> (a,a)
addTuples (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- reduce в haskell - foldl / foldr
-- http://www.haskell.org/haskellwiki/Fold
-- foldr ползва рекурсия и може да бъде използван в/у безкрайни списъци
-- foldl ползва опашкова рекурсия и ще зацикли в/у безкрайни списъци
-- http://www.haskell.org/haskellwiki/Foldr_Foldl_Foldl'
-- http://stackoverflow.com/questions/384797/implications-of-foldr-vs-foldl-or-foldl
-- разбира се, имаме sum функция
allTheSame :: (Eq a) =>  [a] -> Bool
allTheSame (x:xs) = (foldl (+) 0 (map f xs)) == 0
  where 
    f item
      | item == x = 0
      | otherwise = 1

-- map / filter / all / any

-- функцията zip
-- да си направим списък с индекси (подобно на map–ването в/у два списъка от scheme)

indexList ::  [a] -> [(a,Int)]
indexList l = zip l [0 .. (length l)]

countN :: (Eq a) => a -> [a] -> Int
countN _ [] = 0
countN n l = length $ filter (\x -> x == n) l

-- взима едноаргументен предикат (функция на 1 аргумент, която връща True / False)
-- връща отрицанието на тази функция
-- fnegate even 2 --> False
-- fnegate even 3 --> True
fnegate :: (t -> Bool) -> (t -> Bool)
fnegate f = (\x -> not (f x))

reject :: (a -> Bool) -> [a] -> [a]
reject f l = filter (fnegate f) l

-- list comprehensions
-- http://learnyouahaskell.com/starting-out#im-a-list-comprehension

-- списък от всички делители на n
devisors n = [x | x <- [1 .. n], n `mod` x == 0]

-- дължина на списък с list comprehension
length' xs = sum [1 | _ <- xs]

-- quickSort чрез list comprehensions
-- може да се напише по-чисто с where клауза
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = (quickSort [less | less <- xs, less < x]) ++ [x] ++ (quickSort [great | great <- xs, great > x])

-- фунцкии, които връшат функции
inInterval :: Int -> (Int -> Int -> Bool)
inInterval n = (\a b -> (a <= n) && (b >= n))

-- Приема първи аргумент низ и втори аргумент списък от низове
-- Връща броя на низовете от списъка
-- Които са пермутация на първият аргумент. Например :
-- countOfPermutations "haskell" ["haskell", "js", "lleksah", "aekshll"]
countOfPermutations :: String -> [String] -> Int
countOfPermutations _ [] = 0
countOfPermutations s l = length $ filter isPermutation l
  where
    sortedS = quickSort s
    isPermutation currentString  = (quickSort currentString) == sortedS 

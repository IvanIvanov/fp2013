import Data.Char

-- Задача:
--
-- Да се дефинира функция, която проверява дали числата в един списък от числа
-- са подредени в строго нарастващ ред.
--
-- increasing [1, 2, 3] -> True
-- increasing [1, 2, 3, 2] -> False
--
increasing :: [Int] -> Bool
increasing items
  | length items <= 1 = True
  | head items < head (tail items) = increasing (tail items)
  | otherwise = False

-- Алтернативна реализация:
increasing2 :: [Int] -> Bool
increasing2 [] = True
increasing2 (x:[]) = True
increasing2 (x:y:xs)
  | x < y = increasing2 (y:xs)
  | otherwise = False


-- Задача:
-- 
-- Да се дефинира функция, която получава като аргумент списък от цели
-- числа и връща като резултат дължината на най-дългата последователност
-- от еднакви съседни цифри във входния списък.
--
-- maxConsecutive [1, 2, 2, 3, 3, 4, 5, 5, 5, 6] -> 3
--
maxConsecutive :: [Int] -> Int
maxConsecutive items
  | items == [] = 0
  | otherwise = max prefix (maxConsecutive (drop prefix items))
  where prefix = consecutivePrefix items

consecutivePrefix :: [Int] -> Int
consecutivePrefix items
  | length items <= 1 = length items
  | head items == head (tail items) = 1 + consecutivePrefix (tail items)
  | otherwise = 1

-- Алтернативно решение:
maxConsecutive2 :: [Int] -> Int
maxConsecutive2 [] = 0
maxConsecutive2 items =
  max prefix (maxConsecutive2 (drop prefix items))
  where prefix = length (takeWhile (==(head items)) items)

-- Задача:
--
-- Да се дефинира фукция, която получава единствен аргумент n и връща
-- безкраен списък от цифрите на всички числа по-големи или равни на n.
--
-- numberDigitsList 42 -> [[4, 2], [4, 3], [4, 4], [4, 5] ...
--
numberDigitsList :: Integer -> [[Integer]]
numberDigitsList n =
  map digits [n..]

digits :: Integer -> [Integer]
digits n
  | n < 10 = [n]
  | otherwise = digits (div n 10) ++ [rem n 10]

-- Задача:
--
-- Да се реши предишната задача но да се върне безкраен списък от цифрите в
-- b-ична бройна система на всички числа по-големи или равни на n.
--
-- numberDigitsListBase 1 2 -> [[1], [1, 0], [1, 1], [1, 0, 0], [1, 0, 1] ...
-- numberDigitsListBase 42 10 -> [[4, 2], [4, 3], [4, 4], [4, 5] ...
--
numberDigitsListBase :: Integer -> Integer -> [[Integer]]
numberDigitsListBase n b =
  map (\x -> digitsBase x b) [n..]

digitsBase :: Integer -> Integer -> [Integer]
digitsBase n b
  | n < b = [n]
  | otherwise = digitsBase (div n b) b ++ [rem n b]

-- Задача:
--
-- Казваме, че една функция, която връща булева стойност е алтернираща в даден
-- целочислен интервал [a, b], ако функционалните стойности в този интервал се
-- редуват от True на False или от False на True.
--
-- Да се дефинира функция, която получава като аргументи функция f и числата a
-- и b и връща като резултат True ако функцията е алтернираща в интервала
-- [a, b] или False в противен случай.
--
-- alternating even 1 10 -> True
-- alternating odd  1 10 -> True
-- alternating (\x -> rem x 3 == 0) 1 10 -> False
--
alternating :: (Int -> Bool) -> Int -> Int -> Bool
alternating f a b =
  alternatingList (map f [a..b])

alternatingList :: [Bool] -> Bool
alternatingList items
  | length items <= 1 = True
  | head items == head (tail items) = False
  | otherwise = alternatingList (tail items)

-- Задача:
--
-- Да се дефинира функция, която получава списък от магьосници и праг на
-- якота (coolness) и връща списък от имената на тези от тях, чиято якота
-- не надхвърля този праг. Един магиосник се моделира с нареда двойка:
--
-- type Wizard = (String, Int)
--
-- Където първият елемент на двойката е името на магьосника, а вторият елемент
-- е неговата вълшебна сила (spell power). Якотата (coolness) на един магьосник
-- е дефинирана така:
--
-- coolness(w) = (spellPower(w) * vowels(name(w))) / (1 + consonants(name(w)))
--
-- uncoolWizards [("Foo", 10), ("Bar", 10)] 5 -> ["Bar"]

-- NB - Да се добави в началото на файла с решението!
-- import Data.Char

type Wizard = (String, Int)

uncoolWizards :: [Wizard] -> Int -> [String]
uncoolWizards wizards coolnessThreshold =
  map fst (filter (\w -> coolness w <= coolnessThreshold) wizards)

coolness :: Wizard -> Int
coolness wizard =
  div num den
  where num = (snd wizard) * (vowels (fst wizard))
        den = 1 + consonants (fst wizard)

vowels :: String -> Int
vowels str =
  length (filter isVowel str)

isVowel :: Char -> Bool
isVowel ch =
  elem (toLower ch) "aeiouy"

consonants :: String -> Int
consonants str =
  length (filter isConsonant str)

isConsonant :: Char -> Bool
isConsonant ch =
  elem (toLower ch) "bcdfghjklmnpqrstvwxz"

-- Задача:
--
-- Едно бинарно дърво се нарича нечетно-четно ако броят на елементите в
-- отделните му нива се редуват - нечетен, четен, нечетен, четен и т.н.
--
-- Да се дефинира функция, която получава бинарно дърво и връща True ако
-- то е нечетно-тетно или False в противен случай.
--
-- oddEvenTree Empty -> True
-- oddEvenTree (BTree 1 (BTree 2 Empty Empty) (BTree 3 Empty Empty)) -> True
-- oddEvenTree (BTree 1 (BTree 2 Empty Empty) Empty) -> False
--
data BTree = Empty | BTree Int BTree BTree

oddEvenTree :: BTree -> Bool
oddEvenTree tree =
  oddEvenList (levelSizes tree)

oddEvenList :: [Int] -> Bool
oddEvenList [] = True
oddEvenList (x:[]) = odd x
oddEvenList (x:y:xs)
  | odd x && even y = oddEvenList xs
  | otherwise = False

levelSizes :: BTree -> [Int]
levelSizes tree =
  map (levelSize tree) [0..(treeHeight tree - 1)]

treeHeight :: BTree -> Int
treeHeight Empty = 0
treeHeight (BTree value left right) =
  1 + max (treeHeight left) (treeHeight right)

levelSize :: BTree -> Int -> Int
levelSize Empty level = 0
levelSize (BTree value left right) level
  | level == 0 = 1
  | otherwise = levelSize left (level - 1) + levelSize right (level - 1)



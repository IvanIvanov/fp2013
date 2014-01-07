--isIncreasing [1,2,3,4,5] -- True
--isIncreasing [1,2,6,3] -- False
--isIncreasing [1,2,2,6] -- True
isIncreasing :: (Ord a) => [a] -> Bool
isIncreasing [] = True
isIncreasing [x] = True
isIncreasing (x:y:xs) = x <= y && isIncreasing (y:xs)

isDecreasing :: (Ord a) => [a] -> Bool
isDecreasing [] = True
isDecreasing [x] = True
isDecreasing (x:y:xs) = x >= y && isDecreasing (y:xs)

-- безкраен поток от дадено число нататък
-- без да използваме [a..]
infiniteStreamFrom :: Int -> [Int]
infiniteStreamFrom start = [start] ++ infiniteStreamFrom (start + 1) 

-- безкраен потокм, който връща четните числа от дадено число до безкрайност
-- може да филтрираме безкрайните потоци
evenNumbersStream :: Int -> [Int]
evenNumbersStream start = filter even (infiniteStreamFrom start)

-- безкраен поток, който връща сумата на всички цифри от дадено число нататък
-- може да map-ваме безкрайните потоци
sumOfNumbersStream :: Int -> [Int]
sumOfNumbersStream start = map (\x -> sumNumbers x) (infiniteStreamFrom start)
  where
    sumNumbers 0 = 0
    sumNumbers n = (n `mod` 10) + sumNumbers (n `div` 10)

-- безкраен поток, който връща на мястото на всяко число, двоичната репрезентация на числото от дадено начало
streamOfBinaryRepresentation :: Int -> [String]
streamOfBinaryRepresentation start = map toBinaryString (infiniteStreamFrom start)

toBinaryString :: Int -> String
toBinaryString n = reverse $ breakDown n
  where
    breakDown 0 = ""
    breakDown n = (show (n `mod` 2) ) ++ breakDown (n `div` 2)

substring :: String -> String -> Bool
substring _ [] = False
substring needle heystack@(x:xs)
  | prefix needle heystack  = True
  | otherwise = substring needle xs
  where
    prefix a b = a == (take (length a) b)

-- имплементация на group :: (Eq a) => [a] -> [[a]]
group' :: (Eq a) => [a] -> [[a]]
group' [] = []
group' l@(x:xs) = [ takeWhile (\item -> item == x) l ] ++ group' (dropWhile (\item -> item == x) l)

type Person = (String, Double) -- Име, Килограми

-- всеки човек го оценяваме по следния начин
-- брой на срещания на "a" в името * корен-квадратен от килограмите 
scorePerson :: Person -> Double
scorePerson (name, kg) = (count 'a' name) * (sqrt kg)
  where
    count needle xs = sum $ map (\x -> if x == needle then 1 else 0) xs

-- смятаме сумарния score на всички хора от списъка
fitnessOwner :: [Person] -> Double
fitnessOwner people = sum $ map scorePerson people

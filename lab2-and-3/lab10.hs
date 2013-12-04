-- Използваме, за да достъпим функцията toUpper :: Char -> Char
import Data.Char
 
-- връща дължината на списъка
-- има си вградена функция length
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

-- Проверява дали елемент от тип a е в списък с елементи от тип a
-- Прочетете http://learnyouahaskell.com/types-and-typeclasses
member' :: (Eq a) => a -> [a] -> Bool
member' _ [] = False
member' search (x:xs)
    | x == search = True
    | otherwise = member' search xs

-- добавя елемент в края на списъка
-- има два варианта
addLast :: a -> [a] -> [a]
addLast toAddLast l = l ++ [toAddLast]

-- вариант 2 на addLast
addLast' :: a -> [a] -> [a]
addLast' toAddLast l = reverse (toAddLast : reverse l)

-- връща ни най-големият елемент от списъка.
-- Тук използваме TypeClass-a Ord
-- error е специална функция от вида [Char] -> a, чрез която изкарваме грешка 
maxOfList :: (Ord a) => [a] -> a
maxOfList [] = error "Empty list"
maxOfList [x] = x
maxOfList (x:xs) = max x (maxOfList xs)

-- имплементация на maxOfList чрез опашкова рекурсия
-- използваме специалната where конструкция
-- за where синтаксис, може да прочетете тук - http://learnyouahaskell.com/syntax-in-functions
maxOfList' :: (Ord a) => [a] -> a
maxOfList' [] = error "Empty list"
maxOfList' (x:xs) = iter x xs
  where
    iter res [] = res
    iter res (x:xs) = iter (max res x) xs      

-- Може да използваме where клаузата не само за създаване на локални функции
-- А и локални параметри, които да използваме
areaOfCircle :: Fractional a => a -> a
areaOfCircle r = myPi * radiusSquared
  where
    myPi = 22 / 7
    radiusSquared = r^2

-- toUpper се дефинира като Char -> Char,
-- така че map-ваме функцията върху стринга
-- initials "Radoslav" "Georgiev" -> "RG" 
initials :: String -> String -> String
initials first second = map toUpper ([head first] ++ [head second])

-- Тук в where Клаузата използваме pattern matching
-- в first ще бъде първият елемент от резултатът на words name
-- в second ще бъде вторият елемент
-- в xs ще бъде останала част от списъка
-- initials' "Radoslav Georgiev" -> "RG"
initials' name = initials first second
  where
    (first : second : xs) = words name
                                           
-- Haskell поддържа функцията (!!), която може да се ползва и като инфиксен оператор
-- Тази функция връща елемент на списък по даден индекс (0 based)                
elementAt :: [a] -> Int -> a
elementAt l index = l !! index 
  
-- Генерираме безкраен списък от start до безкрайност
-- Тъй като Haskell оценява мързеливо, може да си позволим безкрайна рекурсия
-- Ползвайте го с take 10 (infiniteRange)
infiniteRange :: Num a => a -> [a]
infiniteRange start = [start] ++ infiniteRange (start + 1)

-- Функцията взима число n и връща списък с първите n числа на Фибоначи
-- Използва infiniteFib, която генерира безкраен списък с числата на Фибоначи
-- И взима първите n
fib :: Int -> [Integer]
fib n = take n ( infiniteFib )

-- Генерира безкраен списък с числата на Фибоначи
infiniteFib = [1,1] ++ fib' 1 1
  where
    fib' a b = [a+b] ++ fib' b (a + b)

-- слепя цифрите a и b в числото ab
glueInts :: Int -> Int -> Int
glueInts a b = a * 10 + b

-- използваме reduce, за да свалим списъка до едно число
-- в случая на Haskell reduce-a е foldl (fold-left)
-- foldl има следната сигнатура - foldl :: (a -> b -> a) -> a -> [b] -> a
listToNumber :: [Int] -> Int
listToNumber l = foldl glueInts 0 l

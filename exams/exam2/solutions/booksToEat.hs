import Char

type Book = (String, Int)

score :: Book -> Int
score book =
  div num den
  where num = (snd book) * (vowels (fst book))
        den = length (fst book)

vowels :: String -> Int
vowels str =
  length (filter isVowel str)

isVowel :: Char -> Bool
isVowel ch =
  elem (toLower ch) "aeiouy"

booksToEat :: [Book] -> Int -> [String]
booksToEat books n =
  map fst (filter (\b -> score b >= n) books)


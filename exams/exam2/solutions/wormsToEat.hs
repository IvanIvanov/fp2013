import Char

type Worm = (String, Int)

score :: Worm -> Int
score worm =
  div num den
  where num = (snd worm) * (length (fst worm))
        den = (consonants (fst worm))

consonants :: String -> Int
consonants str =
  length (filter isConsonant str)

isConsonant :: Char -> Bool
isConsonant ch =
  elem (toLower ch) "bcdfghjklmnqrstvwxz"

wormsToEat :: [Worm] -> Int -> [String]
wormsToEat worms n =
  map fst (filter (\w -> score w >= n) worms)


removeAt :: Int -> [a] -> [a]
removeAt 0 (_:xs) = xs
removeAt index l
  | (index >= length l) || index < 0  = error "Index out of bounds"
  | otherwise = concatTogether $ splitAt index l
  where
  	  concatTogether (firstPart, (_:xs)) = firstPart ++ xs
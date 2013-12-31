import Data.List -- for sort
import Data.Char -- for toLower

maxOfListOfTupples (x:xs) = inner x xs
  where
  	inner result [] = result
  	inner result (y:ys) = inner (maxOfTuples result y) ys 
  	maxOfTuples (x1, y1) (x2, y2)
  		| y1 > y2 = (x1,y1)
  		| otherwise = (x2, y2)


letterOfTheMost :: [String] -> (Char, Int)
letterOfTheMost [] = error "Empty list"
letterOfTheMost l = maxOfListOfTupples $ map (\x -> (head x, length x) ) groupedAndSorted
  where
  	  toLowerCase l = map toLower l
  	  groupedAndSorted = group $ sort $ toLowerCase $ foldl (++) "" l
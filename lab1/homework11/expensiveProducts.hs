type Product = (String, Double)

expensiveProducts :: [Product] -> [String]
expensiveProducts products =
  map fst (filter (\x -> snd x > mean) products)
  where mean = average (map snd products)

average :: [Double] -> Double
average [] = 0.0
average values = (sum values) / (fromIntegral (length values))


-- проверяваме дали l1 е префикс на l2
prefix :: Eq a => [a] -> [a] -> Bool
prefix l1 l2 = (take (length l1) l2) == l1

-- задачката за суфикс се свежда до задачката за префикс
-- след като обърнем списъците :)
suffix :: Eq a => [a] -> [a] -> Bool
suffix l1 l2 = prefix (reverse l1) (reverse l2)

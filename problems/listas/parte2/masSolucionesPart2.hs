{- Problem 12 -}
decodeModified' :: Eq a => [ListItem a] -> [a]
decodeModified' = foldl (\acc e -> case e of Single x -> acc ++ [x]; Multiple n x -> acc ++ replicate n x) []

{- Problem 14 -}
dupli' :: Eq a => [a] -> [a]
dupli' [x] = x : [x]
dupli' (x:xs) = (replicate 2 x) ++ (dupli' xs)

dupli'' :: Eq a => [a] -> [a]
dupli'' [] = []
dupli'' (x:xs) = x:x: dupli'' xs

dupli''' :: Eq a => [a] -> [a]
dupli''' = foldl (\acc x -> acc ++ [x,x]) []

{- Problem 15 -}
repli' :: [a] -> Int -> [a]
repli' ls n = foldl (\acc x -> acc ++ replicate n x) [] ls

repli'' :: [a] -> Int -> [a]
repli'' [] _ = []
repli'' (x:xs) n = (repliHelper n x) ++ (repli'' xs n)
  where
    repliHelper n c = take n (cycle [c])

repli''' :: [a] -> Int -> [a]
repli''' xs n = concatMap (take n . repeat) xs

{- Problem 18 -}
slice' :: [a] -> Int -> Int -> [a]
slice' [] _ _  = []
slice' (x:xs) i k
 | i > 1      = slice' xs (i - 1) (k - 1)
 | k < 1      = []
 | otherwise  = x:slice' xs (i - 1) (k - 1)

import Data.List

{- Problem 11 -}
data ListItem a = Single a | Multiple Int a
    deriving (Show)

{-Solucion de la pagina -}
encodeModified :: Eq a => [a] -> [ListItem a]
encodeModified = map encodeHelper . encode
  where
    encodeHelper (1, x) = Single x
    encodeHelper (n, x) = Multiple n x

{- Problem 12 -}
decodeModified :: Eq a => [ListItem a] -> [a]
decodeModified = concatMap decoder
  where 
    decoder (Single x) = [x]
    decoder (Multiple n x) = replicate n x

{- Problem 13 -}
contador :: Eq a => a -> [a] -> Int
contador c = foldr (\x acc -> if x == c then acc + 1 else acc) 0

directEncode :: Eq a => [a] -> [ListItem a]
directEncode [] = []
directEncode [x] = [Single x]
directEncode (x:xs)
  | contador x (x:xs) <= 1 = [Single x] ++ directEncode (directHelper x (x:xs))
  | otherwise = [Multiple (contador x (x:xs)) x] ++ directEncode (directHelper x (x:xs))
  where
    directHelper c ls = drop (contador c ls) ls

{- Problem 14 -}
dupli :: Eq a => [a] -> [a]
dupli = concatMap (replicate 2)

{- Problem 15 -}
repli :: [a] -> Int -> [a]
repli [] _ = []
repli (x:xs) n = (replicate n x) ++ (repli xs n)

{- Problem 16 -}
dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery ls n = (take (n - 1) ls) ++ dropEvery (drop n ls) n

{- Problem 17 -}
split :: [a] -> Int -> ([a], [a])
split ls n = ((take n ls) , (drop n ls))

{- Problem 18 -}
slice :: [a] -> Int -> Int -> [a]
slice ls i k | i > 1 = take (k - i + 1) (drop (i - 1) ls)

{- Problem 19 -}
rotate :: [a] -> Int -> [a]
rotate ls 0 = ls
rotate ls n 
  | n > 0 = (drop n ls) ++ (take n ls)
  | otherwise = (drop ((length ls) + n) ls) ++ (take ((length ls) + n) ls)

{- Problem 20 -}
removeAt :: [a] -> Int -> (a, [a])
removeAt ls n = (ls !! (n - 1) , (removeHelper (zip ls [1..]) n))
  where
    removeHelper ls n = map fst (filter (not . (==) n . snd) ls)

{- Problem 1 -}
myLast :: [a] -> a
myLast = head . reverse

{- Problem 2 -}
lastButOne :: [a] -> a
lastButOne = head . reverse . init

{- Problem 3 -}
kElement :: [a] -> Int -> a
kElement [] _ = error "lista vacia"
kElement ls k = ls !! (k - 1)

{- Problem 4 -}
myLength :: [a] -> Int
myLength [] = 0
myLength [x] = 1
myLength (_:xs) = (+) 1 (myLength xs)

{- Problem 5 -}
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

{- Probelm 6 -}
palindrome :: Eq a => [a] -> Bool
palindrome ls = ls == reverse ls

{- Problem 7 -}
{-Nota no pude sacar la manera y las soluciones son las que me parecieron que iba a entender-}
data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List []) = []

{- Problem 8 -}
compress' :: Eq a => [a] -> [a]
compress' [] = []
compress' [x] = [x]
compress' (x:xs)
  | x == (head xs) = compress' xs
  | otherwise = [x] ++ (compress' xs)

{- Problem 9 -}
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x:xs) = (x : takeWhile (==x) xs) : pack (dropWhile (==x) xs)

{- Problem 10 -}
encode :: Eq a => [a] -> [(Int, a)]
encode ls = zip (map length (pack ls)) (compress' ls)

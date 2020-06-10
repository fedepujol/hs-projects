{- Problem 1 -}
myLast :: [a] -> a
myLast = head $ reverse

{- Problem 2 -}
lastButOne :: [a] -> a
lastButOne = head . reverse . init

lastButOne' :: [a] -> a
lastButOne' = last . init

lastButOne'' :: [a] -> a
lastButOne'' ls = last $ take (length ls - 1) ls

lastButOne''' :: [a] -> a
lastButOne''' [x,_] = x
lastButOne''' (_:xs) = lastButOne''' xs

{- Problem 3 -}
kElement :: [a] -> Int -> a
kElement [] _ = error "lista vacia"
kElement ls k = ls !! (k - 1)

kElement' :: [a] -> Int -> a
kElement' (x:_) 1 = x
kElement' [] _ = error "Empty list"
kElement' (_:ls) k
  | length ls < k = error "List out of bounds"
  | otherwise = kElement' ls (k - 1)

{- Crea una lista de tuplas -}
kElement'' :: [a] -> Int -> a
kElement'' ls k
  | length ls < k = error "List out of bounds!"
  | otherwise = fst . last $ zip ls [1..k]

{- Problem 4 -}
myLength :: [a] -> Int
myLength [] = 0
myLength [x] = 1
myLength (_:xs) = (+) 1 (myLength xs)

{- Cambia todos los elementos de la lista a 1 y despues los suma -}
myLength' :: [a] -> Int
myLength' = sum . map (\_ -> 1)

{- Problem 5 -}
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

{-Solucion de la pagina-}
myReverse' :: [a] -> [a]
myReverse' ls = reverser ls []
  where 
    reverser [] reversed = reversed
    reverser (x:xs) reversed = reverser xs (x:reversed)

{- Probelm 6 -}
palindrome :: Eq a => [a] -> Bool
palindrome ls = ls == reverse ls

{-Soluciones de la pagina-}
palindrome' [] = True
palindrome' [_] = True
palindrome' ls = (head ls) == (last ls) && (palindrome' $ init $ tail ls)

{- Problem 7 -}
{-Nota no pude sacar la manera y las soluciones son las que me parecieron que iba a entender-}
data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List []) = []

flatten' :: NestedList a -> [a]
flatten' (Elem x) = [x]
flatten' (List xs) = foldr (++) [] $ map flatten' xs

{- Problem 8 -}
{- Nota (esta manera deja nada mas los elementos unicos)-}
compress :: Eq a => [a] -> [a]
compress [] = []
compress (x:xs)
  | x `elem` xs = compress xs
  | otherwise = [x] ++ (compress xs)

{- Nota (esta hace lo que quiere el enunciado)-}
compress' :: Eq a => [a] -> [a]
compress' [] = []
compress' [x] = [x]
compress' (x:xs)
  | x == (head xs) = compress' xs
  | otherwise = [x] ++ (compress' xs)

{-Soluciones de la pagina-}
compress'' :: Eq a => [a] -> [a]
compress'' = map head . group

compress''' :: Eq a => [a] -> [a]
compress''' x = foldr (\a b -> if a == (head b) then b else a:b) [head x] x

{- Problem 9 -}
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x:xs) = (x : takeWhile (==x) xs) : pack (dropWhile (==x) xs)

pack' :: Eq a => [a] -> [[a]]
pack' [] = []
pack' [x] = [[x]]
pack' (x:xs) = if x `elem` (head (pack xs))
  then (x:(head (pack xs))) : (tail (pack xs))
  else [x] : (pack xs)

{- Problem 10 -}
encode :: Eq a => [a] -> [(Int, a)]
encode ls = zip (map length (pack ls)) (compress' ls)

{- Soluciones de la pagina -}
encode' :: Eq a => [a] -> [(Int, a)]
encode' ls = [(length x, head x) | x <- group ls]

encode'' :: Eq a => [a] -> [(Int, a)]
encode'' = map (\x -> (length x, head x)) . group

encode''' :: Eq a => [a] -> [(Int, a)]
encode''' = map ((,) <$> length <*> head) . pack

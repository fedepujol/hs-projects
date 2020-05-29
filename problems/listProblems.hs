{- Problem 2 (Find the last but one element of a list -}
lastButOne :: [a] -> a
lastButOne = head . reverse . init

lastButOne' :: [a] -> a
lastButOne' = last . init

lastButOne'' :: [a] -> a
lastButOne'' ls = last $ take (length ls - 1) ls

lastButOne''' :: [a] -> a
lastButOne''' [x,_] = x
lastButOne''' (_:xs) = lastButOne''' xs

{- Problem 3 (Find the k-th element of a list -}
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

{- Problem 4 (Find the number of length of a list) -}
myLength :: [a] -> Int
myLength [] = 0
myLength [x] = 1
myLength (_:xs) = (+) 1 (myLength xs)

{- Cambia todos los elementos de la lista a 1 y despues los suma -}
myLength' :: [a] -> Int
myLength' = sum . map (\_ -> 1)

{- Problem 5 (Revese a list) -}
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myReverse' :: [a] -> [a]
myReverse' ls = reverser ls []
  where 
    reverser [] reversed = reversed
    reverser (x:xs) reversed = reverser xs (x:reversed)

{- Probelm 6 (Palindrome) -}
palindrome :: Eq a => [a] -> Bool
palindrome ls = ls == reverse ls

palindrome' [] = True
palindrome' [_] = True
palindrome' ls = (head ls) == (last ls) && (palindrome' $ init $ tail ls)
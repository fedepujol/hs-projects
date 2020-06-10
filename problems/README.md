## Problem 1
Find the last element of a list
```haskell
λ> myLast [1,2,3,4]
4
λ> myLast ['x','y','z']
'z'
```

## Problem 2
Find the last but one element of a list.
```haskell
λ> myButLast [1,2,3,4]
3
λ> myButLast ['a'..'z']
'y'
```

## Problem 3
Find the K'th element of a list. The first element in the list is number 1.
```haskell
λ> elementAt [1,2,3] 2
2
λ> elementAt "haskell" 5
'e'
```

## Problem 4
Find the number of elements of a list.
```haskell
λ> myLength [123, 456, 789]
3
λ> myLength "Hello, world!"
13
```

## Problem 5
Reverse a list.
```haskell
λ> myReverse "A man, a plan, a canal, panama!"
"!amanap ,lanac a ,nalp a ,nam A"
λ> myReverse [1,2,3,4]
[4,3,2,1]
```

## Problem 6
Find out whether a list is a palindrome. A palindrome can be read forward or backward.
```haskell
λ> isPalindrome [1,2,3]
False
λ> isPalindrome "madamimadam"
True
λ> isPalindrome [1,2,4,8,16,8,4,2,1]
True
```

## Problem 7
Flatten a nested list structure.
```haskell
λ> flatten (Elem 5)
[5]
λ> flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
[1,2,3,4,5]
λ> flatten (List [])
[]
```

You have to define a new data type, because lists in Haskell are homogeneous:
```haskell
 data NestedList a = Elem a | List [NestedList a]
```

## Problem 8
Eliminate consecutive duplicates of list elements.
```haskell
λ> compress "aaaabccaadeeee"
"abcade"
```

## Problem 9
Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.
```haskell
λ> pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
["aaaa","b","cc","aa","d","eeee"]
```

## Problem 10
Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
```haskell
λ> encode "aaaabccaadeeee"
[(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
```

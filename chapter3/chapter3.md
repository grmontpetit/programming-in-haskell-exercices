## Chapter 3 - Types and Classes

### Exercices

1. What are the types of the following values ?

    `['a','b','c']` -> `['a','b','c'] :: [Char]`

    `('a', 'b', 'c')` -> `('a', 'b', 'c') :: (Char,Char,Char)`

    `[(False, '0'),(True, '1')]` -> `[(False, '0'),(True, '1')] :: [(Bool,Char)]`

    `([False, True],['0', '1'])` -> `([False, True],['0', '1']) :: ([Bool],[Char])`

    `[tail, init, reverse]` -> `[tail, init, reverse] :: [[a] -> [a]]`

2. Write down definitions that have the following types; it does not matter what the definitions actually do as long as they are type correct.

    `bools :: [Bool]` -> `[False,True]`

    `nums :: [[Int]]` -> `[[1, 2], [3, 4], [5, 6]]`

    `add :: Int -> Int -> Int -> Int` -> `1 + 2 + 3 + 4`

    `copy :: a -> (a,a)` -> `(1, 1)`

    `apply :: (a -> b) -> a -> b` -> `a b`

3. What are the types of the following functions ?

    `second xs = head (tail xs)` -> `[a] -> a`

    `swap (x,y) = (y,x)` ->  `(t1,t) -> (t,t1)`

    `pair x y = (x,y)` -> `t1 -> t -> (t, t1)`

    I think this function's argument are inferred because of the multiplcation sign:

    `double x = x*2` -> `Num a => a -> a`

    this one confused me a little bit:

    `palindrome xs = reverse xs == xs` -> `Eq a => [a] -> Bool`

    `twice f x = f (f x)` -> `(t -> t) -> t -> t`

    Hint: take care to include the necessary class constaints in the types if the functions are defined using overloaded operators.

4. Check your answers to the preceding three questions GHCi.

    Done, see above.

5. Why is it not feasible in general for function types to be instances of the `Eq` class ? Hint: two functions of the same type are equal if they always return equal results for equal arguments.

    I would assume that's because the arguments change the type of the functions because type inference. In other words, functions are too generic to be able to compare their types. If we look at the function `init`, it can be applied to a list of `Int` as well as a list of `Char`; the definition would be `[a] -> [a]`, this would not be possible because `a` could be an `Int` or a `Char`.
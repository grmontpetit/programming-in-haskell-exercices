# programming-in-haskell-exercices
This repository is just meant as a way to store the exercises contained in "Programming in Haskell" by Graham Hutton (2nd edition).

Note: Code blocks with **haskell** mean that it was loaded inside a haskell script (`.hs` file) while code blocks with **GHCi** means it was evaluated with the interactive prompt `ghci`.

## Chapter 1
Solved using GHCi:

```GHCi
load chapter1/chapter1.hs
```

1. Give another possible calculation for the result of `double (double 2)`. Note: use the substitution method.

    ```haskell
    double (double 2)
    double (2 + 2)
    (2 + 2) + (2 + 2)
    4 + (2 + 2)
    4 + 4
    8
    ```
    or
    ```haskell
    double (double 2)
    (double 2) + (double 2)
    (double 2) + (2 + 2)
    (double 2) + 4
    (2 + 2) + 4
    8
    ```

2. Show that `sum [x] = x` for any number `x`. Note: think recursively.

    ```haskell
    sum [x]
    x + sum[]
    x + 0
    x
    ```

3. Define a function `product` that produces the product of a list of numbers, and show using your definition that `product [2,3,4] = 24`.

    My solution with guarded equations:

    ```haskell
    prod xs | length xs > 1  = head xs * prod (tail xs)
            | length xs == 1 = head xs
            | otherwise      = 0
    ```

    Another solution with pattern matching and guarded equations:

    ```haskell
    prod2 [] = 0
    prod2 (x:xs) | length xs /= 0 = x * prod2 xs
                 | otherwise      = x
    ```

4. How should the definition of the function `qsort` be modified so that it produces a *reverse* sorted version of a list ?

    Original `qsort` definition:

    ```haskell
    qsort []     = []
    qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
                   where
                      smaller = [a | a <- xs, a <= x]
                      larger  = [b | b <- xs, b > x]
    ```

    Solution was to invert `smaller` and `larger` and make sure to call the `rqsort` function:

    ```haskell
    rqsort []     = []
    rqsort (x:xs) = rqsort larger ++ [x] ++ rqsort smaller
                    where
                       smaller = [a | a <- xs, a <= x]
                       larger  = [b | b <- xs, b > x]
    ```

5. What would be the effect of replacing `<=` by `<` in the original definition of `qsort` ? Hint: Consider the example `qsort [2,2,3,1,1]`

    Original `qsort` definition:

    ```haskell
    qsort []     = []
    qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
                   where
                      smaller = [a | a <- xs, a <= x]
                      larger  = [b | b <- xs, b > x]
    ```

    When replacing <= by < in `qsort` we get this new function:

    ```haskell
    mqsort []     = []
    mqsort (x:xs) = mqsort smaller ++ [x] ++ mqsort larger
                    where
                       smaller = [a | a <- xs, a < x]
                       larger  = [b | b <- xs, b > x]
    ```

    Using GHCi we can test it:

    ```GHCi
    *Main> mqsort [2,2,3,1,1]
    [1,2,3]
    ```

    We can see that any duplicated values are removed. This happens because when x is equal to a, we don't keep that value inside the local definition of `mqsort`.

## Chapter 2

1. Work through the examples from this chapter using GHCi.

   ```GHCi
   *Main> 2+3*4
    14
    *Main> (2+3)*4
    20
    *Main> sqrt (3^2 + 4^2)
    5.0
    *Main> head [1,2,3,4,5]
    1
    *Main> tail [1,2,3,4,5]
    [2,3,4,5]
    *Main> [1,2,3,4,5] !! 2
    3
    *Main> take 3 [1,2,3,4,5]
    [1,2,3]
    *Main> drop 3 [1,2,3,4,5]
    [4,5]
    *Main> length [1,2,3,4,5]
    5
    *Main> sum [1,2,3,4,5]
    15
    *Main> product [1,2,3,4,5]
    120
    *Main> [1,2,3] ++ [4,5]
    [1,2,3,4,5]
    *Main> reverse [1,2,3,4,5]
    [5,4,3,2,1]

    *Main> :load chapter1
    [1 of 1] Compiling Main             ( chapter1.hs, interpreted )
    Ok, modules loaded: Main.
    *Main> quadruple 10
    40
    *Main> take (double 2) [1,2,3,4,5]
    [1,2,3,4]
    *Main> factorial 10
    3628800
    *Main> average [1,2,3,4,5]
    3
   ```

2. Parenthesise the following numeric expressions:

    `2^3*4`

    ```GHCi
    *Main> 2^3*4
    32
    *Main> (2^3)*4
    32
    *Main> (2^3*4)
    32
    ```

    `2*3+4*5`

    ```GHCi
    *Main> 2*3+4*5
    26
    *Main> (2*3)+(4*5)
    26
    *Main> 2*(3+4)*5
    70
    *Main> 2*(3+4*5)
    46
    *Main> (2*3+4)*5
    50
    ```

    `2+3*4^5`

    ```GHCi
    *Main> 2+3*4^5
    3074
    *Main> (2+3)*4^5
    5120
    *Main> 2+(3*(4^5))
    3074
    ```

3. The script below contains three syntactic errors. Correct theses errors and then check that your script works properly using GHCi.

    Original script:

    ```haskell
    N = a `div` length xs
        where
            a = 10
            xs = [1,2,3,4,5]
    ```

    Corrected script:

    ```haskell
    n = a `div` length xs
        where
            a = 10
            xs = [1,2,3,4,5]
    ```

4. The library function `last` selects the last element of a non-empty list; for example, `last [1,2,3,4,5] = 5`. Show how the function `last` could be defined in terms of the other library functions introduced in this chapter. Can you think of another possible definition ?

    Using `last` on a list:

    ```GHCi
    *Main> last [1,2,3,4,5]
    5
    ```

    Another definition of last:

    ```haskell
    mlast [] = error "mlast called on empty list."
    mlast xs = xs !! (length xs - 1)
    ```

    Executing the above script:

    ```GHCi
    *Main> mlast []
    *** Exception: mlast called on empty list.
    CallStack (from HasCallStack):
      error, called at chapter2.hs:13:12 in main:Main
    *Main> mlast [1,2,3,4,5,7,8]
    8
    ```


5. The library function `init` removes the last element from a non-empty list; for example, `init [1,2,3,4,5] = [1,2,3,4]`. Show how `init` could similarly be defined in two different ways.

    Using `init` on `[1,2,3,4,5]`:

    ```GHCi
    *Main> init [1,2,3,4,5]
    [1,2,3,4]
    ```

    3 modified `init`functions:

    ```haskell
    -- 1st version of a modified init
    m1init [] = []
    m1init xs = reverse (drop 1 (reverse xs))

    -- 2nd version of a modified init
    m2init [] = []
    m2init xs = take (length xs - 1) xs

    -- 3rd version of a modified init
    m3init [] = []
    m3init xs = fst (splitAt (length xs - 1) xs)
    ```

## Chapter 3

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

    -- I think this function's argument are inferred because of the multiplcation sign

    `double x = x*2` -> `Num a => a -> a`

    -- this one confused me a little bit

    `palindrome xs = reverse xs == xs` -> `Eq a => [a] -> Bool`

    `twice f x = f (f x)` -> `(t -> t) -> t -> t`

    Hint: take care to include the necessary class constaints in the types if the functions are defined using overloaded operators.

4. Check your answers to the preceding three questions GHCi.

    Done, see above.

5. Why is it not feasible in general for function types to be instances of the `Eq` class ? Hint: two functions of the same type are equal if they always return equal results for equal arguments.

    I would assume that's because the arguments change the type of the functions because type inference. In other words, functions are too generic to be able to compare their types. If we look at the function `init`, it can be applied to a list of `Int` as well as a list of `Char`; the definition would be `[a] -> [a]`, this would not be possible because `a` could be an `Int` or a `Char`.

## Chapter 4
Chapter content:

- Conditional expressions
- Guarded equations
- Pattern matching
- Lambda expressions
- Operator sections

[Exercices](chapter4/chapter4.md)

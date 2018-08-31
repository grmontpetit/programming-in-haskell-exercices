# programming-in-haskell-exercices
This repository is just meant as a way to store the exercises contained in "Programming in Haskell" by Graham Hutton (2nd edition).

## Chapter 1

1. Give another possible calculation for the result of double (double 2)

2. Show that `sum [x] = x` for any number `x`.

3. Define a function `product` that produces the product of a list of numbers, and show using your definition that `product [2,3,4] = 24`.

4. How should the definition of the function `qsort` be modified so that it produces a *reverse* sorted version of a list ?

5. What would be the effect of replacing <= by < in the original definition of `qsort` ? Hint: Consolder the example `qsort [2,2,3,1,1]`


## Chapter 2

1. Work through the examples from this chapter using GHCi.

2. Parenthesise the following numeric expressions:

    `2^3*4`
    `2*3+4*5`
    `2+3*4^5`

3. The script below contains three syntactic errors. Correct theses errors and then check that your script works properly using GHCi.

    ```haskell
    N = a `div` length xs
        where
            a = 10
            xs = [1,2,3,4,5]
    ```

4. The library function `last` selects the last element of a non-empty list; for example, `last [1,2,3,4,5] = 5`. Show how the function `last` could be defined in terms of the other library functions introduced in this chapter. Can you think of another possible definition ?

5. The library function `init` removes the last element from a non-empty list; for example, `init [1,2,3,4,5] = [1,2,3,4]`. Show how `init` could similarly be defined in two different ways.

## Chapter 3

1. What are the types of the following values ?

    `['a','b','c']`
    `('a', 'b', 'c')`
    `[(False, '0'),(True, '1')]`
    `([False, True],['0', '1'])`
    `[tail, init, reverse]`

2. Write down definitions that have the following types; it does not matter what the definitions actually do as long as they are type correct.

    `bools :: [Bool]`
    `nums :: [[Int]]`
    `add :: Int -> Int -> Int -> Int`
    `copy :: a -> (a,a)`
    `apply :: (a -> b) -> a -> b`

3. What are the types of the following functions ?

    `second xs = head (tail xs)`
    `swap (x,y) = (y,x)`
    `pair x y = (x,y)`
    `double x = x*2`
    `palindrome xs = reverse xs == xs`
    `twice f x = f (f x)`

    Hint: take care to include the necessary class constaints in the types if the functions are defined using overloaded operators.

4. Check your answers to the preceding three questions GHCi.

5. Why is it not feasible in general for function types to be instances of the `Eq` class ? Hint: two functions of the same type are equal if they always return equal results for equal arguments.
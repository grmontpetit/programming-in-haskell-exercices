## Chapter 1 - Introduction

### Exercices

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
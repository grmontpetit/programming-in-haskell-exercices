## Chapter 5 - List comprehension

### Exercices

1. Using list comprehension, give an expression that calculates the sum 1^2 + 2^2 + ... + 100^2 of the first one hundred integer squares.

2. Suppose that a *coordinate grid of size m * n* is given by the list of all pairs (x,y) of integers such that 0 <= x <= m and 0 <= y <= n. Using a list comprehension, define a function `grid :: Int -> Int -> [(Int, Int)]` that returns a coordinate grid of a given *size*. For example:

    ```GHCi
    > grid 1 2
    [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
    ```

3. Using a list comprehension and the function `grid` above, define a function `square :: Int -> [(Int,Int)]` that returns a coordinate square of size *n*, excluding the diagonal from (0,0) to (n,n). For example:

    ```GHCi
    > square 2
    [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]
    ```

4. In a similar way to the function `length`, show how the library function `replicate :: Int -> a -> [a]` that produces a list of identical elements can be defined using a list comprehension. For example:

    ```GHCi
    > replicate 3 True
    [True,True,True]
    ```
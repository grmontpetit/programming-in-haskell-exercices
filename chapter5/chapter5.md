## Chapter 5 - List comprehension

### Exercices

1. Using list comprehension, give an expression that calculates the sum 1^2 + 2^2 + ... + 100^2 of the first one hundred integer squares.

2. Suppose that a *coordinate grid of size m * n* is given by the list of all pairs (x,y) of integers such that 0 <= x <= m and 0 <= y <= n. Using a list comprehension, define a function `grid :: Int -> Int -> [(Int, Int)]` that returns a coordinate grid of a given *size*. For example:

    ```GHCi
    > grid 1 2
    [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
    ```

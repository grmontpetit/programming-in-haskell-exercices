## Chapter 5 - List comprehension

### Exercices

1. Using list comprehension, give an expression that calculates the sum <a href="https://www.codecogs.com/eqnedit.php?latex=1^2&space;&plus;&space;2^2&space;&plus;&space;...&space;&plus;&space;100^2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?1^2&space;&plus;&space;2^2&space;&plus;&space;...&space;&plus;&space;100^2" title="1^2 + 2^2 + ... + 100^2" /></a> of the first one hundred integer squares.

    My solution:

    ```haskell
    sumint :: Int
    sumint = sum numbers

    numbers :: [Int]
    numbers = [square x | x <- [1..100]]

    square :: Int -> Int
    square = (^2)
    ```

2. Suppose that a *coordinate grid of size m * n* is given by the list of all pairs (x,y) of integers such that <a href="https://www.codecogs.com/eqnedit.php?latex=0&space;\leq&space;x&space;\leq&space;m" target="_blank"><img src="https://latex.codecogs.com/gif.latex?0&space;\leq&space;x&space;\leq&space;m" title="0 \leq x \leq m" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=0&space;\leq&space;y&space;\leq&space;n" target="_blank"><img src="https://latex.codecogs.com/gif.latex?0&space;\leq&space;y&space;\leq&space;n" title="0 \leq y \leq n" /></a>. Using a list comprehension, define a function `grid :: Int -> Int -> [(Int, Int)]` that returns a coordinate grid of a given *size*. For example:

    ```GHCi
    > grid 1 2
    [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
    ```

    My solution:

    ```haskell
    grid :: Int -> Int -> [(Int, Int)]
    grid n m = [(x, y) | x <- [0..n], y <- [0..m]]
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

5. A triple *(x,y,z)* of positive integers is *Pythagorean* if it satisfies the equation <a href="https://www.codecogs.com/eqnedit.php?latex=x^2&space;&plus;&space;y^2&space;=&space;z^2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?x^2&space;&plus;&space;y^2&space;=&space;z^2" title="x^2 + y^2 = z^2" /></a>. Using a list comprehension with three generators, define a function `pyths :: Int -> [(Int,Int,Int)]` that returns the list of all such triples whose components are at most a given limit. For example:

    ```GHCi
    > pyths 10
    [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
    ```

6. A positive integer is *perfect* if it equals the sum of all of its factors, excluding the number itself. Using a list comprehension and the function `factors`, define a function `perfects :: Int -> [Int]` that returns the list of all perfect numbers up to a given limit. For example:

    ```GHCi
    > perfects 500
    [6,28,496]
    ```

7. Show how the list comprehension `[(x,y) | x <- [1,2], y <- [3,4]]` with two generators can be re-expressed using two comprehensions with single generators. Hint: nest one comprehensions within the other and make use of the library function `concat :: [[a]] -> [a]`.

8. Redefine the function `positions` using the function `find`.

9. The *scalar product* of two lists of integers *xs* and *ys* of length *n* is given by the sum of the products of corresponding integers:

    <a href="https://www.codecogs.com/eqnedit.php?latex=\sum_{i=0}^{n-1}&space;(xs_{i}&space;*&space;ys_{i})" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sum_{i=0}^{n-1}&space;(xs_{i}&space;*&space;ys_{i})" title="\sum_{i=0}^{n-1} (xs_{i} * ys_{i})" /></a>

    In a similar manner to `chisqr`, show how a list comprehension can be used to define a function `scalaproduct :: [Int] -> [Int] -> Int` that returns the scalar product of two lists. For example:

    ```GHCi
    > scalarproduct [1,2,3] [4,5,6]
    32
    ```

10. Modify the Caesar cipher program to also handle upper-case letters.
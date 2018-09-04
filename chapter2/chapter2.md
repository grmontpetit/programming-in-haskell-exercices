## Chapter 2 - First steps

### Exercices

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

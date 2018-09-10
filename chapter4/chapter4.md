## Chapter 4 - Defining Functions

### Exercices

1. Using library functions, define a function `halve :: [a] -> ([a],[a])` that splits an even-lengthed list into two halves. For example:

    ```GHCi
    > halve [1,2,3,4,5,6]
    ([1,2,3],[4,5,6])
    ```

    ```haskell
    halve [] = ([],[])
    halve xs | length xs `mod` 2 == 0 = splitAt (length xs `div` 2) xs
             | otherwise              = error "list is uneven."
    ```

2. Defined a function `third :: [a] -> a` that returns the third element in a list that contains at least this many elements using:

    a. `head` and `tail`;

    ```haskell
    third1 :: [a] -> a
    third1 xs = head (tail (tail xs))
    ```

    b. list indexing `!!`;
    ```haskell
    third2 :: [a] -> a
    third2 xs = xs !! 2
    ```
    c. pattern matching.

    ```haskell
    third3 :: [a] -> a
    third3 (_:_:x:_) = x
    ```

3. Consider a function `safetail :: [a] -> [a]` that behaves in the same way as `tail` except that it maps the empty list to itself rather than producing an error. Using `tail` and the function `null :: [a] -> Bool` that decides if a list is empty or not, define `safetail` using:

    a. A conditional expression;

    ```haskell
    safetail :: [a] -> [a]
    safetail xs = if length xs == 0 then xs else tail xs
    ```

    b. guarded equations;

    ```haskell
    safetail2 :: [a] -> [a]
    safetail2 xs | null xs = xs
                 | otherwise = tail xs
    ```

    c. pattern matching.

    ```haskell
    safetail3 :: [a] -> [a]
    safetail3 (x:xs) = xs
    safetail3 (null) = []
    ```

4. In a similar way to `&&` in section 4.4, show how the disjunction operator `||` can be defined in four different ways using pattern matching.

    ```haskell
    True || False  = True
    True || True   = True
    False || True  = True
    False || False = False
    ```

    ```haskell
    False || False = False
    _ || _         = True
    ```

    ```haskell
    False || b = b
    True  || _ = True
    ```

    ```haskell
    b || c | b == c = b
           | otherwise True
    ```

5. Without using any other library functions or operators, show how the meaning of the following pattern matching definition for logical conjunction `&&` can be formalized using conditional expressions:

    ```haskell
    True && True = True
    _    && _     = False
    ```

    Hint: Use two nested conditional expressions.

    ```haskell
    (&&) :: Bool -> Bool -> Bool
    (&&) x y = if x then y else False
    ```

    ```GHCi
    *Main> True Main.&& False
    False
    *Main> True Main.&& True
    True
    *Main> False Main.&& True
    False
    *Main> False Main.&& False
    False
    ```

6. Do the same for the following alternative definition, and note the difference in the number of conditional expressions that are required:

    ```haskell
    True && b = b
    False && _ = False
    ```

    I am not sure I understand the pertinence of theses exercices.

    ```haskell
    --    True && b = b
    --    False && _ = False
    and :: Bool -> Bool -> Bool
    and a b = if a then b else False
    ```

7. Show how the meaning of the following curried function definition can be formalized in terms of lambda expressions:

    ```haskell
    mult :: Int -> Int -> Int -> Int
    mult x y z = x*y*z
    ```

    I think this is what the author expects ?:

    ```haskell
    mult = \x -> \y -> \z -> x * y * z
    ```

8. The *luhn algorithm* is used to check bank card numbers for simple errors such as mistyping a digit, and proceeds as follows:

    - consider each digit as a separate number;
    - moving left, double every other number from the second last;
    - subtract 9 from each number that is now greater than 9;
    - add all the resulting numbers together;
    - if the total is divisible by 10, the card number is valid.

    defined a function `luhnDouble :: Int -> Int` that doubles a digit and subtracts 9 if the result is greater than 9. For example:

    ```GHCi
    > luhnDouble 3
    6
    > luhnDouble 6
    3
    ```

    ```haskell
    luhnDouble :: Int -> Int
    luhnDouble x | double x > 9 = double x - 9
                 | otherwise    = double x
    double = (*2)
    ```

    Using `luhnDouble` and the integer remainder function `mod`, define a function `luhn :: Int -> Int -> Int -> Int -> Bool` that decides if a four-digit bank card number is valid. For example:

    ```GHCi
    > luhn 1 7 8 4
    True
    ```

    ```GHCi
    > luhn 4 7 8 3
    False
    ```

    ```haskell
    luhn :: Int -> Int -> Int -> Int -> Bool
    luhn = \a -> \b -> \c -> \d -> (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0
    ```
    Here is my full solution:
    ```haskell
    luhnDouble :: Int -> Int
    luhnDouble x | double x > 9 = double x - 9
                 | otherwise    = double x
    double = (*2)
    luhn :: Int -> Int -> Int -> Int -> Bool
    luhn = \a -> \b -> \c -> \d -> (luhnDouble a + b + luhnDouble c + d) `mod` 10 == 0
    ```

In the exercices for chapter 7 we will consider a more general version of this function that accepts card number of any length.

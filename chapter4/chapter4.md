## Chapter 4 - Defining Functions

### Exercices

1. Using library functions, define a function `halve :: [a] -> ([a],[a])` that splits an even-lengthed list into two halves. For example:

    ```GHCi
    > halve [1,2,3,4,5,6]
    ([1,2,3],[4,5,6])
    ```

2. Defined a function `third :: [a] -> a` that returns the third element in a list that contains at least this many elements using:

    a. `head` and `tail`;

    b. list indexing `!!`;

    c. pattern matching.

3. Consider a function `safetail :: [a] -> [a]` that behaves in the same way as `tail` except that it maps the empty list to itself rather than producing an error. Using `tail` and the function `null :: [a] -> Bool` that decides if a list is empty or not, define `safetail` using:

    a. A conditional expression;

    b. guarded equations;

    c. pattern matching.

4. In a similar way to `&&` in section 4.4, show how the disjunction operator `||` can be defined in four different ways using pattern matching.

5. Without using any other library functions or operators, show how the meaning of the following pattern matching definition for logical conjunction `&&` can be formalized using conditional expressions:

    ```haskell
    True && False = True
    _    && _     = False
    ```

    Hint: Use two nested conditional expressions.

6. Do the same for the following alternative definition, and note the difference in the number of conditional expressions that are required:

    ```haskell
    True && b = b
    False && _ = False
    ```

7. Show how the meaning of the following curried function definition can be formalized in terms of lambda expressions:

    ```
    mult :: Int -> Int -> Int -> Int
    mult x y z = x*y*z
    ```

8. The *luhn algorithm* is used to check bank card numbers for simple errors such as mistyping a digit, and proceeds as follows:

    - consider each digit as a separate number;
    - moving left, double every other number from the second last;
    - subtract 9 from each number that is now greater than 9;
    - add all the resulting numbers together;
    - if the total is divisible by 10, the card number is valid.

defined a function `luhn double :: Int -> Int` that doubles a digit and subtracts 9 if the result is greater than 9. For example:

    ```GHCi
    > luhnDouble 3
    6

    > luhnDouble6
    3
    ```

Using `luhnDouble` and the integer remainder function `mod`, define a function `luhn :: Int -> Int -> Int -> Int -> Bool` that decides if a four-digit bank card number is valid. For example:

    ```GHCi
    > luhn 1 7 8 4
    True

    > luhn 4 7 8 3
    False
    ```

In the exercices for chapter 7 we will consider a more general version of this function that accepts card number of any length.

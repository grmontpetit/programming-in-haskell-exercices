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
-- product: solution 1
prod xs | length xs > 1  = head xs * prod (tail xs)
        | length xs == 1 = head xs
        | otherwise      = 0

-- product: solution 2
prod2 [] = 0
prod2 (x:xs) | length xs /= 0 = x * prod2 xs
             | otherwise      = x


-- qsort as defined in the book
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
               where
                   smaller = [a | a <- xs, a <= x]
                   larger  = [b | b <- xs, b > x]

-- reverse quick sort
rqsort []     = []
rqsort (x:xs) = rqsort larger ++ [x] ++ rqsort smaller
                where
                    smaller = [a | a <- xs, a <= x]
                    larger  = [b | b <- xs, b > x]

-- Modified quick sort
mqsort []     = []
mqsort (x:xs) = mqsort smaller ++ [x] ++ mqsort larger
                where
                    smaller = [a | a <- xs, a < x]
                    larger  = [b | b <- xs, b > x]

-- Haskell scripts
double x = x + x

quadruple = double . double

factorial n = product [1..n]

average ns = sum ns `div` length ns

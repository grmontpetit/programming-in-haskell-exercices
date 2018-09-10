-- sum of the first hundred integer squares
sumint :: Int
sumint = sum numbers

numbers :: [Int]
numbers = [square x | x <- [1..100]]

square :: Int -> Int
square = (^2)

-- Grid
grid :: Int -> Int -> [(Int, Int)]
grid n m = [(x, y) | x <- [0..n], y <- [0..m]]
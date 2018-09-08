halve :: [a] -> ([a],[a])
halve [] = ([],[])
halve xs | length xs `mod` 2 == 0 = splitAt (length xs `div` 2) xs
         | otherwise              = error "list is uneven."

-- using head and tail
third1 :: [a] -> a
third1 xs = head (tail (tail xs))

-- list indexing `!!`
third2 :: [a] -> a
third2 xs = xs !! 2

-- pattern matching
third3 :: [a] -> a
third3 (_:_:x:_) = x

-- Safetail --
safetail :: [a] -> [a]
safetail xs = if null xs then xs else tail xs

safetail2 :: [a] -> [a]
safetail2 xs | null xs = xs
             | otherwise = tail xs

safetail3 :: [a] -> [a]
safetail3 (x:xs) = xs
safetail3 (null) = []

(||) :: Bool -> Bool -> Bool
True || False  = True
True || True   = True
False || True  = True
False || False = False
-- _ || _         = True

(&&): Bool -> Bool -> Bool

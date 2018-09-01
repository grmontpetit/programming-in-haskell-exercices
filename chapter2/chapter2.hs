-- Script to correct
-- N = a `div` length xs
--     where
--         a = 10
--         xs = [1,2,3,4,5]

-- Corrected script
n = a `div` length xs
    where
        a = 10
        xs = [1,2,3,4,5]

-- Another versionf of last
mlast [] = error "mlast called on empty list."
mlast xs = xs !! (length xs - 1)

-- 1st version of a modified init
m1init [] = []
m1init xs = reverse (drop 1 (reverse xs))

-- 2nd version of a modified init
m2init [] = []
m2init xs = take (length xs - 1) xs

-- 3rd version of a modified init
m3init [] = []
m3init xs = fst (splitAt (length xs - 1) xs)
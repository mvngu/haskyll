-- How old Tabby will be in x years.  A rewrite of
--
-- assets/src/data/age.hs
--
-- without using string concatenation.
main = do
    let age = (1 :: Integer)
    let x = (3 :: Integer)
    putStr "Tabby's age: "
    putStr (show age)
    putStr "\n"
    putStr "In 3 years time, Tabby will be: "
    putStr (show (age + x))
    putStr "\n"

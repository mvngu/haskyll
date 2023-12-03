import           Text.Printf

-- How old Tabby will be in x years.
-- Use the function printf for string formatting.
main = do
    let age = (1 :: Integer)
    let x = (3 :: Integer)
    putStrLn (printf "Tabby's age: %d" age)
    putStrLn (printf "In 3 years time, Tabby will be: %d" (age + x))

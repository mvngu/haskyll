-- Prompt for name and age.  Print the age in x years time.
main = do
    putStrLn "Enter your name."
    name <- getLine
    putStrLn "Enter your age."
    age <- getLine
    let a = (read age :: Integer)
    let x = 10
    putStrLn ("Hello, " ++ name ++ ".")
    putStrLn ("In " ++ show x ++ " years, you'll be " ++ show (a + x) ++ ".")

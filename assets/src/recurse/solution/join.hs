--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2023 Duck McSouls <quacksouls [AT] gmail [DOT] com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--------------------------------------------------------------------------------

import Text.Printf

-- | Join the list elements into a string.  Use the given delimiter to separate
-- the string representations of the elements.
join :: (Show a, Num a) => String -> [a] -> String
join _ [] = ""
join delim (x:xs)
    | length xs > 0 = (show x) ++ delim ++ (join delim xs)
    | otherwise = show x

-- | Join the list elements into a string.  Use the given delimiter to separate
-- the string representations of the elements.  This version uses fold.
joinf :: (Show a, Num a) => String -> [a] -> String
joinf _ []         = ""
joinf delim (x:xs) = foldl (\acc y -> acc ++ delim ++ (show y)) (show x) xs

-- | Join all numbers in a list into a string.  The elements are separated by a
-- given delimiter.
main = do
    let a = [1]
    let b = [2.1, 3.2, 5.4]
    let c = [0, 2, 4, 6, 8, 10]
    let d = []
    let delima = ""
    let delimb = ","
    let delimc = "."
    let delimd = ";"
    let testa = join delima a == joinf delima a
    let testb = join delimb b == joinf delimb b
    let testc = join delimc c == joinf delimc c
    let testd = join delimd d == joinf delimd d
    printf "%s -> %s: %s\n" (show a) (show $ join delima a) $ show testa
    printf "%s -> %s: %s\n" (show b) (show $ join delimb b) $ show testb
    printf "%s -> %s: %s\n" (show c) (show $ join delimc c) $ show testc
    printf "[] -> %s: %s\n" (show $ join delimd d) $ show testd

--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Duck McSouls <quacksouls [AT] gmail [DOT] com>
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

-- | The first elements in a list of 2-tuples.
first :: [(a, b)] -> [a]
first xs = [x | (x, _) <- xs]

-- | The second elements in a list of 2-tuples.
second :: [(a, b)] -> [b]
second xs = [y | (_, y) <- xs]

-- | The elements of a list of 2-tuples.
main = do
    let a = [(1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e')]
    let b = [(x, y) | x <- [1 .. 5], y <- [6 .. 10]]
    let c = [(a, b) | a <- "abcdef", b <- "ghij"]
    putStrLn "First elements"
    printf "%s -> %s\n" (show a) $ show . first $ a
    printf "%s -> %s\n" (show b) $ show . first $ b
    printf "%s -> %s\n" (show c) $ show . first $ c
    putStrLn "\nSecond elements"
    printf "%s -> %s\n" (show a) $ show . second $ a
    printf "%s -> %s\n" (show b) $ show . second $ b
    printf "%s -> %s\n" (show c) $ show . second $ c

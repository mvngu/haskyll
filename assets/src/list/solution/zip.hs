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

-- | An implementation of the function "zip".
zipper :: [a] -> [b] -> [(a, b)]
zipper [] []         = []
zipper [] _          = []
zipper _ []          = []
zipper (x:xs) (y:ys) = (x, y) : zipper xs ys

-- | An implementation of the function "unzip".
unzipper :: [(a, b)] -> ([a], [b])
unzipper [] = ([], [])
unzipper xs = (first xs, second xs)

-- | Implementations of the functions "zip" and "unzip".
main = do
    let a = [0 .. 9]
    let b = ['a' .. 'j']
    let c = ['Z','Y' .. 'A']
    let zipab = zipper a b
    let zipac = zipper a c
    let zipcb = zipper c b
    printf "%s -> %s\n" (show a) $ show b
    printf "zip -> %s\n" $ show zipab
    printf "unzip -> %s\n" $ show . unzipper $ zipab
    printf "\n%s -> %s\n" (show a) $ show c
    printf "zip -> %s\n" $ show zipac
    printf "unzip -> %s\n" $ show . unzipper $ zipac
    printf "\n%s -> %s\n" (show c) $ show b
    printf "zip -> %s\n" $ show zipcb
    printf "unzip -> %s\n" $ show . unzipper $ zipcb

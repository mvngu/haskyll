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

-- | A reimplementation of the function "fst".
firstA :: (a, b) -> a
firstA (x, _) = x

-- | An implementation of the function "fst" for lists.
firstB :: [a] -> a
firstB [x, _] = x

-- | An implementation of the function "fst" for lists.
firstC :: [a] -> a
firstC (x:xs) = x

-- | An implementation of the function "fst" for lists.
firstD :: [a] -> a
firstD []     = error "Empty list"
firstD (x:xs) = x

-- | Various implementations of "fst".
main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let s = "a"
    let t = "b"
    let x = 'x'
    let y = 'y'
    -- Same data type in each pair.
    printf "(%d, %d) -> %d\n" a b $ firstA (a, b)
    printf "(%s, %s) -> %s\n" s t $ firstA (s, t)
    printf "(%c, %c) -> %c\n" x y $ firstA (x, y)
    -- Mixed data type in each pair.
    printf "(%d, %s) -> %d\n" b t $ firstA (b, t)
    printf "(%s, %c) -> %s\n" s y $ firstA (s, y)
    printf "(%c, %d) -> %c\n" y b $ firstA (y, b)
    -- List version.
    printf "[%d, %d] -> %d\n" a b $ firstB [a, b]
    printf "[%s, %s] -> %s\n" s t $ firstB [s, t]
    printf "[%c, %c] -> %c\n" x y $ firstB [x, y]
    -- A third implementation.
    printf "[%d, %d] -> %d\n" a b $ firstC [a, b]
    printf "[%d, %d, %d] -> %d\n" a b (-b) $ firstC [a, b, -b]
    printf "[%c, %c] -> %c\n" x y $ firstC [x, y]
    printf "[%c, %c, %c] -> %c\n" x y x $ firstC [x, y, x]
    -- A fourth implementation.
    printf "[%d, %d] -> %d\n" a b $ firstD [a, b]
    printf "[%d, %d, %d] -> %d\n" a b (-a) $ firstD [a, b, -a]
    printf "[%c, %c] -> %c\n" x y $ firstD [x, y]
    printf "[%c, %c, %c] -> %c\n" x y y $ firstD [x, y, y]

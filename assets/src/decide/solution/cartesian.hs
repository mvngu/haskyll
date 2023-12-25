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

-- | Cartesian product of lists.
cartprod :: [a] -> [b] -> [(a, b)]
cartprod [] [] = []
cartprod _ [] = []
cartprod [] _ = []
cartprod (a:b:c) (x:y:z) =
    [ (a, x)
    , (a, y)
    , (a, head z)
    , (b, x)
    , (b, y)
    , (b, head z)
    , (head c, x)
    , (head c, y)
    , (head c, head z)
    ]

-- | An implementation of Cartesian product.
main = do
    let a = []
    let b = [1, 2, 3]
    let c = "abc"
    printf "[] x [] -> %s\n" $ show $ length (cartprod a a) == 0
    printf "[] x %s-> %s\n" (show b) $ show $ length (cartprod a b) == 0
    printf "%s x []-> %s\n" (show c) $ show $ length (cartprod c a) == 0
    printf "%s x %s -> %s\n" (show b) (show c) $ show $ cartprod b c

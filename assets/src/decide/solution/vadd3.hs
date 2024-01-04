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

-- | Addition for integer vectors of three elements.
vadd :: Integral a => (a, a, a) -> (a, a, a) -> (a, a, a)
vadd (s, t, u) (x, y, z) = (s + x, t + y, u + z)

-- | Vector addition.
main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let d = 4 :: Integer
    let s = 5 :: Int
    let t = 6 :: Int
    let u = 7 :: Int
    let v = 8 :: Int
    printf "(%d, %d, %d) + (%d, %d, %d) -> %s\n" a b c d (-b) (-d) $
        show $ vadd (a, b, c) (d, -b, -d)
    printf "(%d, %d, %d) + (%d, %d, %d) -> %s\n" s t (-t) (-v) u v $
        show $ vadd (s, t, -t) (-v, u, v)

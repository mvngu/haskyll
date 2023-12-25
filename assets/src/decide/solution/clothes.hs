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

-- | The label corresponding to the size of woman's clothing.
label :: Integer -> String
label x
    | x < 0 = "Invalid size"
    | (0 <= x) && (x <= 2) = "XS"
    | (4 <= x) && (x <= 6) = "S"
    | (8 <= x) && (x <= 10) = "M"
    | (12 <= x) && (x <= 14) = "L"
    | (16 <= x) && (x <= 18) = "XL"
    | x == 20 = "XXL"
    | x == 22 = "XXXL"
    | otherwise = "Invalid size"

-- | Sizes in women's clothing.
main = do
    let a = -1 :: Integer
    let b = 1 :: Integer
    let c = 5 :: Integer
    let d = 9 :: Integer
    let e = 13 :: Integer
    let f = 17 :: Integer
    let g = 20 :: Integer
    let h = 22 :: Integer
    let i = 42 :: Integer
    printf "%d -> %s\n" a $ label a
    printf "%d -> %s\n" b $ label b
    printf "%d -> %s\n" c $ label c
    printf "%d -> %s\n" d $ label d
    printf "%d -> %s\n" e $ label e
    printf "%d -> %s\n" f $ label f
    printf "%d -> %s\n" g $ label g
    printf "%d -> %s\n" h $ label h
    printf "%d -> %s\n" i $ label i

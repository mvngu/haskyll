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

-- | A reimplementation of the function "snd".
second :: (a, b) -> b
second (_, y) = y

-- | An implementation of "snd".
main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let s = "a"
    let t = "b"
    let x = 'x'
    let y = 'y'
    -- Same data type in each pair.
    printf "(%d, %d) -> %d\n" a b $ second (a, b)
    printf "(%s, %s) -> %s\n" s t $ second (s, t)
    printf "(%c, %c) -> %c\n" x y $ second (x, y)
    -- Mixed data type in each pair.
    printf "(%d, %s) -> %s\n" b t $ second (b, t)
    printf "(%s, %c) -> %c\n" s y $ second (s, y)
    printf "(%c, %d) -> %d\n" y b $ second (y, b)

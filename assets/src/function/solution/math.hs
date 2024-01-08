--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Aaron Nguyen <mvngu [AT] gmx [DOT] com>
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

-- | A function that outputs a function to perform the usual arithmetic
-- operations.
math :: Integral a => String -> a -> (a -> a)
math "+" x = \y -> x + y
math "-" x = \y -> x - y
math "*" x = \y -> x * y
math "/" x = \y -> x `div` y
math _ x   = \y -> y

-- | A function that returns a function to perform arithmetics.
main = do
    let a = 8 :: Integer
    let add3 = math "+" 3
    let decrement = math "-" 1
    let double = math "*" 2
    let dividend = math "/" 18
    let unknown = math "op" 42
    printf "increment 3 to %d -> %d\n" a $ add3 a
    printf "decrement %d -> %d\n" a $ decrement a
    printf "double %d -> %d\n" a $ double a
    printf "dividend %d -> %d\n" a $ dividend a
    printf "unknown op %d -> %d\n" a $ unknown a

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

-- | The absolute value function.
absolute :: Double -> Double
absolute x
    | x >= 0 = x
    | otherwise = -x

-- | The triangular function.
tri :: Double -> Double
tri x
    | absolute x < 1 = 1 - (absolute x)
    | otherwise = 0

-- | Implementations of the absolute value and triangular functions.
main = do
    let a = -1.5
    let b = -1
    let c = -0.5
    let d = 0
    let e = 0.5
    let f = 1
    let g = 1.5
    printf "%f -> %f\n" a $ tri a
    printf "%f -> %f\n" b $ tri b
    printf "%f -> %f\n" c $ tri c
    printf "%f -> %f\n" d $ tri d
    printf "%f -> %f\n" e $ tri e
    printf "%f -> %f\n" f $ tri f
    printf "%f -> %f\n" g $ tri g

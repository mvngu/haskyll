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

-- | Double a number.
double :: Num a => a -> a
double x = 2 * x

-- | Apply the function "double" two times.
quadruple = double . double

-- | The successor of a number.
next :: Num a => a -> a
next x = x + 1

-- | The successor of the successor.
afterNext = next . next

-- | Apply a given function twice.
twice :: (a -> a) -> (a -> a)
twice f = f . f

-- | Composition of a function with itself.
main = do
    let [x, y] = [2, 3] :: [Integer]
    let at = (twice double) x
    let bt = twice next y
    let ac = double . double $ x
    let bc = next . next $ y
    let testa = at == ac && at == quadruple x
    let testb = bt == bc && bt == afterNext y
    printf "%d -> %d, %s\n" x at $ show testa
    printf "%d -> %d, %s\n" y bt $ show testb

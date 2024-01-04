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

import Data.Foldable
import Text.Printf

-- | The Tak function as reported in the paper:
-- J. McCarthy. An interesting LISP function. *ACM Lisp Bulletin*, issue 3,
-- 1979, pp.6--8, doi: 10.1145/1411829.1411833
tak :: Integer -> Integer -> Integer -> Integer
tak x y z
    | x <= y = y
    | otherwise = tak (tak x1 y z) (tak y1 z x) (tak z1 x y)
  where
    x1 = x - 1
    y1 = y - 1
    z1 = z - 1

-- | Test the Tak function for integer values between 1 and 100, inclusive.
main = do
    for_ [1 .. 100] $ \x -> do
        for_ [1 .. 100] $ \y -> do
            for_ [1 .. 100] $ \z -> do
                let t = tak x y z
                let result = t == x || t == y || t == z
                if result
                    then printf "tak(%d, %d, %d) = %d: %s\n" x y z t $ show result
                    else error "False"

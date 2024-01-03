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

-- | Whether an integer is positive.
isPositive :: Int -> Bool
isPositive n = n > 0

-- | An implementation of the function "all" without using the operator "&&".
whole :: (a -> Bool) -> [a] -> Bool
whole _ [] = True
whole f (x:xs)
    | f x == False = False
    | otherwise = whole f xs

-- | An implementation of the function "all" without using the operator "&&".
main = do
    let a = [15, 12, 1, 10, 17, -3, 7, 20, -3, 3, 8, 8, 14, 19, 11, -2, 1, 18]
    let b = [4, 1, 3, 2, 10, -1, 6, 4, 20, 0, 4, -2, 14, 19, -3, 18, 16, 13]
    let c = [6, 9, 9, 13, 16, 2, 17, 11, 15, 7, 2, 7, 9, 16, 20, 8, 4, 7, 18, 5]
    let d = []
    let alla = whole isPositive a
    let allb = whole isPositive b
    let allc = whole isPositive c
    let alld = whole isPositive d
    let testElla = alla == all isPositive a
    let testEllb = allb == all isPositive b
    let testEllc = allc == all isPositive c
    let testElld = alld == all isPositive d
    printf "%s -> all positive? %s, %s\n" (show a) (show alla) $ show testElla
    printf "%s -> all positive? %s, %s\n" (show b) (show allb) $ show testEllb
    printf "%s -> all positive? %s, %s\n" (show c) (show allc) $ show testEllc
    printf "[] -> all positive? %s, %s\n" (show alld) $ show testElld

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

-- | Solve the quadratic equation.
quadratic :: Double -> Double -> Double -> String
quadratic a b c = do
    let delta = (b ** 2) - (4 * a * c)
    if a == 0
        then "a is zero"
        else if delta < 0
                 then "No real roots"
                 else show $ ((-b) + (sqrt delta)) / (2 * a)

-- | An implementation of the quadratic formula.
main = do
    let a = 1 / 2 :: Double -- Two real roots.
    let b = -(5 / 2) :: Double
    let c = 2 :: Double
    -- Two complex roots.
    let aa = 5 :: Double
    let bb = 20 :: Double
    let cc = 32 :: Double
    -- a is zero
    let aaa = 0 :: Double
    let bbb = 1 :: Double
    let ccc = 2 :: Double
    printf "Solution: %s\n" $ quadratic a b c
    printf "Solution: %s\n" $ quadratic aa bb cc
    printf "Solution: %s\n" $ quadratic aaa bbb ccc

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

-- | The body mass index (BMI).  Weight is in kilograms and height is
-- in metres.
bmi :: Double -> Double -> Double
bmi weight height = weight / (height ** 2)

-- | The weight status of an adult 20 years or older, based on their BMI.
weightStatus :: Double -> String
weightStatus bm
    | bm < 18.5 = "underweight"
    | (18.5 <= bm) && (bm <= 24.9) = "healthy weight"
    | (25.0 <= bm) && (bm <= 29.9) = "overweight"
    | bm >= 30.0 = "obese"
    | otherwise = "unknown BMI or weight status"

-- | Body mass index.
main = do
    putStrLn "Enter your weight in kilograms."
    weight <- getLine
    putStrLn "Enter your height in metres."
    height <- getLine
    let w = read weight :: Double
    let h = read height :: Double
    printf "Your BMI: %f\n" $ bmi w h
    printf "Weight status: %s\n" $ weightStatus $ bmi w h

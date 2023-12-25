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

-- | Average weight of adult female 20 years and older, on various heavenly
-- bodies.
femaleWeight :: [Double] -> [Double]
femaleWeight gravity = map (\x -> 170.8 * x) gravity

-- | Average weight of adult male 20 years and older, on various heavenly
-- bodies.
maleWeight :: [Double] -> [Double]
maleWeight gravity = map (\x -> 199.8 * x) gravity

-- | Convert weight from pounds to kilograms.
toKilogram :: Double -> Double
toKilogram x = 0.4535924 * x

-- | A person's weight on various heavenly bodies in the Solar System.
main = do
    let gravity = [0.38, 0.91, 1, 0.166, 0.38, 2.34, 1.06, 0.92, 1.19, 0.06]
    let male = maleWeight gravity
    let female = femaleWeight gravity
    printf "Male, pounds: %s\n" $ show male
    printf "Male, kilograms: %s\n" $ show $ map toKilogram male
    printf "Female, pounds: %s\n" $ show female
    printf "Female, kilograms: %s\n" $ show $ map toKilogram female

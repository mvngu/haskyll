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

-- | Print data to standard output.
myPrint :: (String, Double) -> IO ()
myPrint (country, weight) = printf "%s: %f\n" country weight

-- | Convert a weight from kilograms to pounds.
toPound :: Double -> Double
toPound x = 2.204623 * x

-- | Convert each weight from kilograms to pounds.  Print each result to
-- standard output.
main = do
    let female = [73.1, 87.3, 64.6, 78.9]
    let male = [88.4, 93.8, 68.1, 82.7]
    let poundF = map toPound female
    let poundM = map toPound male
    let oceania = ["Aus/NZ", "Polynesia", "Melanesia", "Micronesia"]
    putStrLn "Female average weight (pounds)"
    for_ (zip oceania poundF) myPrint
    putStrLn "\nMale average weight (pounds)"
    for_ (zip oceania poundM) myPrint

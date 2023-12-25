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

import Data.Char
import Text.Printf

-- | Convert the first character of a string to uppercase.
capitalize :: String -> String
capitalize str = (toUpper $ head str) : (tail str)

-- | Remove the first and last characters of a string, reverse the
-- string, then capitalize the result.
chopSuey :: String -> String
chopSuey str = do
    let torso = init . tail
    capitalize . reverse $ torso str

-- | Same as chopSuey, but simplified.
chopSueyB :: String -> String
chopSueyB str = capitalize . reverse . init . tail $ str

-- | Same as chopSueyB, but using only function application notation.
chopSueyC :: String -> String
chopSueyC str = capitalize $ reverse $ init $ tail $ str

-- | Various manipulations of a string.
main = do
    let a = "!yyyay"
    let b = "clive evils"
    let c = "8caterpillar-"
    let resulta = chopSuey a == chopSueyB a && chopSuey a == chopSueyC a
    let resultb = chopSuey b == chopSueyB b && chopSuey b == chopSueyC b
    let resultc = chopSuey c == chopSueyB c && chopSuey c == chopSueyC c
    printf "%s -> %s: %s\n" a (chopSuey a) $ show resulta
    printf "%s -> %s: %s\n" b (chopSuey b) $ show resultb
    printf "%s -> %s: %s\n" c (chopSuey c) $ show resultc

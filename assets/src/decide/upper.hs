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
capitalize str = (toUpper $ head str) : tail str

-- | Convert the first character of a string to uppercase.  Simplified version.
capitalizeB :: String -> String
capitalizeB (x:xs) = toUpper x : xs

-- | Capitalize a string.
main = do
    let a = "ayyy!"
    let b = "to bee or not two bees"
    let c = "42 is a number"
    let resulta = capitalize a
    let resultb = capitalize b
    let resultc = capitalize c
    printf "%s -> %s: %s\n" a resulta $ show $ resulta == capitalizeB a
    printf "%s -> %s: %s\n" b resultb $ show $ resultb == capitalizeB b
    printf "%s -> %s: %s\n" c resultc $ show $ resultc == capitalizeB c

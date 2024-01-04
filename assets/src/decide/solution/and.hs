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

-- | Reimplementation of the boolean operator "&&".
myAnd :: Bool -> Bool -> Bool
myAnd True True = True
myAnd _ _       = False

-- | An implementation of boolean "and".
main = do
    let test1 = True && True == myAnd True True
    let test2 = True && False == myAnd True False
    let test3 = False && True == myAnd False True
    let test4 = False && False == myAnd False False
    printf "%s and %s, check: %s\n" (show True) (show True) (show test1)
    printf "%s and %s, check: %s\n" (show True) (show False) (show test2)
    printf "%s and %s, check: %s\n" (show False) (show True) (show test3)
    printf "%s and %s, check: %s\n" (show False) (show False) (show test4)

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

-- | Reimplementation of the boolean operator "||".
myOr :: Bool -> Bool -> Bool
myOr False False = False
myOr False True  = True
myOr True _      = True

-- | An implementation of boolean "or".
main = do
    let test1 = (True || True) == (myOr True True)
    let test2 = (True || False) == (myOr True False)
    let test3 = (False || True) == (myOr False True)
    let test4 = (False || False) == (myOr False False)
    printf "%s or %s, check: %s\n" (show True) (show True) (show test1)
    printf "%s or %s, check: %s\n" (show True) (show False) (show test2)
    printf "%s or %s, check: %s\n" (show False) (show True) (show test3)
    printf "%s or %s, check: %s\n" (show False) (show False) (show test4)

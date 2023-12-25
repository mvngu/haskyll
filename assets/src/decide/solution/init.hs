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

-- | An implementation of the function "init".
myInit :: [a] -> [a]
myInit [] = error "Empty list"
myInit [x] = []
myInit (x:xs) = do
    let (left, _) = splitAt ((length xs) - 1) xs
    [x] ++ left

-- | An implementation of "init".
main = do
    let a = [2]
    let b = [1, 2]
    let c = [3, 4, 5]
    let test1 = (init a) == (myInit a)
    let test2 = (init b) == (myInit b)
    let test3 = (init c) == (myInit c)
    printf "%s -> %s: %s\n" (show a) (show $ myInit a) $ show test1
    printf "%s -> %s: %s\n" (show b) (show $ myInit b) $ show test2
    printf "%s -> %s: %s\n" (show c) (show $ myInit c) $ show test3

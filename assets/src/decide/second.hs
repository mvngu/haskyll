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

-- | The second element of a list.
secondA :: [a] -> a
secondA []       = error "Empty list"
secondA [x]      = error "Singleton"
secondA (x:y:xs) = y

-- | The second element of a list.
secondB :: [a] -> a
secondB []      = error "Empty list"
secondB [x]     = error "Singleton"
secondB (_:x:_) = x

-- | Various implementations for extracting the second element of a list.
main = do
    let a = 2 :: Integer
    let b = 3 :: Integer
    let c = 4 :: Integer
    -- First version.
    printf "[%d, %d] -> %d\n" a b $ secondA [a, b]
    printf "[%d, %d] -> %d\n" b c $ secondA [b, c]
    printf "[%d, %d, %d] -> %d\n" b a c $ secondA [b, a, c]
    printf "[%d, %d, %d, %d] -> %d\n" b (-a) c (-b) $ secondA [b, -a, c, -b]
    -- Second version.
    printf "[%d, %d] -> %d\n" a b $ secondB [a, b]
    printf "[%d, %d] -> %d\n" b c $ secondB [b, c]
    printf "[%d, %d, %d] -> %d\n" b a c $ secondB [b, a, c]
    printf "[%d, %d, %d, %d] -> %d\n" b (-a) c (-b) $ secondB [b, -a, c, -b]

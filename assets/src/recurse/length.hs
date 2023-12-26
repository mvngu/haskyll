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

-- | The length of a list.
size :: [a] -> Int
size []     = 0
size (x:xs) = 1 + size xs

-- | The length of a list, using a fold operation.
sizef = foldr (\_ acc -> 1 + acc) 0

-- | An implementation of "length".
main = do
    let a = []
    let b = [1, 3, 5]
    let c = ["a", "b", "c", "d", "e"]
    let d = "dandelion"
    let testa = length a == size a && length a == sizef a
    let testb = length b == size b && length b == sizef b
    let testc = length c == size c && length c == sizef c
    let testd = length d == size d && length d == sizef d
    printf "[] -> %d: %s\n" (size a) $ show testa
    printf "%s -> %d: %s\n" (show b) (size b) $ show testb
    printf "%s -> %d: %s\n" (show c) (size c) $ show testc
    printf "%s -> %d: %s\n" (show d) (size d) $ show testd

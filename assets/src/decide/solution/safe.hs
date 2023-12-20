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

-- | A safe version of "head".
heads :: [a] -> [a]
heads [] = []
heads xs = [head xs]

-- | A safe version of "init".
inits :: [a] -> [a]
inits [] = []
inits xs = init xs

-- | A safe version of "last".
lasts :: [a] -> [a]
lasts [] = []
lasts xs = [last xs]

-- | A safe version of "tail".
tails :: [a] -> [a]
tails []     = []
tails (x:xs) = xs

-- | The torso of a list.
torso :: [a] -> [a]
torso [] = []
torso xs = inits $ tails xs

-- | "Safe" versions of various functions.
main = do
    let a = [1]
    let b = ["a", "b", "c"]
    let c = [2, 4, 6, 8, 10, 3]
    let d = "craters"
    -- Head
    putStrLn "Head"
    printf "[] -> []: %s\n" $ show $ length (heads []) == 0
    printf "heads %s -> %s\n" (show a) $ show $ heads a
    printf "heads %s -> %s\n" (show b) $ show $ heads b
    printf "heads %s -> %s\n" (show c) $ show $ heads c
    printf "heads %s -> %s\n" (show d) $ show $ heads d
    -- Init
    putStrLn "Init"
    printf "[] -> []: %s\n" $ show $ length (inits []) == 0
    printf "inits %s -> %s\n" (show a) $ show $ inits a
    printf "inits %s -> %s\n" (show b) $ show $ inits b
    printf "inits %s -> %s\n" (show c) $ show $ inits c
    printf "inits %s -> %s\n" (show d) $ show $ inits d
    -- Last
    putStrLn "Last"
    printf "[] -> []: %s\n" $ show $ length (lasts []) == 0
    printf "lasts %s -> %s\n" (show a) $ show $ lasts a
    printf "lasts %s -> %s\n" (show b) $ show $ lasts b
    printf "lasts %s -> %s\n" (show c) $ show $ lasts c
    printf "lasts %s -> %s\n" (show d) $ show $ lasts d
    -- Tail
    putStrLn "Tail"
    printf "[] -> []: %s\n" $ show $ length (tails []) == 0
    printf "tails %s -> %s\n" (show a) $ show $ tails a
    printf "tails %s -> %s\n" (show b) $ show $ tails b
    printf "tails %s -> %s\n" (show c) $ show $ tails c
    printf "tails %s -> %s\n" (show d) $ show $ tails d
    -- Torso
    putStrLn "Torso"
    printf "[] -> []: %s\n" $ show $ length (torso []) == 0
    printf "torso %s -> %s\n" (show a) $ show $ torso a
    printf "torso %s -> %s\n" (show b) $ show $ torso b
    printf "torso %s -> %s\n" (show c) $ show $ torso c
    printf "torso %s -> %s\n" (show d) $ show $ torso d

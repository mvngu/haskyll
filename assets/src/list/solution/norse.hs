--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Duck McSouls <quacksouls [AT] gmail [DOT] com>
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

-- | Some English words of Norse origin.
word =
    [ "ado"
    , "aloft"
    , "anger"
    , "auk"
    , "bait"
    , "bark"
    , "berserk"
    , "bylaw"
    , "crawl"
    , "crochet"
    , "crotch"
    , "crouch"
    , "dangle"
    , "die"
    , "dregs"
    , "droop"
    , "fellow"
    , "fjord"
    , "flaunt"
    , "freckle"
    ]

-- | The number of unique vowels in a word.
vowel :: String -> Int
vowel str = length $ filter (\v -> v `elem` str) "aeiou"

-- | The number of unique vowels in a word.  This implementation uses list
-- comprehension.
vowelC :: String -> Int
vowelC str = sum [1 :: Int | v <- "aeiou", v `elem` str]

-- | The number of unique vowels in a word.
main = do
    for_ word $ \w -> do
        let test = vowel w == vowelC w
        printf "%s -> %d, %s\n" w (vowel w) $ show test

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

-- | Some words in the English language that contain only consonants.
word =
    [ "cry"
    , "crypt"
    , "cyst"
    , "glyph"
    , "gym"
    , "gypsy"
    , "ply"
    , "pwn"
    , "pygmy"
    , "sty"
    , "sync"
    , "syzygy"
    , "thy"
    , "try"
    , "tryst"
    , "why"
    , "wry"
    , "wyrm"
    ]

-- | Whether a word has one or more vowels.
hasVowel :: String -> Bool
hasVowel str = or [s `elem` "aeiou" | s <- str]

-- | Test words to see whether they have vowels.
main = do
    let result = or $ map (\w -> hasVowel w) word
    printf "Any words have a vowel? %s\n" $ show result
    putStrLn "Test individual word for vowels"
    for_ word $ \w -> do
        printf "%s -> %s\n" w $ show . hasVowel $ w
    -- Is there any word in the list that does not use "Y"?
    let testY = any (\w -> 'y' `notElem` w) word
    let noY = filter (\w -> 'y' `notElem` w) word
    printf "Any words not using Y? %s\n" $ show testY
    printf "Words not using Y: %s\n" $ show noY

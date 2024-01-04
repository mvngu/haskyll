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
import Data.Foldable
import Text.Printf

vowel = "aeiou"

-- | Whether a string is univocalic.
isUnivocalic :: String -> Bool
isUnivocalic "" = False
isUnivocalic str = nvowel == 1
  where
    strLowercase = lowercase str
    nvowel = sum $ map (\x -> toInt x strLowercase) vowel

-- | Convert a string to all lowercase.
lowercase :: String -> String
lowercase str = map (\x -> toLower x) str

-- | 1 if a letter is in a string; 0 otherwise.
toInt :: Char -> String -> Int
toInt char str
    | char `elem` str = 1
    | otherwise = 0

-- | Is a string univocalic?
main = do
    let sentence =
            [ ""
            , "1"
            , "abc"
            , "defghi"
            , "bcdfghjklmnpqrstvwxyz"
            , "Mississippi"
            , "Ellen DeGeneres"
            , "No cool monsoons blow soft on Oxford dons,"
            , "A Kansan plays cards, calls Marshall"
            , "Bart can bark At cars that park"
            , "Whether we went where he went"
            , "Do not bonk wrong nooks"
            , "Hassan can, at a handclap, call a vassal at hand and ask that all staff plan a bacchanal"
            ]
    for_ sentence $ \str -> do
        printf "%s -> %s\n" str $ show $ isUnivocalic str

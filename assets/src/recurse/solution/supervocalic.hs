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

-- | Whether a string is supervocalic.
isSupervocalic :: String -> Bool
isSupervocalic "" = False
isSupervocalic str = do
    let strLowercase = lowercase str
    let result = sum $ map (\x -> occur x strLowercase) vowel
    result == length vowel

-- | Convert a string to all lowercase.
lowercase :: String -> String
lowercase str = map (\x -> toLower x) str

-- | The number of times a character appears in a string.
occur :: Char -> String -> Int
occur char ""  = 0
occur char str = sum $ map (\c -> toInt char c) str

-- | 1 if two characters are the same; 0 otherwise.
toInt :: Char -> Char -> Int
toInt x y
    | x == y = 1
    | otherwise = 0

-- | Is a string supervocalic?
main = do
    let sentence =
            [ ""
            , "1"
            , "abc"
            , "defghi"
            , "bcdfghjklmnpqrstvwxyz"
            , "woman suffragists"
            , "fountain pens"
            , "supervocalic"
            , "cauliflower"
            , "oriental rug"
            , "au revoir"
            , "unsociable"
            , "housemaid"
            , "discourages"
            , "facetious"
            , "behaviour"
            , "Blanche DuBois"
            , "Alice Munro"
            , "Astrud Gilberto"
            , "Austin Powers"
            ]
    for_ sentence $ \str -> do
        printf "%s -> %s\n" str $ show $ isSupervocalic str

--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Aaron Nguyen <mvngu [AT] gmx [DOT] com>
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

-- | The first vowel in a name.
firstVowel :: String -> Char
firstVowel str =
    case (vowel str) of
        []    -> '\0'
        (x:_) -> x

-- | All vowels in a name.
vowel :: String -> String
vowel str = [s | s <- str, (toLower s) `elem` "aeiou"]

-- | The first vowel in a name.
main = do
    let name =
            [ "Albrecht Dürer"
            , "Andrea Mantegna"
            , "Brynn Ng"
            , "Donatello"
            , "Giovanni Bellini"
            , "Gwynyth Symth"
            , "Jan van Eyck"
            , "Leonardo"
            , "Lorenzo Ghiberti"
            , "Michelangelo"
            , "Raphael"
            , "Sandro Botticelli"
            ]
    for_ name $ \x -> do
        printf "%s -> %c\n" x $ firstVowel x

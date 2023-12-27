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

alphabet = "abcdefghijklmnopqrstuvwxyz"

-- | Whether a sentence is a pangram.
isPangram :: String -> Bool
isPangram "" = False
isPangram str = do
    let strLowercase = lowercase str
    and $ map (\x -> x `elem` strLowercase) alphabet

-- | Convert a string to all lowercase.
lowercase :: String -> String
lowercase str = map (\x -> toLower x) str

-- | Is a sentence a pangram?
main = do
    let sentence =
            [ ""
            , "1"
            , "abc"
            , "The quick brown fox jumps over the lazy dog."
            , "Waltz, bad nymph, for quick jigs vex."
            , "Glib jocks quiz nymph to vex dwarf."
            , "Sphinx of black quartz, judge my vow."
            , "How quickly daft jumping zebras vex!"
            , "The five boxing wizards jump quickly."
            , "Jackdaws love my big sphinx of quartz."
            , "Pack my box with five dozen liquor jugs."
            , "Mr Jock, TV quiz PhD, bags few lynx."
            ]
    for_ sentence $ \str -> do
        printf "%s -> %s\n" str $ show $ isPangram str

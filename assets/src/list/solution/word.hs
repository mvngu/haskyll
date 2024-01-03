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
import Data.List
import Text.Printf

-- | Britannica's 100 essential words for the TOEFL.
word =
    [ "accolade"
    , "circumvent"
    , "dearth"
    , "jargon"
    , "labor"
    , "ludicrous"
    , "malice"
    , "mettle"
    , "microcosm"
    , "morose"
    , "mundane"
    , "nettle"
    , "obdurate"
    , "obtain"
    , "obviate"
    , "jibe"
    , "oppress"
    , "irresolute"
    , "irksome"
    , "interpret"
    , "inscrutable"
    , "ingratiate"
    , "indefatigable"
    , "incidental"
    , "implacable"
    , "ignominy"
    , "ignominious"
    , "hypothesis"
    , "scrutinize"
    , "widespread"
    , "waive"
    , "vilify"
    , "vestige"
    , "turgid"
    , "sustain"
    , "stupendous"
    , "stable"
    , "simper"
    , "glib"
    , "retrieve"
    , "renegade"
    , "redolent"
    , "rebuke"
    , "range"
    , "querulous"
    , "proximity"
    , "prior"
    , "platitude"
    , "permeate"
    , "peremptory"
    , "bestow"
    , "credence"
    , "corpulent"
    , "copious"
    , "construe"
    , "cogent"
    , "coalesce"
    , "circumspect"
    , "candid"
    , "callous"
    , "bulwark"
    , "bucolic"
    , "bland"
    , "credible"
    , "belie"
    , "banter"
    , "bane"
    , "avarice"
    , "augment"
    , "askance"
    , "arbitrary"
    , "ambiguous"
    , "alacrity"
    , "accord"
    , "ensue"
    , "gibe"
    , "generate"
    , "frustrate"
    , "fluctuate"
    , "fiasco"
    , "feasible"
    , "fatuous"
    , "exploit"
    , "expatiate"
    , "evaluate"
    , "estimate"
    , "entreat"
    , "accede"
    , "effete"
    , "edict"
    , "divulge"
    , "distribute"
    , "discursive"
    , "disconcert"
    , "diffident"
    , "didactic"
    , "deplete"
    , "deference"
    , "zealot"
    , "zenith"
    ]

-- | Whether any word starts with a given letter.
startsWith :: String -> Bool
startsWith str = or [str `isPrefixOf` w | w <- word]

-- | Whether all words have at least 2 vowels.
twoVowels :: [String] -> Bool
twoVowels wrds = and [vowel w >= 2 | w <- wrds]

-- | The number of unique vowels in a word.
vowel :: String -> Int
vowel str = sum [1 :: Int | v <- "aeiou", v `elem` str]

-- | Britannica's 100 essential words for the TOEFL.
main = do
    let alphabet = ['a' .. 'z']
    -- For each letter of the alphabet, is there a word that starts with the
    -- given letter?
    for_ alphabet $ \c -> do
        printf "%s -> %s\n" [c] $ show . startsWith $ [c]
    let missing = [c | c <- alphabet, startsWith [c] == False]
    printf "None of the words begin with these letters: %s\n" missing
    -- Do all words have at least 2 unique vowels?
    let oneVowel = filter (\w -> vowel w == 1) word
    putStrLn ""
    printf "Each word has >= 2 unique vowels? %s\n" $ show . twoVowels $ word
    printf "%s\n" $ show oneVowel
    -- Are all words of at least length 5?
    let testAtLeast5 = all (\w -> length w >= 5) word
    let atMost4 = filter (\w -> length w < 5) word
    putStrLn ""
    printf "Each word has length >= 5? %s\n" $ show testAtLeast5
    printf "%s\n" $ show atMost4

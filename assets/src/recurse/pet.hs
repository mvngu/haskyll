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

import Data.Foldable
import Data.List
import Text.Printf

-- | Database of pet names.
pet =
    [ "Anonymouse"
    , "Cat Scan"
    , "Charlie Chihuahua"
    , "Chirpie O'Tweet"
    , "Dogalogue"
    , "Fido Dogstoevsky"
    , "Frankie Frankfurt"
    , "Garry Longtongue"
    , "Goldie Horn"
    , "Hamsuke Hamton"
    , "Harry Speedbump"
    , "Mrs. Clucky"
    , "Papa's New Guinea"
    , "Roam Ferret Roam"
    , "Robbie Hopster"
    , "Scratchy Meowser"
    , "Tabby Whiskers"
    , "Terry Terrier"
    , "Woofy McBark"
    ]

-- | All pet names that start with a given prefix.
startsWith :: String -> [String]
startsWith str = filter (\x -> str `isPrefixOf` x) pet

-- | Managing a pets database.
main = do
    putStrLn "Names beginning with C"
    for_ (startsWith "C") $ \x -> printf "%s\n" x
    putStrLn "\nNames beginning with R"
    for_ (startsWith "R") $ \x -> printf "%s\n" x

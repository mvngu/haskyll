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

-- | Database of pets.  Each element in the database follows this format:
--
-- (pet-name, animal-type, health-check)
--
-- pet-name := The name of the pet.
-- animal-type := The type of animal, e.g. cat, dog, fish, etc.
-- health-check := Whether the pet has had a health check within the last
-- 12 months.
pet =
    [ ("Anonymouse", "mouse", False)
    , ("Cat Scan", "cat", True)
    , ("Catherine the Grater", "cat", True)
    , ("Charlie Chihuahua", "dog", True)
    , ("Chirpie O'Tweet", "bird", False)
    , ("Dogalogue", "dog", True)
    , ("Fido Dogstoevsky", "dog", True)
    , ("Frankie Frankfurt", "dog", True)
    , ("Garry Longtongue", "lizard", True)
    , ("Goldie Horn", "fish", False)
    , ("Hamsuke Hamton", "hamster", True)
    , ("Harry Speedbump", "hedgehog", True)
    , ("Hissy Fit", "cat", True)
    , ("Meowzart", "cat", True)
    , ("Mrs. Clucky", "bird", True)
    , ("Papa's New Guinea", "guinea pig", True)
    , ("Roam Ferret Roam", "ferret", True)
    , ("Robbie Hopster", "rabbit", True)
    , ("Scratchy Meowser", "cat", True)
    , ("Tabby Whiskers", "cat", True)
    , ("Terry Terrier", "dog", True)
    , ("Woofy McBark", "dog", True)
    ]

-- | Extract a particular type of animal from the database.
extract :: String -> [(String, String, Bool)]
extract "" = error "Cannot be empty string"
extract t  = filter (\(_, animal, _) -> animal == t) pet

-- | Whether a list of pets have had a health check within the last
-- 12 months.
hasHealthCheck :: [(String, String, Bool)] -> Bool
hasHealthCheck [] = False
hasHealthCheck xs = and [check | (_, _, check) <- xs]

-- | Managing a pets database.
main = do
    let animal =
            [ "bird"
            , "cat"
            , "dog"
            , "ferret"
            , "fish"
            , "guinea pig"
            , "hamster"
            , "hedgehog"
            , "lizard"
            , "mouse"
            , "rabbit"
            ]
    putStrLn "Health check status"
    printf "all pets -> %s\n" $ show . hasHealthCheck $ pet
    for_ animal $ \anim -> do
        let pt = extract anim
        putStr anim
        printf " -> %s\n" $ show . hasHealthCheck $ pt
    -- Whether any of the birds have had a health check.
    let bird = extract "bird"
    let testAll = all (\(_, _, check) -> check) bird
    let testAny = any (\(_, _, check) -> check) bird
    printf "All birds have health check? %s\n" $ show testAll
    printf "Some birds have health check? %s\n" $ show testAny

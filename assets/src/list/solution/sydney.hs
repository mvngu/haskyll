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

-- | Data on female players of Sydney FC during the 2022--2023 season.
-- Each tuple follows the format:
--
-- (name, nationality, goals, non-penalty-goals, penalty-kicks)
--
-- where
--
-- name := The name of the player.
-- nationality := The nationality of the player.
-- goals := The number of goals scored.
-- non-penalty-goals := The number of goals that do not result from a
--     penalty kick.
-- penalty-kicks := The number of penalty kicks.
player =
    [ ("Princess Ibini-Isei", "AUS", 7, 6, 1)
    , ("Charlize Rule", "AUS", 0, 0, 0)
    , ("Sarah Hunter", "AUS", 4, 4, 0)
    , ("Cortnee Vine", "AUS", 7, 7, 0)
    , ("Mackenzie Hawkesby", "AUS", 6, 5, 1)
    , ("Natalie Tobin", "AUS", 2, 2, 0)
    , ("Charlotte Mclean", "AUS", 0, 0, 0)
    , ("Jada Mathyssen-Whyman", "AUS", 0, 0, 0)
    , ("Shay Hollman", "AUS", 0, 0, 0)
    , ("Deborah De La Harpe", "IRL", 0, 0, 0)
    , ("Kirsty Fenton", "AUS", 0, 0, 0)
    , ("Madison Haley", "USA", 8, 8, 0)
    , ("Rachel Lowe", "AUS", 4, 4, 0)
    , ("Anna Green", "NZL", 0, 0, 0)
    , ("Katie Offer", "AUS", 0, 0, 0)
    , ("Indiana Dos Santos", "AUS", 1, 1, 0)
    , ("Tahlia Franco", "AUS", 0, 0, 0)
    , ("Rola Badawiya", "AUS", 1, 1, 0)
    , ("Mary Stanic-Floody", "AUS", 0, 0, 0)
    , ("Remy Siemsen", "AUS", 2, 2, 0)
    , ("Shadeene Evans", "AUS", 0, 0, 0)
    , ("Abbey Lemon", "AUS", 0, 0, 0)
    , ("Jynaya Dos Santos", "AUS", 0, 0, 0)
    , ("Teigan Collister", "AUS", 0, 0, 0)
    , ("Anika Stajcic", "AUS", 0, 0, 0)
    , ("Jasmine Black", "AUS", 0, 0, 0)
    , ("Margaux Chauvet", "AUS", 0, 0, 0)
    ]

-- | All players who scored at least the given number of goals.
hasGoal :: Int -> [(String, String, Int, Int, Int)]
hasGoal n = [(p, nat, g, gpk, pk) | (p, nat, g, gpk, pk) <- player, g >= n]

-- | Are all players of a given nationality?
nationality :: String -> Bool
nationality str = and [nat == str | (_, nat, _, _, _) <- player]

-- | Of those players who scored at least n goals, were all the goals the
-- results of non-penalty kicks?
nonPenalty :: Int -> Bool
nonPenalty n = and [g == gpk | (_, _, g, gpk, _) <- hasGoal n]

-- | All players who are not of a given nationality.
otherNationality :: String -> [(String, String, Int, Int, Int)]
otherNationality str = [(p, nat, g, gpk, pk) | (p, nat, g, gpk, pk) <- player, nat /= str]

-- | Of those players who are not of a given nationality, did any of them score
-- goals?
otherNatGoal :: String -> Bool
otherNatGoal str = or [g > 0 | (_, _, g, _, _) <- otherNationality str]

-- | Of those players who scored at least n goals, which players scored goals
-- that were results of penalty kicks?
penalty :: Int -> [(String, String, Int, Int, Int)]
penalty n = filter (\(_, _, g, gpk, _) -> g > gpk) player

-- | Of those players who had at least 1 penalty kick, did the kicks all result
-- in goals?
successfulPenalty :: Int -> Bool
successfulPenalty n = and [g - gpk == pk | (_, _, g, gpk, pk) <- player, pk > 0]

-- | Data on female players of Sydney FC during the 2022--2023 season.
main = do
    let allAussie = nationality "AUS"
    -- Are all players of Australian nationality?
    let otherNat = otherNationality "AUS"
    printf "All players of Australian nationality? %s\n" $ show allAussie
    for_ otherNat $ \(p, nat, _, _, _) -> do
        printf "%s -> %s\n" p nat
    -- Of those players who scored at least one goal, were all the goals the
    -- results of non-penalty kicks?
    putStrLn ""
    printf "All goals result from non-penalty kicks? %s\n" $ show . nonPenalty $ 1
    for_ (penalty 1) $ \(p, _, _, _, k) -> do
        printf "%s, penalty kicks -> %d\n" p k
    -- Of those players who had at least 1 penalty kick, did the kicks all
    -- result in goals?
    putStrLn ""
    printf "All penalty kicks resulted in goals? %s\n" $ show . successfulPenalty $ 1
    -- Of those players who are not of Australian nationality, did any of them
    -- score goals?
    putStrLn ""
    printf "Any non-Aussies scored goals? %s\n" $ show . otherNatGoal $ "AUS"
    for_ (otherNationality "AUS") $ \(p, nat, g, _, _) -> do
        printf "%s, %s, %d\n" p nat g

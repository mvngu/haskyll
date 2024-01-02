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

import Text.Printf

-- | Goals scored by male players of Arsenal during the 2022--2023
-- season of the Premier League. Each tuple follows the format
-- (name, goals, goals-pk), where
--
-- name := The name of the player.
-- goals := The number of goals the player scored.
-- goals-pk := The number of non-penalty goals scored.
goal =
    [ ("Ben White", 2, 2)
    , ("Bukayo Saka", 14, 12)
    , ("Eddie Nketiah", 4, 4)
    , ("Fabio Vieira", 1, 1)
    , ("Gabriel Dos Santos", 3, 3)
    , ("Gabriel Jesus", 11, 10)
    , ("Gabriel Martinelli", 15, 15)
    , ("Granit Xhaka", 7, 7)
    , ("Jakub Kiwior", 1, 1)
    , ("Leandro Trossard", 1, 1)
    , ("Martin Ødegaard", 15, 15)
    , ("Oleksandr Zinchenko", 1, 1)
    , ("Rob Holding", 1, 1)
    , ("Reiss Nelson", 3, 3)
    , ("Thomas Partey", 3, 3)
    , ("William Saliba", 2, 2)
    ]

-- | Were all the goals scored non-penalty?
main = do
    let testAll = all (\(_, g, p) -> g == p) goal
    let testAnd = and [g == p | (_, g, p) <- goal]
    let testOr = or [g == p | (_, g, p) <- goal]
    printf "(all) all non-penalty goals? %s\n" $ show testAll
    printf "(and) all non-penalty goals? %s\n" $ show testAnd
    printf "(or) some non-penalty goals? %s\n" $ show testOr
    let testAny = any (\(_, g, p) -> g > p) goal
    printf "(any) some penalty goals? %s\n" $ show testAny

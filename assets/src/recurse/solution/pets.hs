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
import Text.Printf

-- | A pets database.
database =
    [ ("Anonymouse", "1")
    , ("Charlie Chihuahua", "2")
    , ("Chirp O'Tweet", "1")
    , ("Frankie Frankfurt", "2")
    , ("Garry Longtongue", "1")
    , ("Goldie Horn", "1")
    , ("Hamsuke Hamton", "1")
    , ("Harry Speedbump", "2")
    , ("Robbie Hopster", "1")
    , ("Scratchy Meowser", "3")
    , ("Tabby Whiskers", "2")
    , ("Terry Terrier", "2")
    , ("Woofy McBark", "3")
    ]

-- | Update a pets database.
main = do
    let db = map (\(name, age) -> (name, read age :: Int)) database
    let update = map (\(name, age) -> (name, age + 1)) db
    for_ update $ \(name, age) -> do
        printf "%s: %d\n" name age

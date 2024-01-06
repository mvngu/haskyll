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

import Data.Foldable
import Text.Printf

-- | The prefix of a name.  This implementation uses a case expression.
prefixc :: String -> String
prefixc name
    | 0 < size && size <= 3 = name
    | otherwise =
        case size of
            0 -> ['\0']
            _ -> [name !! 0]
  where
    size = length name

-- | The prefix of a name.  This implementation does not use a case expression.
prefixg :: String -> String
prefixg name
    | size == 0 = ['\0']
    | size <= 3 = name
    | otherwise = [name !! 0]
  where
    size = length name

-- | The prefix of a person's name.
main = do
    let name =
            [ "Albrecht Dürer"
            , "Andrea Mantegna"
            , "Donatello"
            , ""
            , "Giovanni Bellini"
            , "Jan van Eyck"
            , "Jo"
            , "Leonardo da Vinci"
            , "Lorenzo Ghiberti"
            , "Michelangelo"
            , "Raphael"
            , "Sandro Botticelli"
            , "Sue"
            , "T"
            ]
    for_ name $ \x -> do
        let pre = prefixc x
        printf "%s -> %s, %s\n" x pre $ show (pre == prefixg x)

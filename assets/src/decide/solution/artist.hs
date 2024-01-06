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

-- | A major field associated with a Renaissance artist.
artist :: String -> String
artist name =
    case name of
        "Albrecht Dürer"    -> "painter"
        "Andrea Mantegna"   -> "painter"
        "Donatello"         -> "sculptor"
        "Giovanni Bellini"  -> "painter"
        "Jan van Eyck"      -> "painter"
        "Leonardo da Vinci" -> "painter"
        "Lorenzo Ghiberti"  -> "sculptor"
        "Michelangelo"      -> "painter"
        "Raphael"           -> "painter"
        "Sandro Botticelli" -> "painter"
        _                   -> "unknown Renaissance artist"

-- | A major field associated with a Renaissance artist.
main = do
    let name =
            [ "Albrecht Dürer"
            , "Andrea Mantegna"
            , "Donatello"
            , "Giovanni Bellini"
            , "Hairy Potter"
            , "I. M. Painter"
            , "Jan van Eyck"
            , "Leonardo da Vinci"
            , "Lorenzo Ghiberti"
            , "Michelangelo"
            , "Raphael"
            , "Sandro Botticelli"
            ]
    for_ name $ \x -> do
        printf "%s -> %s\n" x $ artist x

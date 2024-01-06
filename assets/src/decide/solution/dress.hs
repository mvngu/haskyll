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

-- | The shoes recommendation corresponding to a dress.  The recommendation is
-- by InStyle:
--
-- https://web.archive.org/web/20240106070733/https://www.instyle.com/what-shoes-to-wear-with-dresses-7558636
recommend :: String -> String
recommend dress =
    case dress of
        "babydoll dress"         -> "loafers"
        "blazer dress"           -> "kitten heels"
        "button-down shirtdress" -> "white sneakers"
        "cocktail dress"         -> "open-toe heeled sandals"
        "denim dress"            -> "cowboy boots, sneakers, loafers"
        "full skirt"             -> "pointed-toe pumps, heeled sandals"
        "maxidress"              -> "strappy block heels"
        "midi dress"             -> "open-toe kitten heel"
        "minidress"              -> "ballet flats"
        "slip dress"             -> "anything and everything"
        "sundress"               -> "loafers"
        "T-shirt dress"          -> "combat boots"
        _                        -> "no recommendation"

-- | Recommend shoes for a dress.  The different types of dresses are taken from
-- Nordstrom:
--
-- https://www.nordstrom.com/browse/content/blog/types-of-dresses
main = do
    let dress =
            [ "A-line dress"
            , "asymmetrical dress"
            , "babydoll dress"
            , "ballgown"
            , "blazer dress"
            , "body-con dress"
            , "button-down shirtdress"
            , "cocktail dress"
            , "denim dress"
            , "empire-waist dress"
            , "full skirt"
            , "halter dress"
            , "high-low dress"
            , "long-sleeve dress"
            , "maxidress"
            , "mermaid dress"
            , "midi dress"
            , "minidress"
            , "off-the-shoulder dress"
            , "one-shoulder dress"
            , "pencil dress"
            , "pouf dress"
            , "princess dress"
            , "sheath dress"
            , "shift dress"
            , "shirtdress"
            , "slip dress"
            , "smock dress"
            , "strapless dress"
            , "sundress"
            , "sweater dress"
            , "tea-length dress"
            , "T-shirt dress"
            , "wrap dress"
            ]
    for_ dress $ \x -> do
        printf "%s -> %s\n" x $ recommend x

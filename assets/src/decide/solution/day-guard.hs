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

import Text.Printf

-- | A saying for each day of the week.
saying :: String -> String
saying day
    | day == "Monday" = "It's a weekday\nA case of the Mondays"
    | day == "Tuesday" = "It's a weekday\nTaco night"
    | day == "Wednesday" = "It's a weekday\nIt's Wednesday, my dude\nWTF"
    | day == "Thursday" = "It's a weekday\nHang in there. One more day.\nWTF"
    | day == "Friday" = "It's a weekday\nThank Gwynevere it's Friday\nWTF"
    | day == "Saturday" = "Weekend fun\nCaturday :3"
    | day == "Sunday" = "Weekend fun\nSunday driver"
    | otherwise = "Not a day of the week"

-- | A daily saying.
main = do
    putStrLn "Enter a day of the week."
    day <- getLine
    putStrLn $ saying day

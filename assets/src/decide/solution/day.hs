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
main = do
    putStrLn "Enter a day of the week."
    day <- getLine
    if day == "Monday"
        then do
            putStrLn "It's a weekday"
            putStrLn "A case of the Mondays"
        else if day == "Tuesday"
                 then do
                     putStrLn "It's a weekday"
                     putStrLn "Taco night"
                 else if day == "Wednesday"
                          then do
                              putStrLn "It's a weekday"
                              putStrLn "It's Wednesday, my dude"
                              putStrLn "WTF"
                          else if day == "Thursday"
                                   then do
                                       putStrLn "It's a weekday"
                                       putStrLn "Hang in there. One more day."
                                       putStrLn "WTF"
                                   else if day == "Friday"
                                            then do
                                                putStrLn "It's a weekday"
                                                putStrLn "Thank Gwynevere it's Friday"
                                                putStrLn "WTF"
                                            else if day == "Saturday"
                                                     then do
                                                         putStrLn "Weekend fun"
                                                         putStrLn "Caturday :3"
                                                     else if day == "Sunday"
                                                              then do
                                                                  putStrLn "Weekend fun"
                                                                  putStrLn "Sunday driver"
                                                              else putStrLn "Not a day of the week"

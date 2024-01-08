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

-- Do not alphabetize ----------------------------------------------------------
--------------------------------------------------------------------------------

-- | Basic information about a country.
countryInfoA :: String -> String
countryInfoA name =
    case name of
        "Argentina" -> toString (name, "Buenos Aires", "DMY", "Argentine peso")
        "Australia" -> toString (name, "Canberra", "DMY", "Australian dollar")
        "Bhutan" -> toString (name, "Thimphu", "YMD", "Ngultrum")
        "Canada" -> toString (name, "Ottawa", "YMD", "Canadian dollar")
        "Puerto Rico" -> toString (name, "San Juan", "MDY", "U.S. dollar")
        "USA" -> toString (name, "Washington, D.C.", "MDY", "U.S. dollar")
        _ -> "Unknown country: " ++ name

-- | Join the list elements into a string.  Use the given delimiter to
-- separate the string representations of the elements.
join :: String -> [String] -> String
join _ []         = ""
join delim (x:xs) = foldl (\acc y -> concat [acc, delim, y]) x xs

-- | Format basic information about a country.
toString :: (String, String, String, String) -> String
toString (country, capital, date, currency) = join "\n" [cntry, city, dform, money]
  where
    cntry = "Country: " ++ country
    city = "Capital city: " ++ capital
    dform = "Date format: " ++ date
    money = "Currency: " ++ currency

-- | Basic information about a country given its ISO 3166 code.  This
-- implementation uses functions as return values.
countryInfoB code = toString . countryInfo $ code
  where
    countryInfo = getCountryFunc code

-- | The function to handle a given country code.
getCountryFunc code =
    case code of
        "AR" -> argentina
        "AU" -> australia
        "BT" -> bhutan
        "CA" -> canada
        "PR" -> puertoRico
        "US" -> usa
        _    -> \x -> (x, "", "", "")

-- Details relating to various countries ---------------------------------------
--------------------------------------------------------------------------------

argentina = \x -> ("Argentina, " ++ x, "Buenos Aires", "day-month-year", "ARS")

australia = \x -> ("Australia, " ++ x, "Canberra", "day-month-year", "AUD")

bhutan = \x -> ("Bhutan, " ++ x, "Thimphu", "year-month-day", "BTN")

canada = \x -> ("Canada, " ++ x, "Ottawa", "year-month-day", "CAD")

puertoRico = \x -> ("Puerto Rico, " ++ x, "San Juan", "month-day-year", "USD")

usa = \x -> ("USA, " ++ x, "Washington, D.C.", "month-day-year", "USD")

-- | Print basic information about a country.
main = do
    let country = ["Argentina", "Australia", "Bhutan", "Canada", "Puerto Rico", "USA", "USB"]
    putStrLn "First implementation"
    for_ country $ \x -> do
        printf "\n%s\n" $ countryInfoA x
    putStrLn "\nImplementation that uses returned functions"
    let code = ["AR", "AU", "BT", "CA", "PR", "US", "USB"]
    for_ code $ \x -> do
        printf "\n%s\n" $ countryInfoB x

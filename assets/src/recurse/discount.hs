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

-- | Current prices of items at or below $200.
priceB = [5.00, 7.25, 10.95, 49.99, 99.95, 150.50, 175.95, 195.0] :: [Double]

-- | Current prices of items below $100.
price = [5.00, 7.25, 10.95, 49.99, 99.95] :: [Double]

-- | Round a price to 2 decimal places.
roundPrice :: Double -> Double
roundPrice p = numerator / factor
  where
    factor = 10.0 ^ 2
    numerator = fromIntegral . round $ p * factor

-- | Apply a discount on various items.
main = do
    let newPrice = map (\x -> roundPrice $ 0.85 * x) price
    printf "%s -> %s\n" (show price) $ show newPrice
    let expensive = filter (\x -> x >= 100.0) priceB
    let newPriceB = map (\x -> roundPrice $ 0.9 * x) expensive
    printf "%s -> %s\n" (show expensive) $ show newPriceB

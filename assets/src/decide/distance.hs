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

-- | The Euclidean distance between two points.
distanceA :: Floating a => (a, a) -> (a, a) -> a
distanceA (a, b) (x, y) = sqrt $ p + q
  where
    p = (x - a) ^ 2
    q = (y - b) ^ 2

-- | The Euclidean distance between two points, without "where".
distanceB :: Floating a => (a, a) -> (a, a) -> a
distanceB (a, b) (x, y) = do
    let p = (x - a) ^ 2
    let q = (y - b) ^ 2
    sqrt $ p + q

-- | Euclidean distance in the plane.
main = do
    let aa = (3, 2) :: (Double, Double)
    let ab = (4, 1) :: (Double, Double)
    let ba = (0, 4) :: (Double, Double)
    let bb = (6, 2) :: (Double, Double)
    let ca = (1, 7) :: (Double, Double)
    let cb = (8, 6) :: (Double, Double)
    let dista = distanceA aa ab
    let distb = distanceA ba bb
    let distc = distanceA ca cb
    let testa = dista == distanceB aa ab
    let testb = distb == distanceB ba bb
    let testc = distc == distanceB ca cb
    printf "Distance %s -> %s: %f, %s\n" (show aa) (show ab) dista $ show testa
    printf "Distance %s -> %s: %f, %s\n" (show ba) (show bb) distb $ show testb
    printf "Distance %s -> %s: %f, %s\n" (show ca) (show cb) distc $ show testc

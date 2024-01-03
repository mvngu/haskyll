---
title: Free range numbers
math: true
order: 23
---

[An exercise][exRange] in the section [You're not on the list][secList] briefly
presents the range notation for constructing lists. In this section, we discuss
the range notation in some depth. We present two range notations for
constructing finite lists and their infinite counterparts.

<!--=========================================================================-->

## First and last

The range notation `[first .. last]` creates a finite list with unit step size.
A function that does the same thing is [`enumFromTo`][enumFromTo]. The first
element of the list is `first`, the second element is `first + 1`, the third
element is `first + 1 + 1`, and so on, with the last element being `last`. For
example, we can construct a list of all integers between 1 and 10 as follows:

```haskell
ghci> [1 .. 10]
[1,2,3,4,5,6,7,8,9,10]
ghci> enumFromTo 1 10
[1,2,3,4,5,6,7,8,9,10]
```

The above examples work out as intended because `first >= last`. If we prefer
our numbers to be descending and use the code `[10 .. 1]`, then the result would
be an empty list.

The notation `[first .. last]` also works with floating-point numbers, but we
must be careful with the number we specify as `last`. As the step size is 1, the
last element in the list might not be `last` at all. Examine the following code:

```haskell
ghci> [2.3 .. 6.3]
[2.3,3.3,4.3,5.3,6.3]
ghci> enumFromTo 2.3 6.3
[2.3,3.3,4.3,5.3,6.3]
ghci> [2.3 .. 6.5]
[2.3,3.3,4.3,5.3,6.3]
ghci> enumFromTo 2.3 6.5
[2.3,3.3,4.3,5.3,6.3]
```

The range notation also works with printable [ASCII characters][ASCII]:

```haskell
ghci> ['a' .. 'z']
"abcdefghijklmnopqrstuvwxyz"
ghci> enumFromTo 'a' 'z'
"abcdefghijklmnopqrstuvwxyz"
ghci> ['!' .. '/']
"!\"#$%&'()*+,-./"
ghci> enumFromTo '!' '/'
"!\"#$%&'()*+,-./"
```

<!--=========================================================================-->

## First, second, last

The range notation `[first, second .. last]` is similar to `[first .. last]`,
but we can specify the step size. In the second notation, the step size is
`delta = second - first`. The equivalent function is
[`enumFromThenTo`][enumFromThenTo]. The first element of the list is `first`,
the second element is `first + delta`, the third element is
`first + delta + delta`, and so on, with the last element being no more than
`last`. Depending on the step size, the last element of the list might not be
`last` itself. Observe the following examples:

```haskell
ghci> [1, 4 .. 10]
[1,4,7,10]
ghci> enumFromThenTo 1 4 10
[1,4,7,10]
ghci> [1, 4 .. 12]
[1,4,7,10]
ghci> enumFromThenTo 1 4 12
[1,4,7,10]
```

The step size `delta` allows us to construct a list of ascending or descending
numbers. If the value of `delta` is positive, our list would be ascending. If
the value of `delta` is negative, we would have a descending list. Here are some
examples:

```haskell
ghci> [10, 8 .. -3]
[10,8,6,4,2,0,-2]
ghci> enumFromThenTo 10 8 (-3)
[10,8,6,4,2,0,-2]
```

[NASA][NASA] recently contacted you about a piece of software they want. Believe
it or not, NASA wants you to write a program to count down to lift off for their
upcoming rocket launch. No problem. Here's the Haskell code:

[`liftoff.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/liftoff.hs)
```haskell
import Data.Foldable
import Text.Printf

-- | Count down from 10.
main = do
    let num = [10,9 .. 0] :: [Int]
    for_ num $ \x -> printf "%d\n" x
    putStrLn "Lift off"
```

The notation `[first, second .. last]` also works with printable ASCII
characters:

```haskell
ghci> ['a', 'c' .. 'z']
"acegikmoqsuwy"
ghci> enumFromThenTo 'a' 'c' 'z'
"acegikmoqsuwy"
ghci> ['5', '3' .. '#']
"531/-+)'%#"
ghci> enumFromThenTo '5' '3' '#'
"531/-+)'%#"
```

<!--=========================================================================-->

## First

The range notation can also be used to generate infinite lists. The infinite
counterpart to the notation `[first .. last]` is the range notation `[first..]`.
The notation `[first..]` generates an infinite list starting from `first` with
step size of 1. It is syntactic sugar for the code `enumFrom first`, where we
use the function [`enumFrom`][enumFrom].

<!--=========================================================================-->

### Perfect squares

Why use an infinite list? Some situations require infinite lists, while others
do not. I know how much you love mathematics. Here's such an example. A number
$n$ is a [perfect square][perfectSquare] if there is an integer $k$ such that
$n = k^2$. Determine the smallest odd integer $n > 1$ that is a perfect square.
That's easy. Test each integer from 3 to see whether its square root is an
integer. The following code implements the test.

[`perfect.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/perfect.hs)
```haskell
import Text.Printf

-- | Whether an integer is a perfect square.
isPerfectSq :: Integer -> Bool
isPerfectSq x = do
    let k = floor . sqrt . fromIntegral $ x
    k ^ 2 == x

-- | Given a list of integers, retain those that are perfect squares.
perfectSq :: [Integer] -> [Integer]
perfectSq xs = filter isPerfectSq xs

-- | Perfect squares.
main = do
    let ell = [3 ..] :: [Integer]
    let perfect = head $ filter odd $ perfectSq ell
    printf "%d\n" perfect
```

The above code outputs what we want. However, it seems like too much code for a
simple task. Let's rethink the problem. Perfect squares are obtained by squaring
each integer from 1 onward. For the moment, ignore the negative integers
although we know that the square of a negative integer is positive. We could use
`map` together with a lambda expression to square each integer from the list
`[1..]`. The problem demands a perfect greater than 1. Square each integer in
the revised list `[2..]`, `filter` those that are odd, and obtain the first
element of the resulting list. The above can be accomplished as follows:

```haskell
ghci> head $ filter odd $ map (\x -> x^2) [2..]
9
```

There must be an easier solution. Back to the drawing board. The square of 1 is
1, which is a perfect square but is still 1, hence we rule it out. The square of
2 is 4, which we rule out because this perfect square is even. The square of 3
is 9, which is the first perfect square greater than 1 that is also odd.

Why endure the trouble of writing the above code? Writing things down and
working through a problem can help us to arrive at a simple solution. Sometimes
the solution does not require coding, while some other problems might require us
to experiment with some code. Now suppose that we must determine the smallest
integer $n$ satisfying the following properties:

-   We must have $n > 100$.
-   The integer $n$ must be odd.
-   The integer $n$ must be a perfect square.

With a little bit of modification to the code in the above GHCi session, we
obtain:

```haskell
ghci> head $ filter (\x -> x > 100) $ filter odd $ map (\x -> x^2) [2..]
121
```

<!--=========================================================================-->

### Finite lists

Sometimes the range notation `[first..]` can generate a finite list, instead of
an infinite list. This happens in cases where the data type of `first` is known
to have a finite number of values. For example, there are only a finite number
of characters starting from the whitespace character `' '`. The range notation
`[' '..]` would generate a finite, albeit long, list. Similarly, the type `Bool`
has a finite number of values. The range notation `[False ..]` would generate
all the possible boolean values, i.e. `False` and `True`. Why did we use a
whitespace in `[False ..]`? To prevent a parsing error. Alternatively, we could
have written the following:

```haskell
ghci> enumFrom False
[False,True]
```

<!--=========================================================================-->

## First and second

The range notation `[first, second..]` is the infinite counterpart of the
notation `[first, second .. last]`. It is syntactic sugar for
`enumFromThen first second`, where we use the function
[`enumFromThen`][enumFromThen].

Some examples should help to clarify how to use the range notation
`[first, second..]`. Here are the first 10 even and odd positive integers:

```haskell
ghci> take 10 [1, 3 ..]
[1,3,5,7,9,11,13,15,17,19]
ghci> take 10 [2, 4 ..]
[2,4,6,8,10,12,14,16,18,20]
```

Below, we find the first 10 even positive integers that are divisible by 3:

```haskell
ghci> take 10 $ filter even $ filter (\x -> mod x 3 == 0) [1..]
[6,12,18,24,30,36,42,48,54,60]
ghci> take 10 $ filter (\x -> mod x 3 == 0) [2, 4 ..]
[6,12,18,24,30,36,42,48,54,60]
```

Here are all positive odd integers at most 100 that are multiples of 3 or 5, or
both:

```haskell
ghci> take 24 $ filter (\x -> mod x 3 == 0 || mod x 5 == 0) [1,3..]
[3,5,9,15,21,25,27,33,35,39,45,51,55,57,63,65,69,75,81,85,87,93,95,99]
```

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> Use range notation to output all the ASCII characters.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong id="exPhobias">Exercise 2.</strong> Some cultures have specific phobias related to numbers. Examples include:
<!-- prettier-ignore-end -->

-   [Tetraphobia][tetraphobia]: fear of 4, mainly in east Asian cultures.
-   [Curse of the ninth][nine]: fear of 9, mainly in Western cultures.
-   [Triskaidekaphobia][triskaidekaphobia]: fear of 13, mainly in Western
    cultures.
-   [Heptadecaphobia][heptadecaphobia]: fear of 17, mainly in Italy, and
    countries of Greek and Latin origins.
-   [Triakontenneaphobia][triakontenneaphobia]: also known as the curse of 39,
    the fear of 39, mainly in Afghanistan.
-   [Number of the beast][beastNumber]: fear of 666, mainly in Christian
    cultures.

Given a list of positive integers, write a program to remove all integers that
are multiples of the above phobia-related numbers. How many integers between 1
and 1,000 do not contain multiples of the above fear-inducing numbers?

<!-- prettier-ignore-start -->
<strong id="exBunchMultiples">Exercise 3.</strong> Consider the following problems:
<!-- prettier-ignore-end -->

-   The least positive integer that is divisible by 2.
-   The least positive integer that is divisible by 2 and 3.
-   The least positive integer that is divisible by 2, 3, and 4.
-   The least positive integer that is divisible by 2, 3, 4, and 5.
-   The least positive integer that is divisible by 2, 3, 4, 5, and 6.
-   The least positive integer that is divisible by 2, 3, 4, 5, 6, and 7.
-   The least positive integer that is divisible by 2, 3, 4, 5, 6, 7, and 8.
-   The least positive integer that is divisible by 2, 3, 4, 5, 6, 7, 8, and 9.

Write a program to solve each of the above problems.

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> How valuable or precious a bunch of positive integers is depends on their
multiples. Given the list `[2, 4, 5]`, the product of the list is 40. The
numbers 20 and 40 are all positive integers at most 40 that are multiples of
each of 2, 4, and 5. The value of the list `[2, 4, 5]` is the sum $20 + 40 =
60$. On the other hand, the list `[3, 5, 6, 7]` is more valuable. The product of
the list is 630. The numbers 210, 420, and 630 are the only positive integers at
most 630 that are multiples of 3, 5, 6, and 7. The value of the list
`[3, 5, 6, 7]` is the sum $210 + 420 + 630 = 1260$. Write a program to determine
the value of a random list of integers between 2 and 10.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong id="exWheat">Exercise 5.</strong> In the year 1256, the Arabic scholar Ibn Khallikan wrote about the story of
Grand Vizier Sissa ben Dahir and his request for grains on a chessboard.[^a] The
Indian King Shirham wanted to reward Sissa for inventing the game of
chess. Sissa replied that he wanted 1 grain of wheat on the first square of the
chessboard, 2 grains on the second square, 4 grains on the third square, 8
grains on the fourth square, and so on for all 64 squares of the
chessboard. Write a program to determine how many grains of wheat Sissa
requested.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong id="exPythagoreanTriple">Exercise 6.</strong> A [Pythagorean triple][pythagoreanTriple] is a trio $(a,\, b,\, c)$ of positive
integers such that $a^2 + b^2 = c^2$. If the integers $a,\, b,\, c$ have a
greatest common divisor (GCD) of 1, then the trio is called a primitive
Pythagorean triple (PPT).
<!-- prettier-ignore-end -->

1. Use a brute force method to determine all PPTs where each member is less
   than 100.
1. Euclid provided[^b] a formula to generate PPTs. Let $m$ and $n$ be positive
   integers such that $m > n$ and $\gcd(m,\, n) = 1$. Then the integers

    $$
    a = m^2 - n^2,\quad
    b = 2mn,\quad
    c = m^2 + n^2
    $$

    form a PPT. Use Euclid's formula to generate PPTs at most 100. Verify
    whether Euclid's formula can generate all PPTs as output by the above brute
    force method.

<!-- prettier-ignore-start -->
<strong id="exEratosthenes">Exercise 7.</strong> The [sieve of Eratosthenes][sieveEratosthenes] is an algorithm for generating
prime numbers up to a given limit. Let $n > 1$ be an integer and suppose we want
a list of all prime numbers at most $n$. Start with a list of all integers
between 2 and $n$, inclusive. Remove all multiples of 2 from the list, except
for 2 itself. The next number after 2 in the resulting list should be 3. Remove
all multiples of 3 from the list, except for 3 itself. The next number after 3
in the resulting list is 5 because 4 was removed due to being a multiple
of 2. Remove all multiples of 5, except for 5 itself. Repeat the process until
we cannot remove any more multiples. All numbers remaining in the list are prime
numbers. Implement the sieve of Eratosthenes.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 8.</strong> In the decimal number system, the [Champernowne constant][ChampernowneConstant]
is the number obtained by concatenating the sequence of positive integers and
placing the result after `0.`. For example, concatenating the sequence
`[1 .. 5]` and we get `12345` and the partial Champernowne constant:
<!-- prettier-ignore-end -->

$$
0.12345
$$

Concatenate the sequence `[1 .. 13]` to obtain the partial Champernowne
constant:

$$
0.12345678910111213
$$

Write a program that outputs the partial Champernowne constant up to an integer
$n > 0$.

<!-- prettier-ignore-start -->
<strong id="exGilbreath">Exercise 9.</strong> Start with a list of all primes at most $n > 1$. Take the absolute value of the
difference between two successive elements. Place the results in a list. Repeat
the process with the new list, and so on and so forth until you eventually
obtain the list `[1]`. [Gilbreath's conjecture][GilbreathConjecture] states that
the first element in each of the above difference lists is 1. Write a program to
verify Gilbreath's conjecture for a list of all primes at most 100,000.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 10.</strong> Let $p_n$ be the $n$-th prime number. [Andrica's conjecture][AndricaConjecture]
states that the following inequality is true:
<!-- prettier-ignore-end -->

$$
\sqrt{p_{n+1}} - \sqrt{p_n} < 1.
$$

Verify the conjecture for all primes at most 100,000.

<!--=========================================================================-->

[^a]:
    Clifford A. Pickover. _The Math Book: From Pythagoras to the 57th Dimension,
    250 Milestones in the History of Mathematics._ Sterling Publishing, 2009,
    p.102.

[^b]:
    David E. Joyce. [_Euclid's Elements_][euclidElements]. Book X,
    Proposition 29.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[AndricaConjecture]: https://web.archive.org/web/20240101040654/https://en.wikipedia.org/wiki/Andrica%27s_conjecture
[ASCII]: https://web.archive.org/web/20231225071809/https://en.wikipedia.org/wiki/ASCII
[beastNumber]: https://web.archive.org/web/20231231101447/https://en.wikipedia.org/wiki/Number_of_the_beast
[ChampernowneConstant]: https://web.archive.org/web/20240101001210/https://en.wikipedia.org/wiki/Champernowne_constant
[enumFrom]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:enumFrom
[enumFromThen]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:enumFromThen
[enumFromThenTo]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:enumFromThenTo
[enumFromTo]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:enumFromTo
[euclidElements]: https://web.archive.org/web/20231231144334/https://mathcs.clarku.edu/~djoyce/java/elements/bookX/propX29.html
[exRange]: ../data_list/#exRangeNotation
[GilbreathConjecture]: https://web.archive.org/web/20240101031921/https://en.wikipedia.org/wiki/Gilbreath%27s_conjecture
[heptadecaphobia]: https://web.archive.org/web/20231213152552/https://en.wikipedia.org/wiki/Heptadecaphobia
[NASA]: https://web.archive.org/web/20231229132344/https://en.wikipedia.org/wiki/NASA
[nine]: https://web.archive.org/web/20231031185607/https://en.wikipedia.org/wiki/Curse_of_the_ninth
[perfectSquare]: https://web.archive.org/web/20231213122702/https://en.wikipedia.org/wiki/Square_number
[pythagoreanTriple]: https://web.archive.org/web/20231216161203/https://en.wikipedia.org/wiki/Pythagorean_triple
[secList]: ../data_list/
[sieveEratosthenes]: https://web.archive.org/web/20231216203715/https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
[tetraphobia]: https://web.archive.org/web/20231213182810/https://en.wikipedia.org/wiki/Tetraphobia
[triakontenneaphobia]: https://web.archive.org/web/20231203152609/https://en.wikipedia.org/wiki/Curse_of_39
[triskaidekaphobia]: https://web.archive.org/web/20231213103640/https://en.wikipedia.org/wiki/Triskaidekaphobia
<!-- prettier-ignore-end -->

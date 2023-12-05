---
title: Does it sink or float?
math: true
order: 7
---

> _Bedevere:_ Does wood sink in water?\
> _Villager:_ No, it floats! It floats!\
> _Bedevere:_ What also floats in water?\
> _Arthur:_ A duck!\
> _Bedevere:_ Exactly. So, logically...\
> _Villager:_ If... she... weighs... the same as a duck... she's made of wood.\
> _Bedevere:_ And therefore?\
> _Villager:_ A witch!\
> --- _Monty Python and the Holy Grail_, 1975

We discuss floating-point numbers with emphasis on the data type
[`Double`][double]. The section
[Floating-point numbers](#floating-point-numbers) briefly presents basic
arithmetic operations on floating-pointing numbers. Building on from the section
[Printing numbers](../data_number/#printing-numbers), in the section
[Parsing numbers](#parsing-numbers) you will learn how to read a number from the
command line. The section [Convert from integers](#convert-from-integers)
discusses how to convert an integer to a floating-point number, whereas the
section [Convert from floating-points](#convert-from-floating-points) presents
subtle issues you would encounter when converting a floating-point number to an
integer.

<!--=========================================================================-->

## Floating-point numbers

Haskell uses the types [`Float`][float] and [`Double`][double] to represent
floating-point numbers. The type `Float` uses single-precision to represent
floating-point numbers, while `Double` uses double-precision. We will only
discuss the type `Double` and relegate the topic of `Float` to another source.

The type `Double` supports the usual arithmetic operators: `+` (addition), `-`
(subtraction), `*` (multiplication), and `/` (division). Unlike the types
[`Int`][int] and [`Integer`][integer], exponentiation for floating-point numbers
is performed via the operator `**`. Observe the following GHCi session.

```haskell
ghci> a = (7.0 :: Double)
ghci> b = (2.0 :: Double)
ghci> a + b
9.0
ghci> a - b
5.0
ghci> a * b
14.0
ghci> a / b
3.5
ghci> a**b
49.0
```

The above GHCi session shows floating-point numbers being represented in decimal
form. Haskell can also understand scientific notation in the form of the
exponential (or e) notation. Refer to the session below.

```haskell
ghci> 2.1 * (10**3)
2100.0
ghci> 2.1e3
2100.0
ghci> 3.54 * (10**(-4))
3.5400000000000004e-4
ghci> 3.54e-4
3.54e-4
```

<!--=========================================================================-->

## Parsing numbers

Let's build on what we have learnt from the section
[Printing numbers](../data_number/#printing-numbers). In particular, we will
write a program to obtain from the command line the radius of a circle. We will
use the radius to calculate the area of a circle having the given radius, then
print the area to the command line. Here is our program:

[`circle.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/circle.hs)
```haskell
-- Calculate the area of a circle.
main = do
    putStrLn "Please enter the radius."
    radius <- getLine
    let r = (read radius :: Double)
    let area = pi * (r ** 2)
    putStrLn ("Area of circle: " ++ show area)
```

In the terminal session below, we compile the program and execute it. When
prompted to enter the radius, we enter the number 2. The program uses the
provided radius to calculate and print the area of a circle having the given
radius.

```sh
$ ghc circle.hs
[1 of 2] Compiling Main             ( circle.hs, circle.o )
[2 of 2] Linking circle
$ ./circle
Please enter the radius.
2
Area of circle: 12.566370614359172
```

<!-- prettier-ignore-start -->
The program
[`circle.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/circle.hs)
uses the functions [`getLine`][getLine], [`read`][read], and [`pi`][pi]. The
program also uses the operator [`<-`][leftArrow]. Let's consider each of them in
turn.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
-   The function [`getLine`][getLine], as its name suggests, reads a line from
    standard input. The standard input is usually the prompt at the terminal.
    The read line is converted to a string regardless of whether we enter a
    string or numeric digits at the command line.
-   The left-arrow operator (or keyword) [`<-`][leftArrow] is used within a `do`
    block to bind the result of a function to a local variable. In terms of the
    program
[`circle.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/circle.hs)
    the result of the function `getLine` is assigned to the variable `radius`.
    Why not use `=` for assignment instead of `<-`? That's a quirk of a `do`
    block. Let's leave it as is instead of being distracted by a technical
    discussion about the distinction between `=` and `<-` for assignment.
-   The function [`read`][read] parses a string into a given data type. You must
    provide the target type. In the code `read radius :: Double`, the function
    `read` parses the string `radius` and returns the string as a floating-point
    number of type `Double`. Neither the function `read` nor our program does
    any error checking. We assume that the variable `radius` holds the string
    representation of a number.
-   The function [`pi`][pi] returns the constant $\pi$ as a floating-point
    number.[^a]
<!-- prettier-ignore-end -->

<!--=========================================================================-->

## Convert from integers

To convert an integer to a floating-point number, use the function
[`fromIntegral`][fromIntegral]. This function can convert from data of type
[`Int`][int] or [`Integer`][integer].  Then use the symbol `::` to get the type
you want.  For example, the GHCi session below converts various integers to type
`Double`.

```haskell
ghci> a = (3 :: Int)
ghci> b = (3 :: Integer)
ghci> c = (fromIntegral a) :: Double
ghci> :type c
c :: Double
ghci> c
3.0
ghci> d = (fromIntegral b) :: Double
ghci> :type d
d :: Double
ghci> d
3.0
```

The function [`fromInteger`][fromInteger] can also be used to convert an integer
to another type.  However, the function only works if you want to convert from
data of type `Integer`.  It would not work on data of type `Int`.  Observe GHCi
throwing a tantrum.

```haskell
ghci> a = (4 :: Int)
ghci> b = (4 :: Integer)
ghci> (fromInteger b) :: Double
4.0
ghci> (fromInteger a) :: Double

<interactive>:4:14: error:
    • Couldn't match expected type ‘Integer’ with actual type ‘Int’
    • In the first argument of ‘fromInteger’, namely ‘a’
      In the expression: (fromInteger a) :: Double
      In an equation for ‘it’: it = (fromInteger a) :: Double
```

<!--=========================================================================-->

## Convert from floating-points

Converting from an integer to floating-point is straightforward.  The other way
around is  more complicated.  In the conversion from a floating-point number $x$
to an integer, you must take the following issues into account:

1. Do you want the smallest integer not less than $x$? Use the method
   [`ceiling`][ceiling], which implements the [ceiling function][ceilingFloor].
   The ceiling function rounds a number up to the nearest integer. For example,
   `ceiling 2.1` returns 3 and `ceiling (-2.1)` returns $-2$.
1. Do you want the greatest integer not larger than $x$? Use the method
   [`floor`][floor], which implements the [floor function][ceilingFloor]. The floor
   function rounds a number down to the nearest integer. For example, `floor
   2.1` returns 2 and `floor (-2.1)` returns $-3$.
1. Do you want to round $x$ to the nearest integer? Use the method
   [`round`][round]. This method uses the tie-breaking rule of rounding half to
   even. If the fractional part of $x$ is $0.5$, then $x$ is rounded to the
   nearest even integer. For this reason, the technique is also known as
   rounding to nearest, ties to even. For example, both `round 3.5` and
   `round 4.5` result in 4.  The expressions `round (-3.5)` and `round (-4.5)`
   produce $-4$.
1. Do you want to round $x$ toward zero? Use the method [`truncate`][truncate],
   which implements the notion of [truncation][truncation]. The number $x$ is
   rounded toward the nearest integer between $x$ and zero. If $x$ is positive,
   the rounding is done by means of the floor function. If $x$ is negative,
   rounding is done via the ceiling function. For example, `truncate 2.6`
   results in 2 and `truncate (-2.6)` yields $-2$.

<!--=========================================================================-->

## Exercises

<strong>Exercise 1.</strong> Haskell uses the operator `^` for non-negative integer
exponentiation. The operator `**` is reserved for exponentiation of
floating-point numbers. There is a third exponentiation operator, i.e. `^^`, for
numbers of type [`Fractional`][fractional] where the exponent can be a negative
integer. Why three different operators for exponentiation? Read the [discussion
here][exponentiation].

<strong>Exercise 2.</strong> Write a program that prompts for a person's name and age. The program
then greets the person and prints their age in 10 years time.

<strong>Exercise 3.</strong> The gravity of the Moon is 0.166 times that of the gravity of
Earth. If a person weighs $x$ pounds on Earth, their weight on
the Moon would be $0.166x$ pounds. Write a program to prompt a person for their
weight in pounds. Print out the person's weight on the Moon, in pounds as well
as in kilograms.

<strong>Exercise 4.</strong> The planet Mercury takes about 88 Earth days to complete one orbit
around the Sun. Given an age in Earth years, write a program to convert the age
to Mercury years, rounded to the nearest year. Assume that each year on Earth
has 365 days.

<strong>Exercise 5.</strong> The [golden ratio][goldenRatio] is the mathematical constant defined
by

$$
\varphi
=
\frac{
  1 + \sqrt{5}
}{
  2
}.
$$

Write a program to print the golden ratio as a floating-point number. Use the
method [`sqrt`][sqrt] to calculate the square root of a number.

<strong>Exercise 6.</strong> The [Planck constant][planckConstant] is a fundamental physical
constant used in the definition of the kilogram, among other applications. The
constant is defined as

$$
6.62607015 \times 10^{-34} \; \text{J} \cdot \text{Hz}^{-1}
$$

in terms of the unit "joule per hertz". Express the Planck constant, excluding
the unit of measurement, via the e notation.

<strong>Exercise 7.</strong> The method [`div`][div] can be defined in terms of the operator `/`
for floating-point division and the method [`floor`][floor]. First, perform
floating-point division, then take the floor of the result. Similarly, the
method [`quot`][quot] can be defined in terms of `/` and the method
[`truncate`][truncate].[^b] Perform floating-point division and apply `truncate`
to the result. Verify the above within a GHCi session.

<strong>Exercise 8.</strong> Why are the numbers `42e-5` and `-42e5` different from each other?

<strong>Exercise 9.</strong> The method [`mod`][mod] calculates the integer remainder when an
integer is divided by another integer. The Haskell definition of `mod`
implements the definition of remainder as popularized by Donald Knuth.[^c] If
$a$ and $n$ are integers with $n \neq 0$, the remainder $r_f$ of the division
$a / n$ is defined as

$$
r_f
=
a
-
n
\left\lfloor
  \frac{a}{n}
\right\rfloor
$$

and written as $r_f = a \bmod n$. The method [`rem`][rem] also calculates
integer remainder. Instead of using the floor function, `rem` uses truncation
for rounding. The remainder $r_t$ of the division $a / n$ is defined as

$$
r_t
=
a
-
n
\;
\text{trunc}
\left(
  \frac{a}{n}
\right).
$$

Verify the result of `mod` against the definition of $r_f$ for the following
types of integers.

- Positive and positive.
- Positive and negative.
- Negative and positive.
- Negative and negative.

Repeat the exercise for `rem` and $r_t$.

<strong>Exercise 10.</strong> A pyramid has a square base of length $\ell$. If the pyramid has
height $h$, then the pyramid has a volume $V$ of

$$
V
=
\frac{1}{3}
\ell^2 h.
$$

The [Great Pyramid of Giza][pyramidGiza] has a square base of length 230.33
metres and a current height of 138.5 metres. Calculate the approximate volume of
the Great Pyramid of Giza. Modify your result by taking into account that the
pyramid originally had a height of 146.6 metres.

<!--=========================================================================-->

[^a]: The sin of overconsumption is gluttony. Pie is an exception because
    $\sin(\pi) = 0$.

[^b]: These definitions of `div` and `quot` are consistent with the
    specification as given in the document
    [Haskell 2010: Language Report][haskell2010].

[^c]: Donald E. Knuth. *The Art of Computer Programming*, 3rd edition,
    volume 1. Addison Wesley Longman, 1997, pp.39--40.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[ceiling]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:ceiling
[ceilingFloor]: https://web.archive.org/web/20231202010140/https://en.wikipedia.org/wiki/Floor_and_ceiling_functions
[div]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:div
[double]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[exponentiation]: https://web.archive.org/web/20231202010734/https://wiki.haskell.org/Power_function
[float]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[floor]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:floor
[fractional]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Fractional
[fromInteger]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fromInteger
[fromIntegral]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fromIntegral
[getLine]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:getLine
[goldenRatio]: https://web.archive.org/web/20231202013818/https://en.wikipedia.org/wiki/Golden_ratio
[haskell2010]: https://web.archive.org/web/20231201223927/https://www.haskell.org/onlinereport/haskell2010/haskellch6.html#x13-1370006.4.2
[int]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
[leftArrow]: https://web.archive.org/web/20231202004644/https://wiki.haskell.org/Keywords#.3C-
[mod]: https://web.archive.org/web/20231201225313/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:mod
[pi]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:pi
[planckConstant]: https://web.archive.org/web/20231202014019/https://en.wikipedia.org/wiki/Planck_constant
[pyramidGiza]: https://web.archive.org/web/20231202000036/https://en.wikipedia.org/wiki/Great_Pyramid_of_Giza
[quot]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:quot
[read]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:read
[rem]: https://web.archive.org/web/20231201225313/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:rem
[round]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:round
[sqrt]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:sqrt
[truncate]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:truncate
[truncation]: https://web.archive.org/web/20231202010607/https://en.wikipedia.org/wiki/Truncation
<!-- prettier-ignore-end -->

---
title: Does it sink or float?
math: true
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

:include: file="assets/src/data/circle.hs", name="circle.hs"

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
:script: file="assets/src/data/circle.hs", name="circle.hs"
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
    :script: file="assets/src/data/circle.hs", name="circle.hs"
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

[^a]: The sin of overconsumption is gluttony. Pie is an exception because
    $\sin(\pi) = 0$.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[double]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[float]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[fromInteger]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fromInteger
[fromIntegral]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fromIntegral
[getLine]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:getLine
[int]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
[leftArrow]: https://web.archive.org/web/20231202004644/https://wiki.haskell.org/Keywords#.3C-
[pi]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:pi
[read]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:read
<!-- prettier-ignore-end -->

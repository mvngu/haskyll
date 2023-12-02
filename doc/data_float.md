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

<!-- prettier-ignore-start -->
[double]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[float]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[int]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
<!-- prettier-ignore-end -->

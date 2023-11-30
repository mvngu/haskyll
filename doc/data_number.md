---
title: Here's my number
math: true
---

> Numbers in Haskell are complicated because in the Haskell world there are many
> different kinds of number...\
> --- Richard Bird, _Thinking Functionally with Haskell_[^a]

Haskell represents a number in one of several ways, depending on the kind of
number you are dealing with. Is the number an integer? Haskell has the types
[`Int`][int] and [`Integer`][integer] to represent an integer. Is the number a
floating-point number? Use the types [`Float`][float] and [`Double`][double] to
represent floating-point numbers. In this section, we consider how Haskell
represents and parses integers. The discussion on floating-point numbers is
deferred to another section.

<!--=========================================================================-->

## The type `Int`

Haskell represents integers via the types [`Int`][int] and [`Integer`][integer].
The type `Int` represents a fixed-precision integer. An integer represented as
the type `Int` has a minimum value at least $-2^{29}$ and a maximum value at
least $2^{29} - 1$. The exact range depends on the implementation. Use
[minBound][minBound] and [maxBound][maxBound] to check the exact range for your
platform. On my computer, the exact range of `Int` is given as:

```haskell
ghci> minBound :: Int
-9223372036854775808
ghci> maxBound :: Int
9223372036854775807
ghci>
```

What is that double colon symbol `::` in the above GHCi session? In Haskell, the
symbol `::` can be read as "has type". The symbol `::` is Haskell's way of
implementing type annotation, a way to associate an expression with a type. In
the above GHCi session, the line `minBound :: Int` can be read as, "`minBound`
has type `Int`".

<!--=========================================================================-->

[^a]:
    Richard Bird. _Thinking Functionally with Haskell_. Cambridge University
    Press, 2015, p.49.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[double]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[float]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[int]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
[maxBound]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:maxBound
[minBound]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:minBound
<!-- prettier-ignore-end -->

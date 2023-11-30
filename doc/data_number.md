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

### Polymorphism

The method [`minBound`][minBound] is [polymorphic][polymorphism]. The specific
version of `minBound` that is executed depends on the type. The method
`minBound` belongs to the class [`Bounded`][bounded]. A class derived from
`Bounded` should have its own implementation of `minBound`. The type
[`Int`][int] happens to be derived from `Bounded` and has its own implementation
of `minBound`. When you call `minBound` without any type annotation, the
compiler (or GHCi) might find it difficult to infer the type information from
context alone. However, annotating `minBound` with the type `Int` helps the
compiler (or GHCi) to execute the version of `minBound` implemented for `Int`.

<!--=========================================================================-->

[^a]:
    Richard Bird. _Thinking Functionally with Haskell_. Cambridge University
    Press, 2015, p.49.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[bounded]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Bounded
[double]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[float]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[int]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
[maxBound]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:maxBound
[minBound]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:minBound
[polymorphism]: https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
<!-- prettier-ignore-end -->

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

### Integer overflow

Since [`Int`][int] represents fixed-precision integers, there is always the
possibility of integer overflow. The following GHCi session demonstrates the
issue.

```haskell
ghci> k = (minBound :: Int)
ghci> n = (maxBound :: Int)
ghci> :type k
k :: Int
ghci> :type n
n :: Int
ghci> k
-9223372036854775808
ghci> k - 1
9223372036854775807
ghci> n
9223372036854775807
ghci> n + 1
-9223372036854775808
```

The GHCi command [`:type`][type] allows you to obtain information about the type
of an expression. We used the command to confirm that the variables `k` and `n`
both have the type `Int`.

<!--=========================================================================-->

### Arithmetic operations

The above GHCi session also shows that [`Int`][int] supports integer addition
and subtraction. What about integer multiplication?

```haskell
ghci> a = (4 :: Int)
ghci> b = (2 :: Int)
ghci> c = a * b
ghci> :type c
c :: Int
ghci> c
8
```

So far so good. What about integer division? We know that $4 / 2 = 2$. Let's use
Haskell to confirm our result.

```haskell
ghci> a = (4 :: Int)
ghci> b = (2 :: Int)
ghci> a / b

<interactive>:3:3: error:
    • No instance for (Fractional Int) arising from a use of ‘/’
    • In the expression: a / b
      In an equation for ‘it’: it = a / b
```

What is going on here? The type `Int` does not support integer division? In
fact, the type `Int` does support integer division. You just need to use the
right method for the job. The operator [`/`][fracDiv] is a method implemented
for data of type [`Fractional`][fractional], not data of type `Int`. Observe the
next GHCi session:

```haskell
ghci> :type (/)
(/) :: Fractional a => a -> a -> a
```

The part `(/) :: Fractional` means that `/` is defined for data of type
`Fractional`. Do not worry about the rest of the above line. We will discuss it
in the section [Prefix notation](#prefix-notation).

You must use the method [`div`][div] for integer division because that method
would give you the quotient when dividing an integer by another integer.
Alternatively, use the method [`quot`][quot] to make it clear that your
intention is to obtain the quotient when dividing one integer by another
integer. Observe the following GHCi session.

```haskell
ghci> a = (5 :: Int)
ghci> b = (4 :: Int)
ghci> c = (2 :: Int)
ghci> div a c
2
ghci> div b c
2
ghci> quot a b
1
```

<!--=========================================================================-->

### Prefix notation

The latter GHCi session brings up one issue. Why did we write the code `div a c`
to divide `a` by `c`? Functions and methods in Haskell are called using
[prefix][prefix] notation. In languages such as C, JavaScript, or Python if you
define a function named `div` that takes two arguments `a` and `c`, you would
use the function like so: `div(a, c)`. This is prefix notation. Haskell uses
prefix notation, but dispenses with the parentheses. The Haskell code `div a c`
means: apply the method (or function) `div` to the arguments `a` and `c`. Let's
use the GHCi command [`:type`][type] to show the signature (or declaration) of
`div`.

```haskell
ghci> :type div
div :: Integral a => a -> a -> a
```

We have seen the symbol `=>` before in the section
[Arithmetic operations](#arithmetic-operations). The symbol `=>` separates two
parts of the signature of `div`. Everything to the left of `=>`, excluding the
segment `div ::`, is a constraint on the type of data on which `div` can
operate. The segment `Integral a` means that `div` can work with any data `a`
that has type [`Integral`][integral]. The type `Int` happens to be based on
`Integral`, as can be seen in the GHCi session below. Search for the line
`instance Integral Int`.

```haskell
ghci> :info Int
type Int :: *
data Int = GHC.Types.I# GHC.Prim.Int#
    -- Defined in ‘GHC.Types’
instance Bounded Int -- Defined in ‘GHC.Enum’
instance Read Int -- Defined in ‘GHC.Read’
instance Enum Int -- Defined in ‘GHC.Enum’
instance Integral Int -- Defined in ‘GHC.Real’
instance Num Int -- Defined in ‘GHC.Num’
instance Real Int -- Defined in ‘GHC.Real’
instance Show Int -- Defined in ‘GHC.Show’
instance Eq Int -- Defined in ‘GHC.Classes’
instance Ord Int -- Defined in ‘GHC.Classes’
```

The information from the above two GHCi sessions says that you can use `div` for
integer division when the number is of type `Int`. Phew! So many words to
express a simple idea.

What about everything to the right of the symbol `=>`? The right-hand side of
`=>` tells you two pieces of information.

1. First, `div` takes two parameters of the same type. That is what the first
   two `a`s in `a -> a -> a` means.
1. Second, `div` returns a result of the same type as its parameters. That is
   what the last (or rightmost) `a` means in `a -> a -> a`.

<!--=========================================================================-->

### Infix notation

The common arithmetic operators such as `+` (addition), `-` (subtraction), `/`
(division), and `*` (multiplication) can be used by means of infix notation.
Take for example the operator `+`. This operator requires two arguments. You
write its first argument, followed by the operator `+`, and finally write the
second argument. We have seen infix notation already in the section
[Arithmetic operations](#arithmetic-operations). Refer to the following GHCi
session to refresh your memory.

```haskell
ghci> a = (6 :: Int)
ghci> b = (2 :: Int)
ghci> a + b
8
ghci> a - b
4
ghci> a * b
12
ghci> a `div` b
3
```

Hang on. Why is the method [`div`][div] being used via infix notation? More
importantly, how did we call `div` (a prefix method) via infix notation? In
general, a prefix method or function can be called via infix notation. All you
have to do is use the backtick character, i.e. \`, to delimit the method or
function name. The method [`quot`][quot] can also be used via infix notation
like so:

```haskell
ghci> a = (6 :: Int)
ghci> b = (4 :: Int)
ghci> quot a b
1
ghci> a `quot` b
1
```

A method or function that is normally called via prefix notation can be called
via infix notation. What about the other way around? If an operator is normally
used via infix notation, how can we use it via prefix notation? We surround the
operator with parentheses, as shown in the next GHCi session.

```haskell
ghci> a = (7 :: Int)
ghci> b = (3 :: Int)
ghci> a + b
10
ghci> (+) a b
10
ghci> a - b
4
ghci> (-) a b
4
ghci> a * b
21
ghci> (*) a b
21
```

<!--=========================================================================-->

[^a]:
    Richard Bird. _Thinking Functionally with Haskell_. Cambridge University
    Press, 2015, p.49.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[bounded]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Bounded
[div]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:div
[double]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[float]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[fracDiv]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-47-
[fractional]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Fractional
[info]: https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html#ghci-cmd-:info
[int]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
[integral]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integral
[maxBound]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:maxBound
[minBound]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:minBound
[polymorphism]: https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
[prefix]: https://en.wikipedia.org/wiki/Polish_notation
[quot]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:quot
[type]: https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html#ghci-cmd-:type
<!-- prettier-ignore-end -->

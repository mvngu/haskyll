---
title: Pattern matching
math: true
---

The basic idea of pattern matching is simple. Organize the definition of your
function according to the specific patterns you want to match. That does not
sound simple at all. We need an example.

<!--=========================================================================-->

## Traffic lights

Put on your traffic engineer hat. The traffic light red means stop, orange means
wait, and green means go. We can translate the latter description to a guarded
equation like so:

:include: file="assets/src/decide/traffic.hs", name="traffic.hs", line=3:9

Alternatively, we can use pattern matching. How? Observe:

:include: file="assets/src/decide/traffic.hs", name="traffic.hs", line=11:16

Each equation above has a specific pattern (i.e. a literal value) we want to
match. For instance, in the equation

```haskell
trafficp "red"    = "stop"
```

the pattern is the literal string `"red"` and the output corresponding to this
pattern is `"stop"`. Similar to the guarded equation where we have the catch-all
guard [`otherwise`][otherwise], the last equation in our pattern matching should
be the wildcard pattern `_`, i.e. the underscore character. The wildcard
equation

```haskell
trafficp _        = "Invalid traffic light"
```

handles all other cases not matched by the patterns above it.

<!--=========================================================================-->

## Andrew or And-rew?

In this section, we use pattern matching to reimplement various functions in the
Haskell standard library. Recall that the function [`not`][not] negates a
boolean value. The negation of `True` is `False`, the negation of `False` is
`True`. We have all the specific cases we need to implement our own negation
function. Here's the code:

:include: file="assets/src/decide/not.hs", name="not.hs", line=3:6

How about the boolean operator `||`? The section [Or](../data_bool/#or) has a
table that defines all the results of `||` for any pair of boolean input. For
reference, below is a GHCi session that contains the possible output of `||`.

```haskell
ghci> True || True
True
ghci> True || False
True
ghci> False || True
True
ghci> False || False
False
```

We can use the above exhaustive cases to help us reimplement `||`, each case
being a pattern to match. That would give us four patterns. We can reduce the
number of patterns to three as follows. If the first operand of `||` is `True`,
then the result is `True` regardless of whether the second operand is `True` or
`False`. We write a pattern for each case where the first operand is `False`.
The third (and last) case has the wildcard pattern. See below for the code:

:include: file="assets/src/decide/or.hs", name="or.hs", line=3:7

<!--=========================================================================-->

## Tuple-ware

A collection type such as tuples are a fertile ground for pattern matching.
Let's start with our friend, the function [`fst`][fst]. Given a tuple of two
elements, the function `fst` outputs the first element. It's as simple as that.
Don't believe me? See for yourself:

```haskell
ghci> fst ('a', 'b')
'a'
ghci> fst (1, 2)
1
ghci> fst ("x", 42)
"x"
```

Note that `fst` ignores the second element. That seems like a job for the
wildcard symbol `_`. Let's implement our own version of `fst` and name it
`firstA`.

:include: file="assets/src/decide/first.hs", name="first.hs", line=3:5

There's something funny going on in the signature of `firstA`. Where's the type
name like `Integer` or `String`? Instead, the input is a tuple like `(a, b)`.
Let Haskell hit you with some knowledge. The elements of a tuple can be of
different types. The parameter `(a, b)` for `firstA` means that we do not care
about the type of each tuple element. The left element can be of type `a`
(whatever it is) and the right element can be of type `b`, which might be the
same as, or different from, `a`. Carefully examine the above GHCi session again
to delude, err... I mean convince yourself.

The wildcard symbol `_` is rather handy, especially when working with tuples of
greater than two elements. Consider a tuple of three elements such as
`(1, 2, 3)`. The middle element is `2`. Here's a function to extract the middle
element of any tuple of three elements:

:include: file="assets/src/decide/mid.hs", name="mid.hs", line=3:5

<!--=========================================================================-->

### Vector addition

Did you say you want more examples? No problem. Consider the addition of vectors
of two elements. Adding two vectors is the same as adding their corresponding
elements. Here's an implementation:

:include: file="assets/src/decide/vadd.hs", name="vadd.hs", line=3:5

What is the code `(Num a) =>` doing in the signature of `vadd`? What does the
code mean? Let's examine the code bit by bit. The Haskell type [`Num`][num] is a
type class, meaning that `Num` encompasses the usual number types such as `Int`,
`Integer`, and `Double`. Put another way, numeric types such as `Integer` and
`Double` are based on `Num`. You can confirm the latter statement by examining
the following GHCi session:

```haskell
ghci> :info Num
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
    -- Defined in ‘GHC.Num’
instance Num Double -- Defined in ‘GHC.Float’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
```

The code `(Num a)` means that we are restricting the type `a` to be a numeric
type that is based on `Num`. The code `(Num a)` is also referred to as the
context. The fat arrow symbol `=>` serves as a delimiter between the context on
its left-hand side and the type information on its right-hand side.[^a] The
signature of `vadd` can be read as: The function `vadd` takes two parameters,
both being tuples whose elements are all of the same numeric type. The output of
`vadd` is a tuple whose elements have the same numeric type as the elements of
the input tuples. Furthermore, the numeric type must be based on `Num`. What a
mouthful! You will encounter signatures like that of the function `vadd` as you
read and write more complex Haskell code.

<!--=========================================================================-->

[^a]: See the [Haskell 2010 Language Report][haskell2010].

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[fst]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fst
[not]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:not
[num]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Num
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
<!-- prettier-ignore-end -->

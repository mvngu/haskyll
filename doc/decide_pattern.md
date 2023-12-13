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

<!-- prettier-ignore-start -->
[fst]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fst
[not]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:not
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
<!-- prettier-ignore-end -->

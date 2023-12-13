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

<!-- prettier-ignore-start -->
[not]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:not
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
<!-- prettier-ignore-end -->

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

[^a]:
    Richard Bird. _Thinking Functionally with Haskell_. Cambridge University
    Press, 2015, p.49.

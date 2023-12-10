---
title: En garde!
math: true
---

Hi! I'm a shouty man.[^a] Do you miss the `switch` statement from languages such
as C, Java, and JavaScript? Or the `match` statement from Python? Tired of
writing (or reading) nested conditional expressions like the following?

:include: file="assets/src/decide/nested.hs", name="nested.hs", line=11:16

Say no more. What if I tell you that you can get rid of nested conditional
expressions? How would you like to organize your nested conditional expressions
according to the cases or conditions you want to match? Curious? Read on.

<!--=========================================================================-->

## Guarded equations

A conditional expression can be replaced with a guarded equation. To understand
what a guarded equation can do for you, recall the function `maxInt` from the
section [Multiple parameters](../decide_function/#multiple-parameters):

:include: file="assets/src/decide/max.hs", name="max.hs", line=3:8

Here is the same function, but written as a guarded equation:

:include: file="assets/src/decide/max-guard.hs", name="max-guard.hs", line=3:7

And here is the guarded equation translated to a mathematical expression:

$$
\text{max}(x,\, y)
=
\begin{cases}
x,& \text{if } x > y,\\[8pt]
y,& \text{otherwise}.
\end{cases}
$$

A guarded equation is a function that follows the format

```haskell
funcName a b ...
    | conditional_1 = result_1
    | conditional_2 = result_2
    ...
    | otherwise = result_n
```

First, we have the name `funcName` of the guarded equation. We use the name of
the guarded equation and pass parameters to it in the same way that we apply a
function. A guarded equation is a function. The pipe symbol `|` is read as "such
that" and signifies the beginning of a guard. A guard is a conditional, an
expression that evaluates to a boolean value. To the right of the guard is the
equal sign `=`, followed by the result corresponding to the guard. The line

```haskell
| conditional_1 = result_1
```

can be read as, "The value of the function is such that if `conditional_1` holds
`True`, then the output is `result_1`." The other lines have similar
interpretation. The final line of a guarded equation is

```haskell
| otherwise = result_n
```

Like the `switch` statement (and the label `default`) in some languages, Haskell
does not require the guard [`otherwise`][otherwise] in the final line of your
guarded equation. However, do bear in mind that the guard `otherwise` is defined
as `otherwise = True` and serves as a catch-all for every case not handled by
the previous guards. Use the guard `otherwise` to handle the default output of
your guarded equation.

<!--=========================================================================-->

[^a]:
    A recurring salesman from _Horrible History_. See him in [action
    here][shoutyMan].

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
[shoutyMan]: https://youtu.be/x7WiPl5s91A
<!-- prettier-ignore-end -->

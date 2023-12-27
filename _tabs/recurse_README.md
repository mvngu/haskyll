---
title: Recursion, or how I loop
order: 17
---

This chapter delves into what a computer does best: do something over and over
again. Unlike some programming languages such as C, JavaScript, or Python where
the `for` and `while` loops provide a construct for repetition, in Haskell
recursion is the primary technique in which we repeat a block of code. Recursion
is not an easy concept to wrap your head around once you have a habit of looping
with `for` and/or `while`. For this reason, the section
[Some examples](../recurse_example/) provides several examples to help you get
started on thinking recursively. In the section
[No loop for you](../recurse_loopless/), we will consider various Haskell
functions that allow us to write recursive code. The section
[Fold under pressure](../recurse_fold/) presents an immensely useful technique
to transform a (complicated) recursive definition to a simple expression.
Finally, in the section [Recursion by numbers](../recurse_advice/), you will be
shown a number of advice to help you write recursive functions in Haskell.

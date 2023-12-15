---
title: Some examples
math: true
---

<!-- prettier-ignore-start -->
> A child couldn't sleep, so her mother told her a story about a little frog,\
> &emsp;&emsp;who couldn't sleep, so the frog's mother told her a story about a little bear,\
> &emsp;&emsp;&emsp;&emsp;who couldn't sleep, so the bear's mother told her a story about a little weasel...\
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;who fell asleep.\
> &emsp;&emsp;&emsp;&emsp;...and the little bear fell asleep;\
> &emsp;&emsp;...and the little frog fell asleep;\
> ...and the child fell asleep.\
> --- [wharfinger][wharfinger], 2000
<!-- prettier-ignore-end -->

Recursion is the process where a concept is defined in terms of itself. A
recursive function is defined in such a way that the function calls itself. The
above might seem abstruse. We need some examples to concretize the theory. If
you have a set of Matryoshka dolls at hand, unpack a smaller doll out of a
larger doll as a visual analogy of recursion. Read on for more examples.

<!--=========================================================================-->

## Triangular numbers

You know how to add numbers, right? Add all integers from 1 to 10, inclusive. To
see how this addition problem can be interpreted in terms of recursion, write
the sum like so:

$$
\begin{equation}
\label{triangular_10}
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
\end{equation}
$$

Let's define a function named `add` that accepts a positive integer $n$ and
outputs the sum of all integers from 1 up to and including $n$. In terms of the
above addition problem, the value of $n$ is $n = 10$. Instead of starting from
1, let's start from 10 and work our way down to 1. Expression
(\ref{triangular_10}) can be written in terms of `add` as

$$
\begin{aligned}
\text{add } 10
&=
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10\\[8pt]
&=
10 + \text{add } 9.
\end{aligned}
$$

The code `add 9` in turn can be written as

$$
\begin{aligned}
\text{add } 9
&=
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9\\[8pt]
&=
9 + \text{add } 8.
\end{aligned}
$$

In general, we have the recursion `add n = n + add (n - 1)`. If we take the
latter expression to be the definition of `add`, the function would call itself
infinitely many times. Why the infinite regress? The reason is that we have not
defined one or more base cases.

A base case for a recursion is a starting value or expression from which the
recursion can proceed to generate more values (or expressions). In terms of the
above addition problem, a base case is the value at which our recursive function
`add` should stop the recursion. Think about how we want to define `add`. The
function `add` takes a positive integer $n$ and sum all integers between 1 and
$n$, inclusive. The base case for `add` should be

$$
\text{add } 1
=
1.
$$

We now have all the ingredients we need to define `add`. Here's the code:

:include: file="assets/src/recurse/add.hs", name="add.hs", line=3:8

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[wharfinger]: https://web.archive.org/web/20231214020114/https://everything2.com/index.pl?node_id=477013
<!-- prettier-ignore-end -->

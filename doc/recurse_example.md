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

## Rabbit season

> _Bugs:_ Tell me, Mr. Fudd. Do you have any rabbit inclinations?\
> _Elmer:_ Well, no.\
> _Bugs:_ What's two times two?\
> _Elmer:_ Four.\
> _Bugs:_ Three times three?\
> _Elmer:_ Six.\
> _Bugs:_ Ah-ha! Multiplying! Yep, you're even beginning to look like a rabbit.\
> --- _Hare Tonic_, 1945

The [Fibonacci sequence][fibonacci] is defined as follows. The first two numbers
in the sequence are 0 and 1. These are our base cases. Any other number in the
sequence is defined by adding the previous two numbers. Here is the definition
in mathematical gory detail, expressed as a recursion:

$$
F_n
=
\begin{cases}
0,& \text{if } n = 0,\\[8pt]
1,& \text{if } n = 1,\\[8pt]
F_{n-1} + F_{n-2},& \text{otherwise}.
\end{cases}
$$

Let's apply the above definition to calculate the value of $F_6$. Write $F_6$ as

$$
F_6
=
F_5 + F_4.
$$

We do not have the value of $F_5$ nor that of $F_4$. Apply the definition again
to get

$$
F_5
=
F_4 + F_3
=
(F_3 + F_2) + (F_2 + F_1).
$$

We know that $F_1 = 1$ and applying the definition again yields

$$
F_2
=
F_1 + F_0
=
1 + 0
=
1.
$$

Using the values of $F_2$, $F_1$, and $F_0$ we can work out the values of $F_3$
to $F_6$ as follows:

$$
\begin{align*}
F_3 &= F_2 + F_1 = 1 + 1 = 2,\\[8pt]
F_4 &= F_3 + F_2 = 2 + 1 = 3,\\[8pt]
F_5 &= F_4 + F_3 = 3 + 2 = 5,\\[8pt]
F_6 &= F_5 + F_4 = 5 + 3 = 8.
\end{align*}
$$

The recursive definition of the Fibonacci number $F_n$ can be translated to the
following Haskell function:

<!-- prettier-ignore -->
:include: file="assets/src/recurse/fibonacci.hs", name="fibonacci.hs", line=11:17

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[fibonacci]: https://web.archive.org/web/20231206222214/https://en.wikipedia.org/wiki/Fibonacci_sequence
[wharfinger]: https://web.archive.org/web/20231214020114/https://everything2.com/index.pl?node_id=477013
<!-- prettier-ignore-end -->

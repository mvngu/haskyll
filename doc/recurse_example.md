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

## Length of list

How many elements are in the list below?

```haskell
[2, 3, 5, 7, 11, 13]
```

The list has six elements, of course. Let's see how we can use recursion to
count the number of elements. Suppose we have a function named `size` whose
parameter is a list. Given a list, the function `size` outputs the number of
elements in the list. If the list is empty, `size` would output zero. Our base
case is `size [] = 0`. Now suppose we pass the above list to `size`. The length
of the list in the above code listing is equivalent to one plus the length of
the `tail` of the list. We are breaking the above list into the following
components:

```haskell
2 : [3, 5, 7, 11, 13]
```

The element `2` is obviously one element. All we need to do now is calculate the
`size` of the sublist `[3, 5, 7, 11, 13]`. Again, we can decompose the latter
sublist as follows:

```haskell
2 : 3 : [5, 7, 11, 13]
```

We already know that `2` is one element. We now have another element, i.e. `3`,
bringing the total to two elements so far. The problem we need to solve now is
to determine the length of the sublist `[5, 7, 11, 13]`. Use the same
decomposition technique as per above to obtain:

```haskell
2 : 3 : 5 : [7, 11, 13]
```

The element `5` is another element of the original list, bringing the total to
three elements so far. Repeated application of the above decomposition technique
results in the following chain of cons operations, each cons giving us another
element of the original list.

```haskell
2 : 3 : 5 : 7 : [11, 13]
2 : 3 : 5 : 7 : 11 : [13]
2 : 3 : 5 : 7 : 11 : 13 : []
```

By the time we are at the cons operation `: []`, we have already counted six
elements. Our base case tells us that the empty list `[]` has zero elements.
Therefore the original list has six elements. The above description is
translated to Haskell code as follows:

:include: file="assets/src/recurse/length.hs", name="length.hs", line=3:6

<!--=========================================================================-->

## Binomial coefficients

The [binomial coefficients][binomialCoefficients] are defined as

$$
\begin{equation}
\label{eqn_binomial_coefficients}
\binom{n}{k}
=
\frac{
  n!
}{
  k! \; (n - k)!
}
\end{equation}
$$

where $n$ and $k$ are non-negative integers. The number $\binom{n}{k}$ has an
interpretation as the number of ways to choose $k$ objects from $n$ distinct
objects. If $0 \leq k \leq n$, then $\binom{n}{k}$ is a positive integer. We
have the base case $\binom{n}{0} = 1$. Furthermore, $\binom{n}{k} = 0$ if
$k > n$ or $k < 0$, and $\binom{n}{k} = 1$ if $n = k$.

Expression (\ref{eqn_binomial_coefficients}) defines the binomial coefficients
in terms of the factorial function, which also has a recursive definition (see
[this exercise](#ex_factorial)). A recursive expression for
(\ref{eqn_binomial_coefficients}) is

$$
\begin{equation}
\label{eqn_binomial_recursive}
\binom{n}{k}
=
\frac{n}{k}
\binom{n-1}{k-1}.
\end{equation}
$$

In the recursive expression (\ref{eqn_binomial_recursive}), we should avoid the
division $n / k$ because it is not necessarily an integer. Instead, we should
calculate the product $n \times \binom{n-1}{k-1}$, then divide the result by $k$
to guarantee that the result of the division is an integer. The above are all we
need to write our Haskell implementation of the binomial coefficients:

:include: file="assets/src/recurse/binomial.hs", name="binomial.hs", line=17:25

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[binomialCoefficients]: https://web.archive.org/web/20231210141209/https://en.wikipedia.org/wiki/Binomial_coefficient
[fibonacci]: https://web.archive.org/web/20231206222214/https://en.wikipedia.org/wiki/Fibonacci_sequence
[wharfinger]: https://web.archive.org/web/20231214020114/https://everything2.com/index.pl?node_id=477013
<!-- prettier-ignore-end -->

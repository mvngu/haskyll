---
title: Some examples
math: true
order: 18
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

[`add.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/add.hs)
```haskell
-- | Sum of all positive integers from 1 to n, inclusive.
add :: (Integral a) => a -> a
add 1 = 1
add n
    | n > 1 = n + add (n - 1)
    | otherwise = error "Must be positive integer"
```

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
[`fibonacci.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/fibonacci.hs)
```haskell
-- | The Fibonacci numbers.
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n
    | n > 1 = (fib $ n - 1) + (fib $ n - 2)
    | otherwise = error "Must be non-negative integer"
```

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

[`length.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/length.hs)
```haskell
-- | The length of a list.
size :: [a] -> Int
size []     = 0
size (x:xs) = 1 + size xs
```

<!--=========================================================================-->

## Binomial coefficients

> _Mary:_ What are you doing at my desk?\
> _Dick:_ Anthopology. It's fascinating! Such a wealth of cultures. You know, up
> until now I always thought what you did was pointless and of no interest to anyone
> but yourself.\
> _Mary:_ Well, it's certainly not as fascinating as physics. I mean, everybody
> loves math.\
> --- _3rd Rock from the Sun_, season 1, episode 16, 1996

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

[`binomial.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/binomial.hs)
```haskell
-- | Recursive formulation of the binomial coefficients.
binomB :: Integer -> Integer -> Integer
binomB n 0 = 1
binomB 0 k = 0
binomB n k
    | n < 0 = error "Must be non-negative integer"
    | (k > n) || (k < 0) = 0
    | n == k = 1
    | otherwise = (n * binomB (n - 1) (k - 1)) `div` k
```

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> In the section [Triangular numbers](#triangular-numbers), we worked through the
process of calculating the 10-th [triangular number][triangularNumber]. The
zeroth triangular number is defined to be 0. Modify the program
[`add.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/add.hs)
to account for the zeroth triangular number.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> You are about to test flight your toy rocket. However, you are missing a
function that counts down to zero. Implement the function.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> The [Collatz function][collatzConjecture] is defined for any positive integer
$n$ as follows:
<!-- prettier-ignore-end -->

$$
f(n)
=
\begin{cases}
n/2,& \text{if } n \text{ is even},\\[8pt]
3n + 1,& \text{otherwise}.
\end{cases}
$$

The Collatz sequence is defined as

$$
c_i
=
\begin{cases}
n,& \text{if } i = 0,\\[8pt]
f(c_{i-1}),& \text{if } i > 0.
\end{cases}
$$

The Collatz conjecture states that regardless of which positive integer is given
to the Collatz function, a recursive application of the function, i.e. the
recursion

$$
f(f(f(f(...f(n)...))))
$$

would eventually output 1 and stop. That is, the Collatz sequence would
eventually end at 1. Write a Haskell function to output the Collatz sequence
given any positive integer.

<!-- prettier-ignore-start -->
<strong id="ex_factorial">Exercise 4.</strong> The [factorial][factorial] of a non-negative integer $n$ is defined as
<!-- prettier-ignore-end -->

$$
n!
=
n \times (n-1) \times (n-2) \times \cdots \times 2 \times 1
$$

where $0! = 1$.

1. Write a Haskell function `fac` to implement the factorial of a positive
   integer.
1. Write a function `prod` that multiply all numbers in a list of integers.
   Check your implementation against the library function [`product`][product].
1. Use your product function `prod` to verify your factorial function `fac`.

<!-- prettier-ignore-start -->
<strong>Exercise 5.</strong> The binomial coefficients have another recursive expression as
[Pascal's triangle][pascalsTriangle]:
<!-- prettier-ignore-end -->

$$
\binom{n}{k}
=
\binom{n-1}{k}
+
\binom{n-1}{k-1}.
$$

Implement the above recursive formula and check your result against expression
(\ref{eqn_binomial_recursive}).

<!-- prettier-ignore-start -->
<strong>Exercise 6.</strong> Write a function that sums a list of integers. Check your implementation against
the library function [`sum`][sum].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 7.</strong> The $n$-th Fibonacci number can be obtained via
[Binet's formula][binetsFormula]:
<!-- prettier-ignore-end -->

$$
F_n
=
\frac{
  \varphi^n - \psi^n
}{
  \sqrt{5}
}
$$

where

$$
\varphi
=
\frac{
  1 + \sqrt{5}
}{
  2
},
\qquad
\qquad
\psi
=
\frac{
  1 - \sqrt{5}
}{
  2
}.
$$

Implement Binet's formula and use it to check the implementation of the
Fibonacci numbers as given in the section [Rabbit season](#rabbit-season).

<!-- prettier-ignore-start -->
<strong>Exercise 8.</strong> The function [`concat`][concat] takes a list of lists and places all elements of
the sublists into another list. Write your own implementation of `concat`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 9.</strong> A word is a palindrome if it can be read the same backward as forward. Examples
include radar, level, and refer. Write a function to check whether a word is a
palindrome. Do not use the function [`reverse`][reverse] in your
implementation. However, you are allowed to use `reverse` to check your
implementation.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 10.</strong> Given two positive integers $k$ and $n$, their product $kn$ can be defined in
terms of addition as:
<!-- prettier-ignore-end -->

$$
kn
=
k + (k \times (n - 1))
$$

where $k \times 1 = k$. Implement the above definition as a recursive function.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[binetsFormula]: https://web.archive.org/web/20231206222214/https://en.wikipedia.org/wiki/Fibonacci_sequence#Binet's_formula
[binomialCoefficients]: https://web.archive.org/web/20231210141209/https://en.wikipedia.org/wiki/Binomial_coefficient
[collatzConjecture]: https://web.archive.org/web/20231214025059/https://en.wikipedia.org/wiki/Collatz_conjecture
[concat]: https://web.archive.org/web/20231213193432/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-List.html#v:concat
[factorial]: https://web.archive.org/web/20231209095205/https://en.wikipedia.org/wiki/Factorial
[fibonacci]: https://web.archive.org/web/20231206222214/https://en.wikipedia.org/wiki/Fibonacci_sequence
[pascalsTriangle]: https://web.archive.org/web/20231202024453/https://en.wikipedia.org/wiki/Pascal%27s_triangle
[product]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:product
[reverse]: https://web.archive.org/web/20231213193432/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-List.html#v:reverse
[sum]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:sum
[triangularNumber]: https://web.archive.org/web/20231208180850/https://en.wikipedia.org/wiki/Triangular_number
[wharfinger]: https://web.archive.org/web/20231214020114/https://everything2.com/index.pl?node_id=477013
<!-- prettier-ignore-end -->

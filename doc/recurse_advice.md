---
title: Recursion by numbers
math: true
---

> All therefore whatsoever they bid you observe, that observe and do; but do not
> ye after their works: for they say, and do not.\
> --- [_King James Bible_][KJV], Matthew, Chapter XXIII, verse 3

> Preachers say, do as I say, not as I do. But if a Physician had the same
> Disease upon him that I have, and he should bid me do one thing, and he do
> quite another, could I believe him?\
> --- John Selden, 1689[^a]

Recursion is not easy to grasp once you are accustomed to iteration. Iteration
is rather obvious. You have a procedure, laid out in a sequence of steps. Start
from the beginning and finish at the last step. Not so with recursion because
you must somehow solve a problem in terms of a simpler problem. Fear not. This
section offers some advice on how to write a recursive function in Haskell.[^b]
The advice can be condensed into the following questions:

1. What is your function's name?
1. What are its types?
1. What is the goal of the function?
1. What are the function's cases?
1. How can the function be simplified?

We will use the example of the factorial $n!$ of an integer to elaborate on the
above questions. Here is the problem statement. Given an integer $n \geq 0$,
write a Haskell function to calculate the factorial of $n$.

<!--=========================================================================-->

## What's in a name?

> _Police officer:_ What is your name?\
> _Ranjeet:_ Oh no. Watt is not my name.\
> _Police officer:_ I don't want to know what your name is not. What is your
> name?\
> _Ranjeet:_ And I'm telling you it is not.\
> --- _Mind Your Language_, season 1, episode 5, 1978

Choosing a name for a variable, function, class, or module can range from easy
to non-trivial. The following guidelines might help you to choose a meaningful
name for your function or some other entity within your program.[^c]

1. Choose a name that reveals your intention.
1. Avoid misleading names or red herrings.
1. Make meaningful distinctions.
1. Choose names that can be pronounced as words.
1. Prefer names that can be easily searched.
1. Avoid encoded names, Hungarian notation, and member prefixes.
1. Use names that are common to the problem or solution domain.
1. Avoid cute or cryptic names, names that are inside jokes, or puns.
1. One word per concept.
1. Add meaningful context to a name, but no more than necessary.

We want to calculate the factorial of an integer. It is clear that our function
should be named `factorial` or some slight variation. The notation $n!$ is used
interchangeably with the concept of factorial, but we should avoid naming our
function as `exclaim`. The expression $n!$ is read as "$n$ factorial", not "$n$
exclamation mark" nor should we shout out $n$.

<!--=========================================================================-->

## What's the type?

> _Donkey_: You think, you think that Shrek is your true love?\
> _Fiona_: Well... Yes.\
> [Shrek and Donkey have a fit of laughter.]\
> _Fiona_: What is so funny?\
> _Shrek_: Let's just say, I'm not your type. All right?\
> _Fiona_: Well, of course you are. You're my rescuer.\
> --- _Shrek_, 2001

The concept of factorial is defined for non-negative integers. The type `Int` is
unsuitable because it represents fixed precision integers. The value of $n!$ can
quickly grow very large for rather small values of $n$. The type `Integer` is
more suitable as it allows for arbitrary precision integers. Our function
`factorial` takes a value of type `Integer` and outputs a value of type
`Integer` as well. The signature of our function is as given below. The letter
`A` at the end of the function's name means that it is an early version of the
factorial function, an alpha version if you will.

:include: file="assets/src/recurse/solution/factorial.hs", line=28:28

In general, writing down the type of a function forces us to concentrate on the
range of acceptable inputs and what the output should be. Sometimes the function
signature also tells us the limitation of our function. The concept of factorial
can be extended to numbers other than integers, but in the case of `factorialA`
(whose signature is given above) our interest lies within the integers. If a
function accepts or outputs a value of type `Double`, we are restricted to
double-precision floating-point numbers, not arbitrary precision floating-point
numbers.

<!--=========================================================================-->

## What's the objective?

> _Drill Sergeant:_ Gump! What's your sole purpose in this Army?\
> _Forrest:_ To do whatever you tell me, Drill Sergeant.\
> _Drill Sergeant:_ God dammit, Gump! You're a God damn genius! That's the most
> outstanding answer I've ever heard. You must have a God damn IQ of 160. You
> are God damn gifted, Private Gump.\
> --- _Forrest Gump_, 1994

What is the end goal of your function? What do you want your function to
achieve? More specifically, what should be the output of your function? The
factorial function $n!$ of an integer $n$ should output the factorial of $n$,
not the factorial of a floating-point number. The absolute value function $|x|$
of a floating-point number $x$ should output the absolute value of $x$, not the
absolute value of a complex number. A function that writes to a file should
write to a given file on your local computer, not send a file over the Internet.

Knowing what your function must accomplish also helps you in writing the
function's signature. When you consider the type, or type signature, of your
function you usually want to know the type(s) of any parameters that the
function takes. Thinking about your function's objective forces you to also
think about the type of the output. The output of the function `factorial` is
the factorial of an integer, which by definition is an integer. Therefore the
type of the output is `Integer`.

The objective should be clear from the problem statement. Sometimes the
objective is not well defined or easy to tease out from the problem. In that
case, you must do some research into the problem to clarify what the solution
should be. Sometimes you must also make one or more assumptions. Why bother
knowing what you want your function to accomplish? We can take a lesson from a
quote in [The Zen of Python][zenPython] by Tim Peters:

> Explicit is better than implicit.

<!--=========================================================================-->

## What are the cases?

> "How came he, then?" I reiterated. "The door is locked; the window is
> inaccessible. Was it through the chimney?"\
> "The grate is much too small," he answered. "I have already considered that possibility."\
> "How then?" I persisted.\
> "You will not apply my precept," he said, shaking his head. "How often have I said
> to you that when you have eliminated the impossible, whatever remains, _however
> improbable_, must be the truth? We know that he did not come through the door,
> the window, or the chimney. We also know that he could not have been concealed
> in the room, as there is no concealment possible. Whence, then, did he come?"\
> --- A. Conan Doyle. _The Sign of Four_. Spencer Blackett, 1890, p.93

A recursive problem usually has one or more starting cases. These are also known
as base cases or specific cases. The recursive problem should also have a
recursive case, otherwise known as the general case. The interaction between the
base and recursive cases is mutual. Both depends on each other. The base cases
start the recursion. In some situations, the base cases also provide the
conditions for terminating the recursion. Without one or more starting values,
where do you start? The recursive case generalizes the base cases by providing
an explicit formula to generate more values from the starting values. Without a
general procedure, how do you generate more values?

Let's consider the cases for our factorial function. The factorial of zero is
defined as $0! = 1$. The factorial of 1 is defined as $1! = 1$. We take the
above as our base cases. The recursive case is the mathematical expression that
defines the factorial function of a non-negative integer $n$, i.e.

$$
n!
=
n \times (n - 1) \times (n - 2) \times \cdots \times 2 \times 1
$$

The base and recursive cases are combined into one expression as:

$$
\begin{equation}
\label{eqn_factorial}
n!
=
\begin{cases}
0,& \text{if } n = 0,\\[8pt]
n \times (n - 1) \times (n - 2) \times \cdots \times 2 \times 1,& \text{otherwise}.
\end{cases}
\end{equation}
$$

Writing the base and recursive cases in a form similar to expression
(\ref{eqn_factorial}) helps you to figure out how to structure your Haskell
code. Expression (\ref{eqn_factorial}) bears some resemblance to pattern
matching in Haskell. Perhaps you might want to use pattern matching. You might
also want to use guarded equation as necessary. Why not both? Here is an early
version of our implementation:

:include: file="assets/src/recurse/solution/factorial.hs", line=27:33

<!--=========================================================================-->

## Is there a simpler way?

> Don't ask me, because I don't know why\
> But it's like that, and that's the way it is\
> --- Run-DMC, _It's Like That_, 1983

A tenet of software development goes something like this: Get it working first.
Worry about optimization later. Now that we have a working implementation of the
factorial function, if time permits we should take a moment to think about how
to improve it. Refer to the definition of `factorialA` shown in the section
[What are the cases?](#what-are-the-cases). Do we really need the following
line?

```haskell
factorialA 1 = 1
```

Expression (\ref{eqn_factorial}) already handles the case $n = 1$ in the
recursive definition. Here's our new and improved implementation, version beta
if you will:

:include: file="assets/src/recurse/solution/factorial.hs", line=35:40

The next question is: Must we re-invent the wheel? Let's rephrase the question
as: Is there a library function or some package that we can use in our
implementation? It so happens that the library function [`product`][product] can
multiply together all numbers in a list. Consider the definition of $n!$ again.
We want to multiply together all integers between 1 and $n$, inclusive. The list
range notation `[1 .. n]` allows us to generate a list of all such integers. If
`a` and `b` are values of type `Integer` and `a > b`, the code `[a .. b]` would
output an empty list. Apply `product` to an empty list and we would obtain `1`.
If `a == b`, the code `[a .. b]` would result in the list `[a]`. In case
`n == 1`, then `[1 .. n]` would be the list `[1]`, passing which to `product`
would result in `1` as well. The only remaining case is `a < b`, or `1 < n`.
Pass the list `[1 .. n]` to `product` and we should obtain the value of $n!$.
The function `product` together with the list range notation `[1 .. n]` handle
the base case `n = 0` for us. Here is version 3.0 of our implementation of the
factorial function:

:include: file="assets/src/recurse/solution/factorial.hs", line=42:46

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
If $a$ and $n$ are integers such that $n > 0$, the exponentiation $a^n$ can be
defined in terms of repeated multiplication as follows:
<!-- prettier-ignore-end -->

$$
a^n
=
a \times a^{n-1}
$$

where $a^0 = 1$. Write a recursive function to perform integer exponentiation.
Check your implementation against the power operator `^`.

<!-- prettier-ignore-start -->
:exercise:
In the exercise on
[Euclid's algorithm](../recurse_loopless/#ex_gcd_subtraction), we determine the
greatest common divisor (GCD) of two positive integers $a$ and $b$ by repeated
subtraction. Euclid's algorithm can be sped up by noting that if $a_i > b_i$
then $\gcd(a_i,\, b_i) = \gcd(b_i,\, a_i \bmod b_i)$, where $a_i \bmod b_i$ is
the integer remainder obtained upon dividing $a_i$ by $b_i$. The speed gain
results from noting that integer division is the same as repeated
subtraction. The algorithm must halt because eventually we would have
$\gcd(a_k,\, 0) = a_k$. Implement the above efficient version of Euclid's
algorithm.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
[Binary search][binarySearch] is an algorithm to determine whether or not a
sorted list has a given element. Let $\ell$ be a list of integers, sorted in
non-decreasing order. Let $k$ be an element that we want to search in
$\ell$. Partition $\ell$ into two equal sublists. If $\ell$ has an even number
of elements, we would have a partition of two sublists of equal length;
otherwise one sublist would have one more element than the other sublist. Denote
by $L$ and $R$ the left and right partitions, respectively, of $\ell$. If $k$ is
less than or equal to the last element of $L$, then we search for $k$ in
$L$. Otherwise we search for $k$ in $R$. Recursively apply the search to an ever
smaller sublist. Eventually we would find that $k$ is either an element of
$\ell$ or not. Write a Haskell function to implement binary search of a sorted
list of integers. Test your implementation against the function [`elem`][elem].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The [Towers of Hanoi][towersHanoi] is a puzzle consisting of three pegs and a
stack of disks of different diameters. Initially, the disks are stacked on the
leftmost peg, with the largest disk at the bottom and smaller disks on top. A
smaller disk can only be stacked on top of a larger disk. The objective of the
puzzle is to relocate the stack from the leftmost peg to the rightmost peg,
moving one disk at a time. In each step, we are allowed to take the topmost disk
from a stack and move the disk on top of an another stack. A disk can only be
stacked on top of a larger disk. Starting with a stack of $n$ disks, the least
number of moves required to relocate the stack to the rightmost peg is:
<!-- prettier-ignore-end -->

$$
\begin{equation}
\label{eqn_Towers_Hanoi}
h_n
=
\begin{cases}
1,& \text{if } n = 1,\\[8pt]
2 h_{n-1} + 1,& \text{if } n > 1.
\end{cases}
\end{equation}
$$

Implement expression (\ref{eqn_Towers_Hanoi}) in Haskell. The recurrence
relation (\ref{eqn_Towers_Hanoi}) can be written as $h_n = 2^n - 1$. Use the
latter formula to verify your implementation.

<!-- prettier-ignore-start -->
:exercise:
The [McCarthy 91 function][McCarthy91] is a function on integers defined as:
<!-- prettier-ignore-end -->

$$
M(n)
=
\begin{cases}
n - 10,& \text{if } n > 100,\\[8pt]
M\big( M(n + 11) \big),& \text{otherwise}.
\end{cases}
$$

Implement the McCarthy 91 function and verify that it results in the value of 91
for all integers between 0 and 101, inclusive.

<!-- prettier-ignore-start -->
:exercise:
The [Tak function][takFunction] as reported by John McCarthy[^d] is a recursive
function defined by:
<!-- prettier-ignore-end -->

$$
\text{tak}(x,\, y,\, z)
=
\begin{cases}
y,& \text{if } x \leq y,\\[8pt]
\text{tak}\big(
  \text{tak}(x-1, y, z),\,
  \text{tak}(y-1, z, x),\,
  \text{tak}(z-1, x, y)
\big),& \text{otherwise}.
\end{cases}
$$

McCarthy reported that the value of $\text{tak}(x,\, y,\, z)$ is one of $x$,
$y$, or $z$. Implement the Tak function and verify McCarthy's claim for integers
between 1 and 100, inclusive.

<!-- prettier-ignore-start -->
:exercise:
The [Ackermann function][ackermannFunction], using the version by Rózsa
Péter[^e] and Raphael M. Robinson,[^f] is defined as:
<!-- prettier-ignore-end -->

$$
A(x,\, y)
=
\begin{cases}
y + 1,& \text{if } x = 0,\\[8pt]
A(x-1,\, 1),& \text{if } y = 0,\\[8pt]
A\big( x-1,\, A(x,\, y-1) \big),& \text{otherwise}.
\end{cases}
$$

The value of the function grows very fast, even for small integers. Implement
the above version of the Ackermann function and generate its values for integers
$0 \leq x \leq 3$ and $0 \leq y \leq 5$.

<!-- prettier-ignore-start -->
:exercise:
The [Catalan number][catalanNumber] $C_n$ counts the number of expressions
containing $n$ pairs of parentheses that are correctly matched, i.e. the
brackets are balanced. The number $C_n$ also has an interpretation as the number
of distinct ways in which $n + 1$ factors can be parenthesized. A formula for
$C_n$ is:
<!-- prettier-ignore-end -->

$$
\begin{equation}
\label{eqn_Catalan_binomial}
C_n
=
\frac{1}{n+1}
\binom{2n}{n}
\end{equation}
$$

where $\binom{n}{k}$ is the binomial coefficients. If $n \geq 0$, the number
$C_n$ can be written as

$$
\begin{equation}
\label{eqn_Catalan_binomial_difference}
C_n
=
\binom{2n}{n} - \binom{2n}{n+1}.
\end{equation}
$$

If $n > 0$, then $C_n$ has the following recursive definition:

$$
\begin{equation}
\label{eqn_Catalan_recursive}
C_n
=
\frac{
  2(2n - 1)
}{
  n + 1
}
C_{n-1}
\end{equation}
$$

where $C_0 = 1$. Implement expression (\ref{eqn_Catalan_recursive}). Use
expressions (\ref{eqn_Catalan_binomial}) and
(\ref{eqn_Catalan_binomial_difference}) to verify your implementation.

<!-- prettier-ignore-start -->
:exercise:
Given a list of integers, write a function that:
<!-- prettier-ignore-end -->

-   Outputs the greatest integer from the list, with and without a fold
    operation. Use the function [`maximum`][maximum] to verify your
    implementation.
-   Outputs the least integer from the list, with and without a fold operation.
    Use the function [`minimum`][minimum] to verify your implementation.

<!-- prettier-ignore-start -->
:exercise:
Addition of integers can be defined in terms of successive adding of 1. Let $k$
and $n$ be non-negative integers. Define the sum $n + k$ as follows:
<!-- prettier-ignore-end -->

$$
n + k
=
(n + 1) + (k - 1)
$$

where $n + 0 = n$. Write a function in Haskell to implement the above recursion.

<!--=========================================================================-->

[^a]:
    S. W. Singer. _The Table-Talk of John Selden_. 2nd edition, John Russell
    Smith, 1856, p.127.

[^b]:
    This section is based on the following paper: Hugh Glaser, Pieter H. Hartel,
    and Paul W. Garratt. Programming by Numbers: A Programming Method for
    Novices, _The Computer Journal_, volume 43, issue 4, 2000, pp.252--265, doi:
    [10.1093/comjnl/43.4.252][GlaserEtAl2000]

[^c]:
    The naming guidelines are based on the following: Tim Ottinger. "Chapter 2:
    Meaningful Names" in Robert C. Martin. _Clean Code: A Handbook of Agile
    Software Craftsmanship_. Pearson Education, 2009, pp.17--30.

[^d]:
    J. McCarthy. An interesting LISP function. _ACM Lisp Bulletin_, issue 3,
    1979, pp.6--8, doi: [10.1145/1411829.1411833][McCarthy1979]

[^e]:
    Rózsa Péter. Konstruktion nichtrekursiver Funktionen. _Mathematische
    Annalen_, volume 111, issue 1, 1935, pp.42--60, doi:
    [10.1007/BF01472200][Péter1935]

[^f]:
    Raphael M. Robinson. Recursion and double recursion. _Bulletin of the
    American Mathematical Society_, volume 54, issue 10, 1948, pp.987--993, doi:
    [10.1090/S0002-9904-1948-09121-2][Robinson1948]

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[ackermannFunction]: https://web.archive.org/web/20231213180237/https://en.wikipedia.org/wiki/Ackermann_function
[binarySearch]: https://web.archive.org/web/20231219012820/https://en.wikipedia.org/wiki/Binary_search_algorithm
[catalanNumber]: https://web.archive.org/web/20230904134042/https://en.wikipedia.org/wiki/Catalan_number
[Durstenfeld1964]: https://doi.org/10.1145/364520.364540
[elem]: https://web.archive.org/web/20231221222059/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:elem
[fisherYates]: https://web.archive.org/web/20231212131856/https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
[GlaserEtAl2000]: https://doi.org/10.1093/comjnl/43.4.252
[KJV]: https://web.archive.org/web/20231220034317/https://en.wikisource.org/wiki/Bible_(King_James)/Matthew
[maximum]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:maximum
[minimum]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:minimum
[McCarthy1979]: https://doi.org/10.1145/1411829.1411833
[McCarthy91]: https://web.archive.org/web/20231213140749/https://en.wikipedia.org/wiki/McCarthy_91_function
[Péter1935]: https://doi.org/10.1007/BF01472200
[product]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:product
[Robinson1948]: https://doi.org/10.1090/S0002-9904-1948-09121-2
[takFunction]: https://web.archive.org/web/20231221131226/https://en.wikipedia.org/wiki/Tak_(function)
[towersHanoi]: https://web.archive.org/web/20231219222656/https://en.wikipedia.org/wiki/Tower_of_Hanoi
[zenPython]: https://web.archive.org/web/20231204220702/https://realpython.com/zen-of-python/
<!-- prettier-ignore-end -->

---
title: Fold under pressure
math: true
---

Sometimes you want to traverse a list, perform an operation on each element,
then output a result based on the elements. Isn't that what the function
[`map`][map] does? Well, yes and no. The function `map` outputs a list. You
might not want a list, but a value based on the elements of the input list. In
general, you want to reduce the elements of a list to a value, i.e. fold a list
into a value. The next section clarifies what we mean.

<!--=========================================================================-->

## How to sum

The library function [`sum`][sum] takes a list of numbers and adds all those
numbers together to result in a sum. As an exercise to help us understand how
the function `sum` works, we implement our own version as follows:

:include: file="assets/src/recurse/sum.hs", line=27:30

Let's generalize the above code into a pattern. Suppose we have a list $\ell$ of
numbers. Let's get the base case out of the way. If $\ell$ is empty, the sum of
$\ell$ is zero. Now suppose $\ell$ is non-empty and let's get on to the
recursive case. Initially, the cumulative sum is zero. By definition of the
recursive case, we can also argue that the initial cumulative sum is the head of
$\ell$. As we visit the $i$-th element $e_i$ of $\ell$, the cumulative sum is
the value of $e_i$ plus all the elements $e_0,\, e_1,\, \dots,\, e_{i-1}$. At
any given step in the recursive process, we have three numbers:

1. Initial value. The value we start with prior to commencing the summation.
   Before summing, our sum is 0. Thus 0 is the initial value.
1. Current value. The value of $e_i$, the current element of $\ell$ we are
   considering. We step through each list element in order.
1. Accumulator. This is the cumulative sum so far. Before performing the
   summation, the value of the accumulator is the initial value. If we are at
   element $e_i$ of $\ell$, the accumulator at $e_i$ is the sum of all elements
   from $e_0$ up to and including $e_i$.

By way of example, consider summing the list `[1, 2, 3, 4, 5]`. The initial sum
is zero, which is also the starting value of the accumulator. At element
$e_0 = 1$, our accumulator is $e_0 = 1$ as well. At $e_1 = 2$, the accumulator
is $e_0 + e_1 = 3$. At $e_2$, the accumulator is $e_0 + e_1 + e_2 = 6$. At
$e_3$, the accumulator is $e_0 + e_1 + e_2 + e_3 = 10$. At $e_4$, the
accumulator is $e_0 + e_1 + e_2 + e_3 + e_4 = 15$. We have exhausted all
elements of the initial list, i.e. the remaining list is empty. By definition,
the sum of an empty list is zero. Add zero to the accumulator to result in the
accumulator itself. The result of summing the initial list is the current value
of the accumulator, namely 15. We have reduced (or folded) the initial list
`[1, 2, 3, 4, 5]` to a value. The function used in the reduction is arithmetic
addition.

<!--=========================================================================-->

## Fold left

The pattern described in the section [How to sum](#how-to-sum) is an example of
a [fold operation][foldOperation]. The Haskell function [`foldl`][foldl] takes
three parameters:[^a]

1. A binary operator, i.e. a function that accepts two parameters. In terms of
   the summation problem above, the binary operator is the addition operator
   `+`.
1. An initial value. For example, in the summation problem above the initial
   value is zero.
1. A list. We want to fold (or reduce) the elements of the list to a value.

We can use `foldl` to rewrite `add` as follows:

:include: file="assets/src/recurse/sum.hs", line=32:34

The character `l` (lowercase L) in the function name `foldl` means "left". This
means that the fold operation goes from the left of the list to the right. For
example, summing the list `[1 .. 5]` can be written as:

```haskell
ghci> foldl (+) 0 [1 .. 5]
15
```

In the above GHCi session, the binary operator `+` hides the role of the
accumulator. We do not always have a pre-defined library function to pass to
`foldl`. Sometimes we must define our own binary function. Let's rewrite the
above code to clearly show how the accumulator is keeping track of the
cumulative sum. Examine the lambda expression below:

```haskell
ghci> foldl (\acc x -> acc + x) 0 [1 .. 5]
15
```

Prior to starting the summation, the value of the accumulator `acc` is 0. Now
start the summation at the first element of the list `[1 .. 5]`. Then `1` would
be passed to the lambda expression and assigned to the variable `x`, resulting
in the cumulative sum $0 + 1 = 1$. The new value of the accumulator is now 1.
Repeat the process for each of the remaining elements of the list and we obtain
the sum of the list. Using the [associative law][associativeLaw] for addition,
the summation encapsulated in the above Haskell code can be written as:

```haskell
((((0 + 1) + 2) + 3) + 4) + 5
```

Notice the position of the initial value 0 and how it corresponds to the
position of the accumulator in the above lambda expression. Since we are folding
from the left, the accumulator should be on the left-hand side in both infix and
prefix notations. To evaluate the expression, we start from the innermost pair
of parentheses and work our way to the outermost pair of parentheses.

<!--=========================================================================-->

## Fold right

> _Rumack:_ Can you fly this plane and land it?\
> _Ted Striker:_ Surely you can't be serious.\
> _Rumack:_ I am serious... and don't call me Shirley.\
> --- _Airplane!_, 1980

If there is a fold left, then surely there must be a fold right, yes? Of course
there is a fold right. The Haskell function [`foldr`][foldr] allows you to fold
from the right of a list to the left of the list. The function accepts the same
three parameters as `foldl`. Here is a comparison:

```haskell
ghci> foldl (+) 0 [1 .. 5]
15
ghci> foldl (\acc x -> acc + x) 0 [1 .. 5]
15
ghci> foldr (+) 0 [1 .. 5]
15
ghci> foldr (\x acc -> x + acc) 0 [1 .. 5]
15
```

The above summation with `foldr` can be written as:

```haskell
1 + (2 + (3 + (4 + (5 + 0))))
```

Again, notice the position of the initial value 0 and the position of the
accumulator in the lambda expression for `foldr`. Since we are folding from the
right, the accumulator should be on the right-hand side in both infix and prefix
notations. We start from the innermost pair of parentheses and work our way out.

Why do `foldl` and `foldr` result in the same answer in the above GHCi session?
The reason is that addition is associative. It does not matter in which order we
perform the addition. We always get the same result no matter the order in which
we add.

Here is a simple case where `foldl` and `foldr` give different results:

```haskell
ghci> foldl (-) 0 [1 .. 5]
-15
ghci> foldl (\acc x -> acc - x) 0 [1 .. 5]
-15
ghci> foldr (-) 0 [1 .. 5]
3
ghci> foldr (\x acc -> x - acc) 0 [1 .. 5]
3
```

Notice the position of the accumulator in the lambda expression for `foldl` and
`foldr`. The subtraction problem denoted by the code `foldl (-) 0 [1 .. 5]` can
be written as:

```haskell
((((0 - 1) - 2) - 3) - 4) - 5
```

On the other hand, the code `foldr (-) 0 [1 .. 5]` can be written as:

```haskell
1 - (2 - (3 - (4 - (5 - 0))))
```

In the case of subtraction, `foldl` and `foldr` give different results because
subtraction is not associative. The order of operation matters in subtraction.

<!--=========================================================================-->

## Which fold?

Suppose we have a binary operator $f$ that is associative, i.e. the order of
operation does not matter. Using either [`foldl`][foldl] or [`foldr`][foldr]
with $f$ would result in the same answer. Which fold operation should we choose?

<!--=========================================================================-->

### Left or right?

A simple answer is: You should usually choose `foldr` if your binary operator is
associative. The reason is that `foldr` is more time efficient than `foldl`. As
an example, let's sum all integers between 1 and 1,000,000. Here is `foldl` in
action:

```haskell
ghci> :set +s
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.34 secs, 161,302,760 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.25 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.23 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.23 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.25 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.25 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.25 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.23 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.23 secs, 161,299,688 bytes)
ghci> foldl (+) 0 [1 .. 1000000]
500000500000
(0.23 secs, 161,299,688 bytes)
```

The GHCi command [`:set +s`][ghciSetS] would print some basic statistics about a
function call. For the purposes of this example, we are only interested in the
amount of time elapsed from the start of a function call to its termination. In
the above GHCi session, we call `foldl` ten times to sum all integers between 1
and 1,000,000. Each call has an average elapsed time of approximately 0.249
seconds.

Now let's see `foldr` in action:

```haskell
ghci> :set +s
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.22 secs, 161,593,088 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.17 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.17 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.18 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.17 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.16 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.18 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.16 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.18 secs, 161,590,016 bytes)
ghci> foldr (+) 0 [1 .. 1000000]
500000500000
(0.15 secs, 161,590,016 bytes)
ghci>
```

The average elapsed time is approximately 0.174 seconds. As we can see from the
above two sets of GHCi sessions, `foldr` is more time efficient than `foldl` in
the case of addition.

<!--=========================================================================-->

### This left or that left?

We know that there is a fold from the left ([`foldl`][foldl]) and a fold from
the right ([`foldr`][foldr]). But did you know there is another version of
`foldl`? It is called [`foldl'`][foldlPrime], notice the single quotation mark
`'`. The function `foldl'` is defined in the package [`GHC.List`][GHCList] and
is meant to be an efficient implementation of `foldl`.

Why another implementation of fold? The reason is due to associativity again.
Suppose we have a binary operator $f$ that is not associative, i.e. the order of
operation matters. Further assume that `foldl` (the left fold) produces the
result we want, whereas `foldr` (the right fold) would result in an erroneous
answer. Then `foldl'` should usually be preferred to `foldl` because the former
is more time efficient than the latter.

Consider the example of subtraction. Remember, subtraction is not associative,
unlike addition. The GHCi session below uses `foldl` ten times, yielding an
average elapsed time of approximately 0.221 seconds.

```haskell
ghci> :set +s
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.26 secs, 161,303,552 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.21 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.23 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.19 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.23 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.21 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.24 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.21 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.23 secs, 161,300,480 bytes)
ghci> foldl (-) 0 [1 .. 1000000]
-500000500000
(0.20 secs, 161,300,480 bytes)
```

Here's the GHCi session for `foldl'`. Note that we must import the package
`GHC.List` because `foldl'` is defined in that package. The average elapsed time
of ten calls is about 0.062 seconds.

```haskell
ghci> import GHC.List
ghci> :set +s
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.05 secs, 88,074,640 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.08 secs, 88,073,720 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.03 secs, 88,073,728 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.02 secs, 88,073,728 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.06 secs, 88,073,728 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.07 secs, 88,073,736 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.08 secs, 88,073,736 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.08 secs, 88,073,736 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.08 secs, 88,073,736 bytes)
ghci> foldl' (-) 0 [1 .. 1000000]
-500000500000
(0.07 secs, 88,073,736 bytes)
```

When you must use a left fold, `foldl'` would usually be a better choice than
`foldl`.

<!--=========================================================================-->

## Universal property of fold

> _Zapp:_ Wait. What are you people? Idiots? I'm still going mano a mano with
> this envelope. And the winner is: Miss Vega 4. There it is, Miss Universe.
> There it is, looking weird.\
> --- _Futurama_, season 2, episode 6, 2000

The universal property of fold refers to the fact that many recursive
definitions of functions can be equivalently expressed as a fold operation.[^b]
Suppose we have a binary operator $f$ and we define a function $g$ as follows:

```haskell
g []     = v
g (x:xs) = f x (g xs)
```

where `v` is the base case for $g$. The universal property of fold says that the
above recursive definition is equivalent to the following fold operation:

```haskell
g = foldr f v
```

What does "universal property" mean? We won't delve too deep into the notion.
Suffice it to say that, in mathematics, the idea of universal property means
structural equivalence. Mathematics gives us a number of abstract rules by which
we can determine whether two constructions are fundamentally the same. Suppose
we can construct an object $A$ via one technique and we can construct an object
$B$ via another technique. If we can show that both $A$ and $B$ satisfy the same
universal property, i.e. the same fundamental set of rules, then we may conclude
that $A$ and $B$ are equivalent. The implication is immediate. Suppose the
construction of $A$ happens to be long or takes a while to complete, but the
construction of $B$ is short and efficient. If $A$ and $B$ are structurally
equivalent, then we can replace $A$ by $B$. The fold operation happens to be a
short and sweet way to define many recursive functions.

<!--=========================================================================-->

### Examples

Let's see how the universal property of fold can help us write an expression to
calculate the length of a list. Recall from the section
[Length of list](../recurse_example/#length-of-list) that we have the following
recursive definition:

:include: file="assets/src/recurse/length.hs", line=27:30

To convert the above recursive definition to a fold operation, we require two
ingredients:

1. The initial value. For the case base, the length of an empty list is zero.
   This is our initial value.
1. The binary operator. The function we require is addition. For clarity, we
   should write our binary operator in such a way that shows the role of the
   accumulator. As we traverse through each element of a list, we increment our
   accumulator by 1. Using a fold right operation, our lambda expression would
   be `(\_ acc -> 1 + acc)`. The wildcard character `_` means that we ignore any
   list element passed to the lambda expression. We replace each list element by
   the value `1`.

Combine the above two ingredients to obtain the following expression:

:include: file="assets/src/recurse/length.hs", line=32:33

In the section [No loop for you](../recurse_loopless/#diy-map), we presented a
homemade implementation of the library function [`map`][map]. Here's the code
for reference:

:include: file="assets/src/recurse/map.hs", line=28:31

The initial value is the empty list `[]`. The binary operator is the function
`f x acc`, which takes an element `x` of the input list, calculates the result
`f x`, and prepends the result to the accumulator `acc`. Writing a successive
sequence of prepending as

```haskell
ghci> 1 : 2 : 3 : []
[1,2,3]
ghci> 1 : (2 : (3 : []))
[1,2,3]
```

it is clear that we can use a fold right. Here's an implementation of `map` by
means of [`foldr`][foldr]:

:include: file="assets/src/recurse/map.hs", line=33:35

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
Why do `foldl` and `foldr` yield different results in the GHCi session below?
<!-- prettier-ignore-end -->

```haskell
ghci> foldl (^) 2 [1, 2, 3]
64
ghci> foldr (^) 2 [1, 2, 3]
1
```

What can be concluded about the operator `^`?

<!-- prettier-ignore-start -->
:exercise:
In the GHCi session below, why does `foldr` result in the list `[1,2,3]` but
`foldl` results in an error? What can be concluded about the operator `:`?
<!-- prettier-ignore-end -->

```haskell
ghci> foldr (:) [] [1, 2, 3]
[1,2,3]
ghci> foldl (:) [] [1, 2, 3]

<interactive>:2:7: error:
    * Couldn't match type 'a' with '[a]'
      Expected: [a] -> [[a]] -> [a]
        Actual: [a] -> [[a]] -> [[a]]
      'a' is a rigid type variable bound by
        the inferred type of it :: [a]
        at <interactive>:2:1-22
    * In the first argument of 'foldl', namely '(:)'
      In the expression: foldl (:) [] [1, 2, 3]
      In an equation for 'it': it = foldl (:) [] [1, 2, 3]
    * Relevant bindings include it :: [a] (bound at <interactive>:2:1)
```

<!-- prettier-ignore-start -->
:exercise:
Is the division operator `/` associative? Why or why not? Provide an example
using `foldl` and `foldr`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Repeat the [factorial exercise](../recurse_example/#ex_factorial), but use a
fold operation.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
[Read more][foldMore] about `foldl`, `foldl'`, and `foldr`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The arithmetic mean (or average) $a_n$ of a sequence
$x_1,\, x_2,\, \dots,\, x_n$ of $n$ numbers is defined as:
<!-- prettier-ignore-end -->

$$
\begin{equation}
\label{eqn:arithmeticMean}
a_n
=
\frac{1}{n}
\sum_{i=1}^n x_i.
\end{equation}
$$

Use a fold operation to implement expression (\ref{eqn:arithmeticMean}). Assume
that each $x_i$ is an integer.

<!-- prettier-ignore-start -->
:exercise:
Use a fold operation to implement the function [`last`][last].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Write a function `join` that takes two parameters: (1) a delimiter string
`delim`; and (2) a list $\ell$ of numbers. The function `join` outputs the
elements of $\ell$ as a string, where the elements are separated by the given
delimiter `delim`. For example, the code `join "," [1, 2, 3]` should result in
the string `"1,2,3"`. Implement `join` with and without a fold operation.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Use a fold operation to implement your own version of the function
[`reverse`][reverse].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Repeat the exercise on [dot product](../decide_pattern/#exDotProduct), but use a
fold operation. Assume your lists are finite, but not necessarily of two
elements.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

[^a]:
    Some programming languages use "reduce" to describe the fold operation.
    Examples include [JavaScript][JavaScript], [Python][Python], and
    [Ruby][Ruby].

[^b]:
    See the following paper for more details: Graham Hutton. A tutorial on the
    universality and expressiveness of fold. _Journal of Functional
    Programming_, volume 9, issue 4, 1999, pp.355--372, doi:
    [10.1017/S0956796899003500 ][Hutton1999]

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[associativeLaw]: https://web.archive.org/web/20231220035654/https://en.wikipedia.org/wiki/Associative_property
[cumulativeAverage]: https://web.archive.org/web/20231212072042/https://en.wikipedia.org/wiki/Moving_average
[foldl]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:foldl
[foldlPrime]: https://web.archive.org/web/20231223101222/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:foldl-39-
[foldMore]: https://web.archive.org/web/20231225225838/https://wiki.haskell.org/Foldr_Foldl_Foldl%27
[foldOperation]: https://web.archive.org/web/20231217195139/https://en.wikipedia.org/wiki/Fold_(higher-order_function)
[foldr]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:foldr
[ghciSetS]: https://web.archive.org/web/20231211233223/https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html#ghci-cmd-:set%20+s
[GHCList]: https://web.archive.org/web/20231223101222/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html
[Hutton1999]: https://doi.org/10.1017/S0956796899003500
[JavaScript]: https://web.archive.org/web/20231222034555/https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
[last]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:last
[map]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:map
[Python]: https://web.archive.org/web/20231221150145/https://docs.python.org/3/library/functools.html#functools.reduce
[reverse]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:reverse
[Ruby]: https://web.archive.org/web/20231222032534/https://ruby-doc.org/3.2.2/Enumerable.html#method-i-reduce
[sum]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:sum
<!-- prettier-ignore-end -->

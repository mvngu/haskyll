---
title: Pattern matching
math: true
---

The basic idea of pattern matching is simple. Organize the definition of your
function according to the specific patterns you want to match. That does not
sound simple at all. We need examples to clarify how to use pattern matching.

<!--=========================================================================-->

## Traffic lights

Put on your traffic engineer hat. The traffic light red means stop, orange means
wait, and green means go. We can translate the latter description to a guarded
equation like so:

:include: file="assets/src/decide/traffic.hs", line=27:33

Alternatively, we can use pattern matching. How? Observe:

:include: file="assets/src/decide/traffic.hs", line=35:40

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

:include: file="assets/src/decide/not.hs", line=27:30

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

:include: file="assets/src/decide/or.hs", line=27:31

<!--=========================================================================-->

## Tuple-ware

A collection type such as tuples are a fertile ground for pattern matching.
Let's start with our friend, the function [`fst`][fst]. Given a tuple of two
elements, the function `fst` outputs the first element. It's as simple as that.
Don't believe me? See for yourself:

```haskell
ghci> fst ('a', 'b')
'a'
ghci> fst (1, 2)
1
ghci> fst ("x", 42)
"x"
```

Note that `fst` ignores the second element. That seems like a job for the
wildcard symbol `_`. Let's implement our own version of `fst` and name it
`firstA`.

:include: file="assets/src/decide/first.hs", line=27:29

There's something funny going on in the signature of `firstA`. Where's the type
name like `Integer` or `String`? Instead, the input is a tuple like `(a, b)`.
Let Haskell hit you with some knowledge. The elements of a tuple can be of
different types. The parameter `(a, b)` for `firstA` means that we do not care
about the type of each tuple element. The left element can be of type `a`
(whatever it is) and the right element can be of type `b`, which might be the
same as, or different from, `a`. Carefully examine the above GHCi session again
to delude, err... I mean convince yourself.

The wildcard symbol `_` is rather handy, especially when working with tuples of
greater than two elements. Consider a tuple of three elements such as
`(1, 2, 3)`. The middle element is `2`. Here's a function to extract the middle
element of any tuple of three elements:

:include: file="assets/src/decide/mid.hs", line=27:29

<!--=========================================================================-->

### Vector addition

Did you say you want more examples? No problem. Consider the addition of vectors
of two elements. Adding two vectors is the same as adding their corresponding
elements. Here's an implementation:

:include: file="assets/src/decide/vadd.hs", line=27:29

What is the code `Num a =>` doing in the signature of `vadd`? What does the code
mean? Let's examine the code bit by bit. The Haskell type [`Num`][num] is a type
class, meaning that `Num` encompasses the usual number types such as `Int`,
`Integer`, and `Double`. Put another way, numeric types such as `Integer` and
`Double` are based on `Num`. You can confirm the latter statement by examining
the following GHCi session:

```haskell
ghci> :info Num
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
    -- Defined in ‘GHC.Num’
instance Num Double -- Defined in ‘GHC.Float’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
```

The code `(Num a)` means that we are restricting the type `a` to be a numeric
type that is based on `Num`. The code `(Num a)` is also referred to as the
context. The fat arrow symbol `=>` serves as a delimiter between the context on
its left-hand side and the type information on its right-hand side.[^a] The
signature of `vadd` can be read as: The function `vadd` takes two parameters,
both being tuples whose elements are all of the same numeric type. The output of
`vadd` is a tuple whose elements have the same numeric type as the elements of
the input tuples. Furthermore, the numeric type must be based on `Num`. What a
mouthful! You will encounter signatures like that of the function `vadd` as you
read and write more complex Haskell code.

<!--=========================================================================-->

## Kraken's list

Now that you have learnt how to pattern match using tuples, you should have
little difficulty understanding how to do simple pattern matching with lists.

<!--=========================================================================-->

### Heads first

Let's consider the familiar example of the function [`fst`][fst]. This function
is defined for tuples of two elements. Haskell already has the standard function
[`head`][head] to output the first element of a list. However, it does not
require much effort to define our own version that works for lists of two
elements. With a little change to the function `firstA` we can define the
counterpart of `fst` for lists. See the following:

:include: file="assets/src/decide/first.hs", line=31:33

Here are some differences between the functions `firstA` and `firstB`.

1. All elements of a list must be of the same type. Haskell prohibits us from
   mixing different types in a list. The elements of a tuple can have different
   types.
1. The elements of a list are delimited by a pair of square brackets. The
   elements of a tuple are delimited by a pair of parentheses.
1. In the signature of a function that uses lists, we do not have to specify how
   many elements will be in our list. All we have to do is enclose a data type
   inside a pair of square brackets. The parameter `[a]` in the definition of
   `firstB` above means that `firstB` takes a list whose elements are of type
   `a`, whatever that type might be. On the other hand, the signature of a
   function that uses tuples must specify the exact number of elements of the
   tuple.

You already know that the length of a tuple is fixed. Once you have decided on
the elements of a tuple, you cannot add to or remove elements from the tuple. On
the other hand, a list can be extended or contracted. Another feature of lists
is that you can use a powerful technique to perform pattern matching. This is
best demonstrated via an example. We can reimplement the function `firstB` as
follows:

:include: file="assets/src/decide/first.hs", line=35:37

Why do we have the tuple `(x:xs)` in the above code listing? The code `(x:xs)`
is not specifying a tuple. Rather, it tells us that given a list, we assign the
first element of the list to the variable `x`. The rest of the elements (as a
sublist) are assigned to the variable `xs`. Let's call the pattern `(x:xs)` the
this-and-rest pattern. Sounds good. But there's a bug in the above definition of
`firstC`.

Suppose you load the above definition into GHCi and attempt to apply the
function to an empty list. Haskell would throw a conniption fit. Watch Haskell
being dramatic:

```haskell
ghci> firstC [1, 2, 3]
1
ghci> firstC [1, 2]
1
ghci> firstC [1]
1
ghci> firstC []
*** Exception: first.hs:13:1-17: Non-exhaustive patterns in function firstC
```

We must handle the case of the empty list. No problem. Here's version 2.0:

:include: file="assets/src/decide/first.hs", line=39:42

In the above code listing, we used the function [`error`][error] to halt the
program and output a sensible message if the function `firstD` is given an empty
list. Here is Haskell throwing another tantrum, but on our own terms.

```haskell
ghci> firstD [1, 2, 3]
1
ghci> firstD [1, 2]
1
ghci> firstD [1]
1
ghci> firstD []
*** Exception: Empty list
CallStack (from HasCallStack):
  error, called at first.hs:17:17 in main:Main
```

<!--=========================================================================-->

### Take my ex, please

Let's see more of the this-and-rest pattern `(x:xs)` in action. We have a
function to extract the first element of a list. Logic dictates that we should
have a function to extract the second element. Here goes:

:include: file="assets/src/decide/second.hs", line=27:31

The pattern `(x:y:xs)` in the above code listing has the following
interpretation. The first element of a list is assigned to the variable `x`, the
second element to `y`, and the rest of the elements (as a sublist) are assigned
to `xs`. However, we are only interested in the second element. We donut, umm...
I mean, do not care about the `x` and the `xs`. Sounds like another job for the
wildcard symbol `_`. Here is a different version of `secondA`.

:include: file="assets/src/decide/second.hs", line=33:37

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
Provide another implementation of [`not`][not] other than the implementation
shown in the section [Andrew or And-rew?](#andrew-or-and-rew).
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Use pattern matching to provide an implementation of the boolean operator `&&`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The package [`Data.Bits`][dataBits] has the method [`xor`][xor] to calculate the
exclusive or (i.e. XOR) of two boolean values. Provide a reimplementation of
`xor`, but use pattern matching.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Use pattern matching to reimplement the function [`snd`][snd].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Write a function to implement the addition of vectors of three elements. The
elements of the vectors are integers. You might find the type class
[`Integral`][integral] useful.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise: label="exDotProduct"
The dot product of two vectors $(a,\, b)$ and $(x,\, y)$ is defined as
<!-- prettier-ignore-end -->

$$
(a,\, b) \cdot (x,\, y)
=
ax + by.
$$

Implement the dot product.

<!-- prettier-ignore-start -->
:exercise:
Consider the function `capitalize` from the sections
[DIY](../decide_function/#diy) and [I `do`](../decide_function/#i-do). Simplify
the function.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The functions [`head`][head], [`tail`][tail], [`init`][init], and [`last`][last]
are unsafe in the sense that each would throw an error when given an empty
list.
<!-- prettier-ignore-end -->

1. Implement your own versions of the functions [`last`][last], [`tail`][tail],
   and [`init`][init] without using the above functions.
1. Implement your own versions of the above functions so they would properly
   handle empty lists.
1. The torso of a list is defined as the list without its head and last
   elements. Use your "safe" implementations above to obtain the torso of
   various lists.

<!-- prettier-ignore-start -->
:exercise:
Write a function that takes a list of integers. If the first integer is odd,
then remove the first element. Otherwise keep the integer.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The [Cartesian product][cartesianProduct] of two lists `[a, b, c]` and
`[x, y, z]` is the list:
<!-- prettier-ignore-end -->

```haskell
[(a, x), (a, y), (a, z), (b, x), (b, y), (b, z), (c, x), (c, y), (c, z)]
```

Write a function to implement the Cartesian product of lists of three elements.

<!--=========================================================================-->

[^a]: See the [Haskell 2010 Language Report][haskell2010].

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[cartesianProduct]: https://web.archive.org/web/20231213134027/https://en.wikipedia.org/wiki/Cartesian_product
[dataBits]: https://web.archive.org/web/20231116111136/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bits.html
[error]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:error
[fst]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fst
[haskell2010]: https://web.archive.org/web/20231118160240/https://www.haskell.org/onlinereport/haskell2010/haskellch10.html#x17-18000010.5
[head]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:head
[init]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:init
[integral]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integral
[last]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:last
[not]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:not
[num]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Num
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
[snd]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:snd
[tail]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:tail
[xor]: https://web.archive.org/web/20231116111136/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bits.html#v:xor
<!-- prettier-ignore-end -->

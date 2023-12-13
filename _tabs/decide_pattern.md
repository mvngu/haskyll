---
title: Pattern matching
math: true
order: 16
---

The basic idea of pattern matching is simple. Organize the definition of your
function according to the specific patterns you want to match. That does not
sound simple at all. We need an example.

<!--=========================================================================-->

## Traffic lights

Put on your traffic engineer hat. The traffic light red means stop, orange means
wait, and green means go. We can translate the latter description to a guarded
equation like so:

[`traffic.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/traffic.hs)
```haskell
-- Meaning of each traffic light.
trafficg :: String -> String
trafficg light
    | light == "red" = "stop"
    | light == "orange" = "wait"
    | light == "green" = "go"
    | otherwise = "Invalid traffic light"
```

Alternatively, we can use pattern matching. How? Observe:

[`traffic.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/traffic.hs)
```haskell
-- Meaning of each traffic light.
trafficp :: String -> String
trafficp "red"    = "stop"
trafficp "orange" = "wait"
trafficp "green"  = "go"
trafficp _        = "Invalid traffic light"
```

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

[`not.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/not.hs)
```haskell
-- | Reimplementation of the library function "not".
myNot :: Bool -> Bool
myNot True  = False
myNot False = True
```

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

[`or.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/or.hs)
```haskell
-- | Reimplementation of the boolean operator "||".
myOr :: Bool -> Bool -> Bool
myOr False False = False
myOr False True  = True
myOr True _      = True
```

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

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/first.hs)
```haskell
-- | A reimplementation of the function "fst".
firstA :: (a, b) -> a
firstA (x, _) = x
```

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

[`mid.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/mid.hs)
```haskell
-- | The middle element of a tuple of three elements.
mid :: (a, b, c) -> b
mid (_, x, _) = x
```

<!--=========================================================================-->

### Vector addition

Did you say you want more examples? No problem. Consider the addition of vectors
of two elements. Adding two vectors is the same as adding their corresponding
elements. Here's an implementation:

[`vadd.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/vadd.hs)
```haskell
-- | Addition for vectors of two elements.
vadd :: (Num a) => (a, a) -> (a, a) -> (a, a)
vadd (s, t) (x, y) = (s + x, t + y)
```

What is the code `(Num a) =>` doing in the signature of `vadd`? What does the
code mean? Let's examine the code bit by bit. The Haskell type [`Num`][num] is a
type class, meaning that `Num` encompasses the usual number types such as `Int`,
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

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/first.hs)
```haskell
-- | An implementation of the function "fst" for lists.
firstB :: [a] -> a
firstB [x, _] = x
```

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

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/first.hs)
```haskell
-- | An implementation of the function "fst" for lists.
firstC :: [a] -> a
firstC (x:xs) = x
```

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

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/first.hs)
```haskell
-- | An implementation of the function "fst" for lists.
firstD :: [a] -> a
firstD []     = error "Empty list"
firstD (x:xs) = x
```

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

[`second.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/second.hs)
```haskell
-- | The second element of a list.
secondA :: [a] -> a
secondA []       = error "Empty list"
secondA [x]      = error "Singleton"
secondA (x:y:xs) = y
```

The pattern `(x:y:xs)` in the above code listing has the following
interpretation. The first element of a list is assigned to the variable `x`, the
second element to `y`, and the rest of the elements (as a sublist) are assigned
to `xs`. However, we are only interested in the second element. We donut, umm...
I mean, do not care about the `x` and the `xs`. Sounds like another job for the
wildcard symbol `_`. Here is a different version of `secondA`.

[`second.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/second.hs)
```haskell
-- | The second element of a list.
secondB :: [a] -> a
secondB []      = error "Empty list"
secondB [x]     = error "Singleton"
secondB (_:x:_) = x
```

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> Provide another implementation of [`not`][not] other than the implementation
shown in the section [Andrew or And-rew?](#andrew-or-and-rew).
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> Use pattern matching to provide an implementation of the boolean operator `&&`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> The package [`Data.Bits`][dataBits] has the method [`xor`][xor] to calculate the
exclusive or (i.e. XOR) of two boolean values. Provide a reimplementation of
`xor`, but use pattern matching.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> Use pattern matching to reimplement the function [`snd`][snd].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 5.</strong> Write a function to implement the addition of vectors of three elements. The
elements of the vectors are integers. You might find the type class
[`Integral`][integral] useful.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 6.</strong> The dot product of two vectors $(a,\, b)$ and $(x,\, y)$ is defined as
<!-- prettier-ignore-end -->

$$
(a,\, b) \cdot (x,\, y)
=
ax + by.
$$

Implement the dot product.

<!-- prettier-ignore-start -->
<strong>Exercise 7.</strong> Implement your own version of the function [`last`][last].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 8.</strong> Implementation your own version of the function [`tail`][tail].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 9.</strong> Implement your own version of the function [`init`][init].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 10.</strong> Write a function that takes a list of integers. If the first integer is odd,
then remove the first element. Otherwise keep the integer.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

[^a]: See the [Haskell 2010 Language Report][haskell2010].

<!--=========================================================================-->

<!-- prettier-ignore-start -->
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

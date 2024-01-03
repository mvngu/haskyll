---
title: ¿Comprende?
math: true
order: 24
---

List comprehension in Haskell and various other languages mimics the set-builder
notation from mathematics. A list comprehension allows us to express, via a
compact notation, solutions to many problems. You might find that sometimes a
list comprehension can replace the job of `map` and/or `filter`.

<!--=========================================================================-->

## Ready, set, list

You want the set of all integers between 1 and 10, inclusive. How would you
write that in mathematical notation? Like so:

$$
\begin{equation}
\label{eqnIntegers1to10}
\{1,\, 2, \dots,\, 10\}
\end{equation}
$$

Now you want to square each integer in the above set. How would you express the
new set in mathematical notation? Use the [set comprehension][setComprehension]
notation, like so:

$$
\begin{equation}
\label{eqnSquares1to10}
\big\{
x^2
\;|\;
x \in \{1,\, 2, \dots,\, 10\}
\big\}
\end{equation}
$$

The vertical bar, or pipe symbol, `|` is read as "such that". Expression
(\ref{eqnSquares1to10}) can be read as, "The set of all $x^2$ such that
$1 \leq x \leq 10$ is an integer." Expression (\ref{eqnIntegers1to10}) can be
reproduced in Haskell via the range notation:

```haskell
ghci> [1, 2 .. 10]
[1,2,3,4,5,6,7,8,9,10]
```

Note the similarity between the previous GHCi session and expression
(\ref{eqnIntegers1to10}).

How are we to reproduce expression (\ref{eqnSquares1to10}) in Haskell? Via the
list comprehension notation, of course. With a little bit of changes, we can
write expression (\ref{eqnSquares1to10}) in Haskell as:

```haskell
ghci> [x^2 | x <- [1, 2 .. 10]]
[1,4,9,16,25,36,49,64,81,100]
ghci> [x^2 | x <- [1 .. 10]]
[1,4,9,16,25,36,49,64,81,100]
```

Compare the above GHCi session and expression (\ref{eqnSquares1to10}). In the
Haskell version, the pipe symbol `|` is also read as "such that". The set
membership symbol $\in$ is replaced with the Haskell keyword `<-`, which means
"drawn from". The code `x <- [1 .. 10]` (also called the generator) is read as,
"The values of `x` are drawn from the list `[1 .. 10]`."

<!--=========================================================================-->

### Components

A list comprehension is a list (err... duh)[^a] that has the following
components:

1. The formula. This specifies the rule from which each element is built. In our
   GHCi session above, the formula is `x^2`. Think of the formula as the
   function definition.
1. The pipe symbol `|`. This separates the formula (on the left) from the
   generator (on the right).
1. The generator. This specifies the values that will be used by the formula to
   construct the list. If we consider the formula as the function definition,
   the generator specifies all valid input for the function. We can have more
   than one generator, but the generators must be separated by commas.
1. The guard. This is a predicate that filters values from the generator(s). The
   filtered values are then passed to the formula. We can have multiple guards,
   but the guards must be separated by commas.

Visualize the components of a list comprehension as follows:

```
[ formula | generators, predicates]
```

With list comprehension, it's like Haskell forces us to be dyslexic. We must
swap around the usual way of defining a function. Previously, we define a
function by specifying its parameters, followed by the function definition. List
comprehension forces us to define the function first, then specify the
parameters.[^b] Hey, don't blame Haskell for the dyslexia. The set comprehension
notation from mathematics does it first. Haskell see, haskell do.

<!--=========================================================================-->

### Examples

Dyslexia or not, list comprehension in Haskell allows us to use a compact
notation that mimics the set comprehension notation from mathematics. If we want
to increment each positive integer, we could use [`map`][map] and a lambda
expression:

```haskell
ghci> take 10 $ map (\x -> x + 1) [1..]
[2,3,4,5,6,7,8,9,10,11]
ghci> map (\x -> x + 1) [1..10]
[2,3,4,5,6,7,8,9,10,11]
```

Or we could use list comprehension:

```haskell
ghci> take 10 [x + 1 | x <- [1..]]
[2,3,4,5,6,7,8,9,10,11]
ghci> [x + 1 | x <- [1..10]]
[2,3,4,5,6,7,8,9,10,11]
```

Being clairvoyant, I know what you will say: "How will I ever use list
comprehension in real life?" Recall the story of [wheat and
chessboard][wheatChessboard] from [an exercise][exerciseWheatChessboard] in the
section [Free range numbers][range]. The solution can be written compactly as
follows:

```haskell
ghci> sum [2^(x-1) | x <- [1..64]]
18446744073709551615
```

Learn your lesson well. Someday a trillionaire might offer you a reward posed in
the form of a similar puzzle.

<!--=========================================================================-->

## Multiple generators

Like a function that has multiple parameters, a list comprehension can have
multiple generators. All we need to do is separate the generators by commas.

Here's a common problem. Construct the [Cartesian product][CartesianProduct] of
two lists. We have two lists `"abc" == ['a', 'b', 'c']` and
`"de" == ['d', 'e']`. The Cartesian product of the lists can be constructed by
nesting a `map` inside another `map`, like so:

```haskell
ghci> map (\x -> map (\y -> [x,y]) "de") "abc"
[["ad","ae"],["bd","be"],["cd","ce"]]
ghci> concat $ map (\x -> map (\y -> [x,y]) "de") "abc"
["ad","ae","bd","be","cd","ce"]
ghci> concatMap (\x -> map (\y -> [x,y]) "de") "abc"
["ad","ae","bd","be","cd","ce"]
ghci> sequence ["abc", "de"]
["ad","ae","bd","be","cd","ce"]
```

The above requires the additional function of [`concat`][concat]. Alternatively,
we could use [`concatMap`][concatMap] as the outer function. Furthermore, we
could use the function [`sequence`][sequence]. The name `sequence` does not lend
itself to Cartesian product, but the definition of `sequence` does indeed yield
a Cartesian product. A list comprehension allows us to clearly express our
intention as follows:

```haskell
ghci> [[x,y] | x <- "abc", y <- "de"]
["ad","ae","bd","be","cd","ce"]
```

Let's compute various points on the [monkey saddle][monkeySaddle]:

```haskell
ghci> [x^3 - 3*x*(y^2) | x <- [1..5], y <- [1..3]]
[-2,-11,-26,2,-16,-46,18,-9,-54,52,16,-44,110,65,-10]
```

In some cases, the order of the generators does matter. Going from left to
right, the second generator can depend on the first. Below, we use the example
of flattening a list of lists to demonstrate that the order of multiple
generators is equivalent to the order of variable declaration.

[`flatten.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/flatten.hs)
```haskell
-- | Flatten a list of lists.
flat :: [[a]] -> [a]
flat xs = [x | ys <- xs, x <- ys]
```

<!--=========================================================================-->

## Wild thing

> Wild thing\
> You make my heart sing\
> --- Chip Taylor, "Wild Thing", performed by The Troggs, 1966

Recall that the wildcard symbol `_` allows us to ignore various elements. In the
section [Tuple-ware][tupleWare], we implemented the function [`fst`][fst] as
follows:

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/decide/first.hs)
```haskell
-- | A reimplementation of the function "fst".
firstA :: (a, b) -> a
firstA (x, _) = x
```

Below, we use the wildcard `_` to implement a version of `fst` that extracts the
first elements in a list of 2-tuples.

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/first.hs)
```haskell
-- | The first elements in a list of 2-tuples.
first :: [(a, b)] -> [a]
first xs = [x | (x, _) <- xs]
```

Here's a version of [`snd`][snd] that extracts the second elements in a list of
2-tuples:

[`first.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/first.hs)
```haskell
-- | The second elements in a list of 2-tuples.
second :: [(a, b)] -> [b]
second xs = [y | (_, y) <- xs]
```

<!--=========================================================================-->

## Guards, guards!

> _Sheriff of Rottingham:_ So, it's come to this, has it? A fight to the death.
> Mano a mano, man to man. Just you and me and my _guards_!\
> --- _Robin Hood: Men in Tights_, 1993

Sometimes we do not want all values from a generator. Rather, we want some
values that interest us. Whereas the wildcard symbol `_` allows us to ignore a
bunch of values without regard to their particular values, we want a way to
ignore values based upon the particular values. That sounds like a guarded
equation. A guard can be added to a list comprehension to help us filter values
from a generator. For this reason, a guard in a list comprehension is also
considered to be a predicate.

What if I tell you that the product of two odd integers is another odd integer?
"No way!" I hear you say. "Show me." Here is the square of the first 10
positive, odd integers:

```haskell
ghci> take 10 $ [x^2 | x <- [1,3..]]
[1,9,25,49,81,121,169,225,289,361]
ghci> take 10 $ [x^2 | x <- [1..], odd x]
[1,9,25,49,81,121,169,225,289,361]
```

Do you find it a chore to manually look for all positive factors of an integer?
Not good at mathematics? There must be an easier way! Let the List Comprehension
2000 and its add-on Guard 3000 do the work for you:

```haskell
ghci> [x | x <- [1..10], mod 10 x == 0]
[1,2,5,10]
ghci> [x | x <- [1..42], mod 42 x == 0]
[1,2,3,6,7,14,21,42]
ghci> [x | x <- [1..57], mod 57 x == 0]
[1,3,19,57]
ghci> [x | x <- [1..61], mod 61 x == 0]
[1,61]
```

Remember the [exercise][exercisePythagoreanTriple] on [Pythagorean
triples][pythagoreanTriple] from the section [Free range numbers][range]? A list
comprehension, accompanied by a guard, can be used to generate all Pythagorean
triples not exceeding a given limit. Feast your eyes on this:

[`triple.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/solution/triple.hs)
```haskell
-- | Brute force method to generate Pythagorean triples.  This
-- implementation uses list comprehension.
bruteC :: Integer -> [[Integer]]
bruteC n = do
    let ell = [1 .. n] :: [Integer]
    let triple = sequence [ell, ell, ell]
    [[x, y, z] | [x, y, z] <- triple, x ^ 2 + y ^ 2 == z ^ 2]
```

The definition of `bruteC` shows that, within a generator of a list
comprehension, we can destructure a list. We use the function
[`sequence`][sequence] to construct the Cartesian product of three copies of
`[1 .. n]`, yielding the list `triple` where each element is itself a list of
the form `[a, b, c]`. In the generator `[x, y, z] <- triple`, we destructure
each element `[a, b, c]` of `triple`. Finally, we use the predicate
`x ^ 2 + y ^ 2 == z ^ 2` to filter each trio of numbers that form a Pythagorean
triple.

One guard is not enough. Let's beef up security by employing more guards. Below,
we multiply an integer that is divisible by 3 with an integer that is divisible
by 4.

```haskell
ghci> take 5 $ [x*y | x <- [1..99], y <- [1..99], mod x 3 == 0, mod y 4 == 0]
[12,24,36,48,60]
ghci> take 5 $ [x*y | x <- [3,6..], y <- [4,8..]]
[12,24,36,48,60]
```

Are you in a hurry? Want to talk fast without those pesky vowels? Say no more.
Remove vowels as follows:

```haskell
ghci> strA = "The five boxing wizards jump quickly."
ghci> strB = "Mr Jock, TV quiz PhD, bags few lynx."
ghci> strC = "Pack my box with five dozen liquor jugs."
ghci> [s | s <- strA, s `notElem` "aeiou"]
"Th fv bxng wzrds jmp qckly."
ghci> [s | s <- strB, s `notElem` "aeiou"]
"Mr Jck, TV qz PhD, bgs fw lynx."
ghci> [s | s <- strC, s `notElem` "aeiou"]
"Pck my bx wth fv dzn lqr jgs."
```

<!--=========================================================================-->

[^a]:
    No way! I thought a list comprehension meant whether I could understand
    someone who has a lisp.

[^b]:
    The phenomenon is not unique to Haskell. Erlang, Julia, Python, R, and some
    other languages are afflicted with the dyslexia known as list comprehension.
    Julia and her dyslexic friends need to consult a speech therapist before
    they develop a Lisp.

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> How many ways are there to choose a string where the first character is from
`"ab"`, the second character is from `"cde"`, and the third character must be
from `"fghij"`?
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> In the script
[`flatten.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/list/flatten.hs)
from the section [Multiple generators](#multiple-generators), swap around the
order of the generators. Compile the modified script. Describe what
happens. Explain why you got the result.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> Use list comprehension to rewrite the function `size` from the script
[`length.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/length.hs)
in the section [Length of list][listLength].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> Use list comprehension to implement the function `add` from the script
[`add.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/recurse/add.hs)
in the section [Triangular numbers](../recurse_example/#triangular-numbers).
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 5.</strong> Let $n > 0$ be an odd integer. Write a program to determine two non-negative
integers $a$ and $b$ such that $a^2 - b^2 = n$. Provide an implementation that
uses list comprehension and another implementation that does not use list
comprehension.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 6.</strong> Use list comprehension to determine all positive factors of an integer $n > 0$.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 7.</strong> Repeat the following exercises from the section [Free range numbers][range], but
use list comprehension:
<!-- prettier-ignore-end -->

1. [Number phobia][phobiaExercise] in various cultures.
1. [Least multiple][multipleExercise] of a bunch of integers.
1. [Sieve of Eratosthenes][sieveExercise] for generating prime numbers.

<!-- prettier-ignore-start -->
<strong>Exercise 8.</strong> Use list comprehension to implement the functions [`zip`][zip] and
[`unzip`][unzip].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 9.</strong> In this exercise, you will explore a property of prime numbers.
<!-- prettier-ignore-end -->

1. Use list comprehension to generate all prime numbers not exceeding a given
   limit.
1. Two prime numbers $a$ and $b$, with $a < b$, are said to be [twin
   prime][twinPrime] if $b - a = 2$. Generate a list of the first 100 twin
   primes.

<!-- prettier-ignore-start -->
<strong>Exercise 10.</strong> The table below lists some English words that are of [Norse origin][NorseOrigin].
<!-- prettier-ignore-end -->

| A     | B       | C       | D      | F       |
| ----- | ------- | ------- | ------ | ------- |
| ado   | bait    | crawl   | dangle | fellow  |
| aloft | bark    | crochet | die    | fjord   |
| anger | berserk | crotch  | dregs  | flaunt  |
| auk   | bylaw   | crouch  | droop  | freckle |

Write a program to determine the number of unique vowels each word uses. Provide
an implementation that uses list comprehension, and another implementation that
does not use list comprehension.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[CartesianProduct]: https://web.archive.org/web/20240101123445/https://en.wikipedia.org/wiki/Cartesian_product
[concat]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:concat
[concatMap]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:concatMap
[exercisePythagoreanTriple]: ../list_range/#exPythagoreanTriple
[exerciseWheatChessboard]: ../list_range/#exWheat
[fst]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fst
[length]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:length
[listLength]: ../recurse_example/#length-of-list
[map]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:map
[monkeySaddle]: https://web.archive.org/web/20240101130822/https://en.wikipedia.org/wiki/Monkey_saddle
[multipleExercise]: ../list_range/#exBunchMultiples
[NorseOrigin]: https://web.archive.org/web/20231213102223/https://en.wikipedia.org/wiki/List_of_English_words_of_Old_Norse_origin
[phobiaExercise]: ../list_range/#exPhobias
[pythagoreanTriple]: https://web.archive.org/web/20231216161203/https://en.wikipedia.org/wiki/Pythagorean_triple
[range]: ../list_range/
[sequence]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:sequence
[setComprehension]: https://web.archive.org/web/20240101064912/https://en.wikipedia.org/wiki/Set-builder_notation
[sieveExercise]: ../list_range/#exEratosthenes
[snd]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:snd
[tupleWare]: ../decide_pattern/#tuple-ware
[twinPrime]: https://web.archive.org/web/20231228221149/https://en.wikipedia.org/wiki/Twin_prime
[unzip]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:unzip
[wheatChessboard]: https://web.archive.org/web/20231223072100/https://en.wikipedia.org/wiki/Wheat_and_chessboard_problem
[zip]: https://web.archive.org/web/20240101125300/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:zip
<!-- prettier-ignore-end -->

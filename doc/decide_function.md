---
title: Simple functions
math: true
---

We have been using functions all along. Remember the functions `main`, `printf`,
and `putStrLn`? In this section, we will discuss the components of a simple
function. In particular, we will discuss how to declare a function, how to
define our own functions, and draw some analogies with mathematical functions
and expressions.

<!--=========================================================================-->

## Affix your signature here

A fan upon meeting their favourite celebrity might enquire, "Can I have your
autograph?" You, too, should ask the same question of any Haskell function you
care to use (or abuse). Maybe not autograph, but rather the signature of a
function. The signature (or type signature) of a simple function has the
following syntax:

```haskell
funcName :: InputType -> OutputType
```

The first part of a simple function signature is the function name, which should
be written in lower camel case like so, `bestNameEver`. Next comes the "has
type" symbol `::`. To the right of the symbol `::` is the type of the function.
In Haskell, the name of a type must be in upper camel case like so,
`YoureMyType`. Going from left to right, the first type name is the name of the
input type or the data type of the function's parameter. The second type name
specifies the type of the output of the function. The right arrow symbol `->`
means "is mapped to". The notation `InputType -> OutputType` can be read as, "a
value of type `InputType` is mapped to a value of type `OutputType`". The type
of the function is `InputType -> OutputType`.

A little birdie told me that you like mathematics. Here goes. The signature of a
Haskell function mirrors the function notation in mathematics. If a function $f$
maps values from a set $A$ to values from a set $B$, then we would write the
function as $f : A \to B$. The symbol $f$ is the name of the function, our input
comes from the set $A$, and the output of $f$ is a value from the set $B$. Why
does Haskell use the symbol `::` instead of the symbol `:` like in mathematics
when writing the signature of a function? Haskell reserves the symbol `:` as an
operator for prepending an element to a list.

Let's apply the above theory to help us understand some of the functions (or
methods) we have used in previous sections and chapters. Recall from the section
[The package `Data.Char`](../data_string/#the-package-datachar) that the package
[`Data.Char`][dataChar] has the function [`isNumber`][isNumber], whose signature
is

```haskell
isNumber :: Char -> Bool
```

The function `isNumber` takes a value of type `Char` as its parameter and
outputs a value of type `Bool`, essentially telling us whether or not a
character represents a numeric digit. The type of `isNumber` is `Char -> Bool`.
We have been using the function [`putStrLn`][putStrLn] for some time now. Let's
examine its signature:

```haskell
putStrLn :: String -> IO ()
```

The function `putStrLn` takes a string as its input and outputs a value of type
`IO ()`. Without being distracted by minutiae, let's just say that the output of
`putStrLn` goes to standard output, i.e. the terminal.

<!--=========================================================================-->

## DIY

Enough of pre-defined functions. Let's define a function of our own. The
function takes an integer as input and outputs the same integer, but with the
sign flipped. The integer 2 would become $-2$ and $-42$ would become 42. See
below for the signature of our function together with its definition.

:include: file="assets/src/decide/negate.hs", name="negate.hs"

I can hear you protest, "But the Haskell library already has its own function to
reverse the sign of a number. It's the function [`negate`][negate]." OK. Let's
define a function that takes a string and converts the first character of the
string to uppercase. This is different from the library function
[`toUpper`][toUpper] in that our function has a string as input and outputs a
string. It's true, honest. Have a look.

:include: file="assets/src/decide/upper.hs", name="upper.hs"

<!--=========================================================================-->

## I `do`

We have been defining one-liner functions. How about a function whose definition
spans multiple lines? We want a function that takes a string and removes the
first and last characters of the string. The result is then reversed and we
capitalize the resulting string. How would we do that? Do it like how we have
been defining the function `main`, i.e. use the keyword `do`.

:include: file="assets/src/decide/chop.hs", name="chop.hs"

<!--=========================================================================-->

## Multiple parameters

We have already used many functions that take more than a single parameter. The
various arithmetic operators are binary in that each requires two parameters.
The mathematical methods [`compare`][compare], [`div`][div], and [`mod`][mod]
each takes two parameters, so does the string function [`splitAt`][splitAt].
Let's implement our own function to calculate the maximum of two integers.
Consider the code below.

:include: file="assets/src/decide/max.hs", name="max.hs"

You might have noticed several issues regarding the above definition of the
function `maxInt`. First, why are there two right arrow symbols `->` in the
signature of the function? The type of `maxInt` is
`Integer -> Integer -> Integer`. This means that, going from left to right in
the signature, `maxInt` takes a value of type `Integer` and another value of
type `Integer`, then outputs a value of type `Integer`. You can think of the
first two type names, i.e. `Integer -> Integer`, as declaring the types of the
parameters of `maxInt`. Second, why the lack of a `do` block despite the
definition of `maxInt` spanning multiple lines? Recall from the section
[I can't decide](../decide_conditional/) that the construct `if...then...else`
is a conditional expression. The Haskell compiler will treat such construct as
an expression even if you indent the `then` and `else` clauses on separate
lines. Third, why define our own function to calculate the maximum of two
integers when the standard Haskell library already has the functions
[`max`][max] and [`maximum`][maximum]? We define our own version of the standard
library functions as a learning exercise.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[compare]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:compare
[dataChar]: https://web.archive.org/web/20231202081418/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
[div]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:div
[isNumber]: https://web.archive.org/web/20231202081418/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html#v:isNumber
[max]: https://web.archive.org/web/20231201225313/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:max
[maximum]: https://web.archive.org/web/20231201225313/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:maximum
[mod]: https://web.archive.org/web/20231201225313/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:mod
[negate]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:negate
[putStrLn]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:putStrLn
[splitAt]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:splitAt
[toUpper]: https://web.archive.org/web/20231128120029/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html#v:toUpper
<!-- prettier-ignore-end -->

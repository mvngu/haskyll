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

<!-- prettier-ignore-start -->
[dataChar]: https://web.archive.org/web/20231202081418/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
[isNumber]: https://web.archive.org/web/20231202081418/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html#v:isNumber
[putStrLn]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:putStrLn
<!-- prettier-ignore-end -->

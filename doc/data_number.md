---
title: Here's my number
math: true
---

> Numbers in Haskell are complicated because in the Haskell world there are many
> different kinds of number...\
> --- Richard Bird, _Thinking Functionally with Haskell_[^a]

Haskell represents a number in one of several ways, depending on the kind of
number you are dealing with. Is the number an integer? Haskell has the types
[`Int`][int] and [`Integer`][integer] to represent an integer. Is the number a
floating-point number? Use the types [`Float`][float] and [`Double`][double] to
represent floating-point numbers. In this section, we consider how Haskell
represents and parses integers. The discussion on floating-point numbers is
deferred to the section [Does it sink or float?](../data_float/).

<!--=========================================================================-->

## The type `Int`

Haskell represents integers via the types [`Int`][int] and [`Integer`][integer].
The type `Int` represents a fixed-precision integer. An integer represented as
the type `Int` has a minimum value at least $-2^{29}$ and a maximum value at
least $2^{29} - 1$. The exact range depends on the implementation. Use
[minBound][minBound] and [maxBound][maxBound] to check the exact range for your
platform. On my computer, the exact range of `Int` is given as:

```haskell
ghci> minBound :: Int
-9223372036854775808
ghci> maxBound :: Int
9223372036854775807
ghci>
```

What is that double colon symbol `::` in the above GHCi session? In Haskell, the
symbol `::` can be read as "has type". The symbol `::` is Haskell's way of
implementing type annotation, a way to associate an expression with a type. In
the above GHCi session, the line `minBound :: Int` can be read as, "`minBound`
has type `Int`".

<!--=========================================================================-->

### Polymorphism

The method [`minBound`][minBound] is [polymorphic][polymorphism]. The specific
version of `minBound` that is executed depends on the type. The method
`minBound` belongs to the class [`Bounded`][bounded]. A class derived from
`Bounded` should have its own implementation of `minBound`. The type
[`Int`][int] happens to be derived from `Bounded` and has its own implementation
of `minBound`. When you call `minBound` without any type annotation, the
compiler (or GHCi) might find it difficult to infer the type information from
context alone. However, annotating `minBound` with the type `Int` helps the
compiler (or GHCi) to execute the version of `minBound` implemented for `Int`.

<!--=========================================================================-->

### Integer overflow

Since [`Int`][int] represents fixed-precision integers, there is always the
possibility of integer overflow. The following GHCi session demonstrates the
issue.

```haskell
ghci> k = (minBound :: Int)
ghci> n = (maxBound :: Int)
ghci> :type k
k :: Int
ghci> :type n
n :: Int
ghci> k
-9223372036854775808
ghci> k - 1
9223372036854775807
ghci> n
9223372036854775807
ghci> n + 1
-9223372036854775808
```

The GHCi command [`:type`][type] allows you to obtain information about the type
of an expression. We used the command to confirm that the variables `k` and `n`
both have the type `Int`.

<!--=========================================================================-->

### Arithmetic operations

The above GHCi session also shows that [`Int`][int] supports integer addition
and subtraction. What about integer multiplication?

```haskell
ghci> a = (4 :: Int)
ghci> b = (2 :: Int)
ghci> c = a * b
ghci> :type c
c :: Int
ghci> c
8
```

So far so good. What about integer division? We know that $4 / 2 = 2$. Let's use
Haskell to confirm our result.

```haskell
ghci> a = (4 :: Int)
ghci> b = (2 :: Int)
ghci> a / b

<interactive>:3:3: error:
    • No instance for (Fractional Int) arising from a use of ‘/’
    • In the expression: a / b
      In an equation for ‘it’: it = a / b
```

What is going on here? The type `Int` does not support integer division? In
fact, the type `Int` does support integer division. You just need to use the
right method for the job. The operator [`/`][fracDiv] is a method implemented
for data of type [`Fractional`][fractional], not data of type `Int`. Observe the
next GHCi session:

```haskell
ghci> :type (/)
(/) :: Fractional a => a -> a -> a
```

The part `(/) :: Fractional` means that `/` is defined for data of type
`Fractional`. Do not worry about the rest of the above line. We will discuss it
in the section [Prefix notation](#prefix-notation).

You must use the method [`div`][div] for integer division because that method
would give you the quotient when dividing an integer by another integer.
Alternatively, use the method [`quot`][quot] to make it clear that your
intention is to obtain the quotient when dividing one integer by another
integer. Observe the following GHCi session.

```haskell
ghci> a = (5 :: Int)
ghci> b = (4 :: Int)
ghci> c = (2 :: Int)
ghci> div a c
2
ghci> div b c
2
ghci> quot a b
1
```

<!--=========================================================================-->

### Prefix notation

The latter GHCi session brings up one issue. Why did we write the code `div a c`
to divide `a` by `c`? Functions and methods in Haskell are called using
[prefix][prefix] notation. In languages such as C, JavaScript, or Python if you
define a function named `div` that takes two arguments `a` and `c`, you would
use the function like so: `div(a, c)`. This is prefix notation. Haskell uses
prefix notation, but dispenses with the parentheses. The Haskell code `div a c`
means: apply the method (or function) `div` to the arguments `a` and `c`. Let's
use the GHCi command [`:type`][type] to show the signature (or declaration) of
`div`.

```haskell
ghci> :type div
div :: Integral a => a -> a -> a
```

We have seen the symbol `=>` before in the section
[Arithmetic operations](#arithmetic-operations). The symbol `=>` separates two
parts of the signature of `div`. Everything to the left of `=>`, excluding the
segment `div ::`, is a constraint on the type of data on which `div` can
operate. The segment `Integral a` means that `div` can work with any data `a`
that has type [`Integral`][integral]. The type `Int` happens to be based on
`Integral`, as can be seen in the GHCi session below. Search for the line
`instance Integral Int`.

```haskell
ghci> :info Int
type Int :: *
data Int = GHC.Types.I# GHC.Prim.Int#
    -- Defined in ‘GHC.Types’
instance Bounded Int -- Defined in ‘GHC.Enum’
instance Read Int -- Defined in ‘GHC.Read’
instance Enum Int -- Defined in ‘GHC.Enum’
instance Integral Int -- Defined in ‘GHC.Real’
instance Num Int -- Defined in ‘GHC.Num’
instance Real Int -- Defined in ‘GHC.Real’
instance Show Int -- Defined in ‘GHC.Show’
instance Eq Int -- Defined in ‘GHC.Classes’
instance Ord Int -- Defined in ‘GHC.Classes’
```

The information from the above two GHCi sessions says that you can use `div` for
integer division when the number is of type `Int`. Phew! So many words to
express a simple idea.

What about everything to the right of the symbol `=>`? The right-hand side of
`=>` tells you two pieces of information.

1. First, `div` takes two parameters of the same type. That is what the first
   two `a`s in `a -> a -> a` means.
1. Second, `div` returns a result of the same type as its parameters. That is
   what the last (or rightmost) `a` means in `a -> a -> a`.

<!--=========================================================================-->

### Infix notation

The common arithmetic operators such as `+` (addition), `-` (subtraction), `/`
(division), and `*` (multiplication) can be used by means of infix notation.
Take for example the operator `+`. This operator requires two arguments. You
write its first argument, followed by the operator `+`, and finally write the
second argument. We have seen infix notation already in the section
[Arithmetic operations](#arithmetic-operations). Refer to the following GHCi
session to refresh your memory.

```haskell
ghci> a = (6 :: Int)
ghci> b = (2 :: Int)
ghci> a + b
8
ghci> a - b
4
ghci> a * b
12
ghci> a `div` b
3
```

Hang on. Why is the method [`div`][div] being used via infix notation? More
importantly, how did we call `div` (a prefix method) via infix notation? In
general, a prefix method or function can be called via infix notation. All you
have to do is use the backtick character, i.e. \`, to delimit the method or
function name. The method [`quot`][quot] can also be used via infix notation
like so:

```haskell
ghci> a = (6 :: Int)
ghci> b = (4 :: Int)
ghci> quot a b
1
ghci> a `quot` b
1
```

A method or function that is normally called via prefix notation can be called
via infix notation. What about the other way around? If an operator is normally
used via infix notation, how can we use it via prefix notation? We surround the
operator with parentheses, as shown in the next GHCi session.

```haskell
ghci> a = (7 :: Int)
ghci> b = (3 :: Int)
ghci> a + b
10
ghci> (+) a b
10
ghci> a - b
4
ghci> (-) a b
4
ghci> a * b
21
ghci> (*) a b
21
```

<!--=========================================================================-->

## The type `Integer`

> _Daniel Jackson:_ Sorry, you're not my type, and I'm more than a little
> disturbed to think I might be yours.\
> --- _Stargate SG-1_, season 8, episode 12 "Prometheus Unbound", 2005

In contrast to [`Int`][int], the type [`Integer`][integer] represents arbitrary
precision integers. Your integer can be as large or small as you want, subject
to the available RAM of your computer. The following GHCi session demonstrates
that `Integer` can represent integers much larger (or smaller) than those
representable by `Int`. The caret symbol `^` means exponentiation.

```haskell
ghci> minBound :: Int
-9223372036854775808
ghci> maxBound :: Int
9223372036854775807
ghci> k = (-9223372036854775808 :: Integer)
ghci> n = (9223372036854775807 :: Integer)
ghci> k - n
-18446744073709551615
ghci> k * n
-85070591730234615856620279821087277056
ghci> n + n
18446744073709551614
ghci> n^3
784637716923335095224261902710254454442933591094742482943
```

Like [`Int`][int], the division operator `/` does work with data of type
[`Integer`][integer]. You can use the methods [`div`][div] or [`quot`][quot] for
integer division on data of type `Integer` because `Integer` is based on the
type [`Integral`][integral]. Here's the relevant information from GHCi. The line
`instance Integral Integer` means that `Integer` is based on `Integral`.

```haskell
ghci> :info Integer
type Integer :: *
data Integer
  = GHC.Num.Integer.IS GHC.Prim.Int#
  | GHC.Num.Integer.IP GHC.Prim.ByteArray#
  | GHC.Num.Integer.IN GHC.Prim.ByteArray#
    -- Defined in ‘GHC.Num.Integer’
instance Read Integer -- Defined in ‘GHC.Read’
instance Enum Integer -- Defined in ‘GHC.Enum’
instance Integral Integer -- Defined in ‘GHC.Real’
instance Num Integer -- Defined in ‘GHC.Num’
instance Real Integer -- Defined in ‘GHC.Real’
instance Show Integer -- Defined in ‘GHC.Show’
instance Eq Integer -- Defined in ‘GHC.Num.Integer’
instance Ord Integer -- Defined in ‘GHC.Num.Integer’
ghci> :type div
div :: Integral a => a -> a -> a
ghci> :type quot
quot :: Integral a => a -> a -> a
```

<!--=========================================================================-->

### Syntactic sugar

> _Child:_ [Playing in the rain.]\
> _Mother:_ Come inside, sweetie. Sugar melts in the rain.

Here is a simple question. How would you negate a number? One way is to multiply
the number by $-1$. If the number appears within a mathematical expression, you
could prefix the number with the minus sign `-`. Some programming languages
allow you to prefix a number with the symbol `-` to indicate negation. Haskell
allows you to do so as well.

```haskell
ghci> -2
-2
```

So far so good. The expression $3 \times -2$ evaluates to $-6$. Python gives the
result:

```python
>>> 3 * -2
-6
```

JavaScript produces:

```js
console.log(3 * -2); //-> -6
```

And finally, here is Ruby:

```rb
puts 3 * -2 #-> -6
```

Haskell complains when we enter the same expression into GHCi.

```haskell
ghci> 3 * -2

<interactive>:1:1: error:
    Precedence parsing error
        cannot mix ‘*’ [infixl 7] and prefix `-' [infixl 6] in the same infix expression
```

However, the expression $-2 \times 3$ produces the correct result.

```haskell
ghci> -2 * 3
-6
```

The reason is that, in Haskell, `-2` is syntactic sugar for `negate 2`. We have
seen syntactic sugar before in the section [Infix notation](#infix-notation),
where we discussed backticks as a way to use a method or function in infix
notation. Recall that integer division can be written as:

```haskell
ghci> a = (8 :: Integer)
ghci> b = (3 :: Integer)
ghci> div a b -- prefix notation
2
ghci> a `div` b -- infix notation
2
```

Haskell treats

```haskell
a `div` b
```

as syntactic sugar for `div a b`.

As its name implies, the method [`negate`][negate] produces the negation of its
argument. In effect, the method takes a number and multiplies its argument by
$-1$. For Haskell to evaluate the expression $3 \times -2$ to $-6$, we must
surround $-2$ within parentheses like so: $3 \times (-2)$. The symbol `-` in the
expression $3 \times -2$ is parsed as the subtraction operator and Haskell
assumes we are using the subtraction operator in infix notation. On the other
hand, Haskell has no problem parsing expressions such as `3 * negate 2` or
$-2 \times 3$. Both yield the same, correct result. Keep the above quirks in
mind to prevent unexpected results in your programs or compilation errors.

<!--=========================================================================-->

### Printing numbers

Let's learn some facts about Tabby the cat. Tabby is currently one year old. The
Haskell program below shows Tabby's age after a given number of years.

:include: file="assets/src/data/age.hs", name="age.hs"

Running the program shows:

```sh
$ ghc age.hs
[1 of 2] Compiling Main             ( age.hs, age.o )
[2 of 2] Linking age
$ ./age
Tabby's age: 1
In 3 years time, Tabby will be: 4
```

<!-- prettier-ignore-start -->
The file
:script: file="assets/src/data/age.hs", name="age.hs"
shows a few new concepts.  Let's tackle each idea in turn:
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
-   The keyword `do`. This keyword allows you to string a sequence of actions
    together, one action per line. Indentation is important[^b] and allows the
    Haskell compiler to figure out whether a line of code is within, or outside
    of, the `do` block. The keyword `do` is syntactic sugar that allows you to
    write clean and readable Haskell code.
-   The keyword `let`. Normally, you would assign a value to a variable like so:
    `num = 42`. Inside a `do` block, you must prefix each assignment operation
    with the keyword `let`. Within a `do` block, you would write `let num = 42`
    instead of `num = 42`.
-   The operator [`++`][plusplus]. This operator allows you to concatenate two
    strings.[^c]
-   The method [`show`][show]. This method converts a value to a string. In the
    program
    :script: file="assets/src/data/age.hs", name="age.hs"
    the variable `age` has type `Integer` and cannot be concatenated with the
    string `"Tabby's age: "`. We use `show` to convert the value of `age` to a
    string. The operator `++` can then concatenate the strings on its left- and
    right-hand sides.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

## Exercises

:exercise: Load GHCi and type in [`minBound`][minBound] (or
[`maxBound`][maxBound]) at the prompt. What does GHCi show? Why do you think
GHCi shows such output?

:exercise: Determine the exact range of [`Int`][int] on your computer. An
integer represented by the type [`Int`][int] has a minimum and maximum values of
at least $-2^{29}$ and $2^{29} - 1$, respectively. Use Haskell to obtain the
actual digits in each of the latter two numbers.

:exercise: The GHCi command [`:type`][type] shows the type information of an
expression. A similar command is [`:info`][info]. Read up on the latter command.

:exercise: Use [`:type`][type] to show the signature of the method
[`quot`][quot]. Explain what the signature of `quot` means.

:exercise: Enter the code `minBound :: Integer` at the prompt of GHCi. What does
GHCi say? Why do you get that result? Repeat the exercise for the code
`maxBound :: Integer`.

:exercise: The methods [`div`][div] and [`quot`][quot] both perform integer
division, but their results can be different. Use each method to perform integer
division with the following types of integers:

1. Positive and positive.
1. Positive and negative.
1. Negative and positive.
1. Negative and negative.
1. Zero and positive (or negative).
1. Positive (or negative) and zero.

:exercise: The method [`mod`][mod] returns the integer remainder when one
integer is divided by another integer. How many whole weeks are there in three
years? How many left over days that do not make up a whole week? Use GHCi to
perform your calculation.

<!-- prettier-ignore-start -->
:exercise: Rewrite the program
:script: file="assets/src/data/age.hs", name="age.hs"
without using string concatenation.
<!-- prettier-ignore-end -->

:exercise: Write a program to print your name, age, and special talent. Each
piece of information should be on a separate line.

:exercise: We had a cursory discussion of [syntactic sugar](#syntactic-sugar) in
this section. [This page][sugarList] has a list of syntactic sugar in Haskell.
For in-depth discussion, see [this page][sugarBrief], [this][sugarTips], or
[here][sugarCons].

<!--=========================================================================-->

[^a]:
    Richard Bird. _Thinking Functionally with Haskell_. Cambridge University
    Press, 2015, p.49.

[^b]: Like in Python.
[^c]:
    Languages such as JavaScript, Python, and Ruby use the operator `+` to
    concatenate strings. Haskell uses the operator `++` for the same effect.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[bounded]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Bounded
[div]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:div
[double]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Double
[float]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Float
[fracDiv]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-47-
[fractional]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Fractional
[info]: https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html#ghci-cmd-:info
[int]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[integer]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integer
[integral]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Integral
[maxBound]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:maxBound
[minBound]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:minBound
[mod]: https://web.archive.org/web/20231201225313/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:mod
[negate]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:negate
[plusplus]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-43--43-
[polymorphism]: https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
[prefix]: https://en.wikipedia.org/wiki/Polish_notation
[quot]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:quot
[show]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:show
[sugarBrief]: https://wiki.haskell.org/Syntactic_sugar
[sugarCons]: https://wiki.haskell.org/Syntactic_sugar/Cons
[sugarList]: https://en.wikibooks.org/wiki/Haskell/Syntactic_sugar
[sugarTips]: https://wiki.haskell.org/Haskell_programming_tips
[type]: https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html#ghci-cmd-:type
<!-- prettier-ignore-end -->

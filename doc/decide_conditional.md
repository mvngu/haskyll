---
title: I can't decide
math: true
---

> _Donald:_ I don't know whether I want to, or not!\
> _Prof. Batty:_ That is a problem to be decided by Flipism! Heads, you do! Tails,
> you don't! [Tosses a coin.] It came down heads! Here is your book---your membership
> button! You owe me a buck!\
> --- Carl Barks. "Flip Decision" in _Walt Disney's Comics and Stories_, volume
> 13, issue 5, 1953

How many times do you find yourself unable to make up your mind about something?
Take the manual work out of decision making and let Haskell automate it for you.
Haskell provides various ways to help you construct a program that branches into
several paths, depending on whichever choice you make. The techniques are not
guaranteed to cure you of indecision, but at least make it seem like your
program knows when to be resolute.

<!--=========================================================================-->

## Conditional `if...then...else`

Sam is writing a small program to remind her of Tabby's Friday special treat.
Tabby the cat likes to eat sardine. Once a week, Sam would feed Tabby a small
can of sardine on Friday. Tabby would receive her usual, scheduled meal if it is
not time for sardine. Sam translates the above logic into Haskell code as
follows.

:include: file="assets/src/decide/sardine.hs", name="sardine.hs"

The above code uses an expression we have not seen before, i.e. the conditional
expression `if...then...else`. A Haskell conditional expression can be written
as the following structure.

```haskell
if condition
    then runCode
    else runOtherCode
```

<!-- prettier-ignore-start -->
!["if..then...else"](decide/if-then-else.png "if...then...else")
_Control flow of `if...then...else`._
<!-- prettier-ignore-end -->

The conditional expression can be visualized as per the image above. The
`condition` must be an expression that evaluates to a boolean value. If
`condition` evaluates to `True`, control jumps to the `then` clause and the
expression `runCode` is evaluated. In case `condition` evaluates to `False`,
control jumps to the `else` clause and the expression `runOtherCode` is
evaluated. Unlike some programming languages, Haskell requires the `else`
clause. For this reason, the Haskell conditional expression is similar to the
ternary operator in languages such as C, JavaScript, and Python. Observe the
GHCi session below.

```haskell
ghci> import Data.Char
ghci> putStrLn $ if isAlpha 'a' then "alphabetic" else "not alphabetic"
alphabetic
```

The whole `if...then...else` construct must result in a value. In particular,
each of the `then` and `else` clauses must result in a value. The value of each
clause must be of the same type. For example, if the `then` clause results in a
value of type `Integer`, the `else` clause must also result in a value of type
`Integer`.

<!-- prettier-ignore-start -->
Let's use the above explanation of the conditional expression to understand how
the program
:script: file="assets/src/decide/sardine.hs", name="sardine.hs"
works. The condition is the expression `today == sardineDay`. Since the
condition evaluates to `True`, control jumps to the `then` clause where we have
the expression `"sardine"`. This expression is merely a string. The result of
the `then` clause is the string `"sardine"`, which is assigned to `meal`. I know
this is redundant, but assume for the sake of argument that the condition
`today == sardineDay` evaluates to `False`. In that case, control would jump to
the `else` clause, where we have the expression `"other scheduled meal"`. Both
expressions in the `then` and `else` clauses evaluate to the same type, i.e.
`String`. The whole conditional expression evaluates to a value of type
`String`. That value, whether it be from the `then` or `else` clause, is
assigned to `meal`. Why the lack of an explicit return statement? As noted
above, Haskell's conditional expression is analogous to the ternary operator in
some other programming languages.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

## Boolean chain

> _Audience:_ Boooo...\
> _Mr. Burns:_ Smithers. Are they booing me?\
> _Smithers:_ Aahh... no. They're saying, "Boo-urns, boo-urns."\
> --- _The Simpsons_, season 6, episode 18, 1995

<!-- prettier-ignore-start -->
The condition in an `if...then...else` expression must evaluate to a boolean
value. It makes sense that the condition can be a chain of boolean expressions,
connected via one or more boolean operators `||` and/or `&&`. For instance,
although Friday is sardine day for Tabby, Sam only feeds sardine to Tabby during
the afternoon. With the latter finer detail, Sam modifies the program
:script: file="assets/src/decide/sardine.hs", name="sardine.hs"
as follows.
<!-- prettier-ignore-end -->

:include: file="assets/src/decide/sardine-time.hs", name="sardine-time.hs"

<!--=========================================================================-->

## Nested `if...then...else`

> _Baby doll:_ Help! I'm trapped in a matryoshka doll set.

In Haskell, conditional expressions can be nested within one another, like in
languages such as C, JavaScript, and Python. For example, two integers $a$ and
$b$ satisfy one of the following relations:

-   $a > b$
-   $a < b$
-   $a = b$

The above can be translated into Haskell code as:

:include: file="assets/src/decide/nested.hs", name="nested.hs"

<!--=========================================================================-->

## A `do` block within `if...then...else`

Recall from the section [Printing numbers](../data_number/#printing-numbers)
that a `do` block allows you to perform a sequence of actions. You typically use
a `do` block in the function `main` to denote all code in that function.[^a] A
`do` block can be used in a `then` or `else` clause to allow you to perform
multiple actions specific to the clause.

By way of example, suppose you want a program that prompts for an integer. If
the integer you enter is negative, the program prints the string
`"I'm positive the number is negative"`. In case the integer you enter is zero
or positive, the program doubles the number and prints the string
`"It's Dublin"` together with the doubled number. You anticipate the `then`
clause would have only one expression, namely the string to output for that
clause. No `do` block for the `then` clause. However, you require a `do` block
for the `else` clause because it would perform two actions, one after the other.
You translate the above description to Haskell as follows.

:include: file="assets/src/decide/double.hs", name="double.hs"

Let's see how a `do` block can help Sam organize some of her weekend chores.
Saturday is the day for weekly grocery shopping. Sam needs to stock up on food
for herself as well as cat food for Tabby. The local supermarket has a sale this
weekend on pet supplies. Sam needs to stock up on Tabby's favourite treats:
sardine and tuna. Sunday is the weekly grooming day for Tabby. Tabby needs to be
brushed and combed to help keep her coat clean. Sunday is also laundry day. The
above chores are translated into the program below to help Sam remind herself of
her weekend todo lists.

:include: file="assets/src/decide/weekend.hs", name="weekend.hs"

<!--=========================================================================-->

[^a]:
    A `do` block is not necessary to denote all code in the function `main`.
    Other techniques are available to allow you to perform a sequence of
    actions.

---
title: Bool-urns
math: true
---

> _Roy:_ (Singing) We don't need no education.\
> _Moss:_ Yes you do. You've just used a double negative.\
> --- _The IT Crowd_, season 1, episode 4, 2006

Do you like samurai? Do you like pizza? Do you like cats? If you answer yes to
all three questions, you might like [Samurai Pizza Cats][pizzaCats]. Do you also
like banana? Perhaps you might be interested in [Bananya][bananya]. Questions
such as the above often require a yes/no answer. Yes means true, you prefer
something. No means false, you dislike something. Questions or statements that
can be answered with yes/no or true/false are said to have boolean values.
Haskell models boolean values via the type [`Bool`][bool], which has two defined
values: `True` and `False`.

What else can you do with boolean values? A simple operation is to use the
function [`not`][not] to negate a boolean value, thus resulting in the opposite
value. The result of `not True` is `False` because the opposite of `True` is
`False`. As you might have already guessed, the result of `not False` is `True`.

<!--=========================================================================-->

## Or

> _Ned:_ Who are you?\
> _Villain:_ Big Mac... Beth.\
> _Ned:_ To blow your head off or... not blow your head off---that is the
> question.\
> --- _Reckless Kelly_, 1993

Given a bunch of boolean values, you can use the Haskell boolean operators
[`||`][or] and [`&&`][and] to calculate boolean results.[^a] The operator `||`
means "or", i.e. logical disjunction. In everyday English usage, the word "or"
means "either this or that". In computer programming, "or" means "this or that
or both", i.e. inclusive or. The following table should help to clarify the
meaning of `||` and its effect when given two boolean values. The table below
uses `OR` instead of `||` because Markdown cannot properly convert `||` when
used within a table.

| `OR`    | `False` | `True` |
| :------ | :------ | :----- |
| `False` | `False` | `True` |
| `True`  | `True`  | `True` |

From the above table, the result of `False || True` is `True`, so is
`True || True`. The one and only occasion when `||` returns `False` is when both
operands are `False`. Take a moment to use the above table and work through the
output of the following program.

:include: file="assets/src/data/or.hs", name="or.hs"

<!--=========================================================================-->

## Dollar sign

<!-- prettier-ignore-start -->
Hang on. What is the dollar sign [`$`][dollarSign] doing in the program
:script: file="assets/src/data/or.hs", name="or.hs"
? In Haskell, the symbol `$` is the function application operator. Given a
function `f` and an argument `x`, the result of applying `f` on `x` is written
in Haskell as `f x`. Using the operator `$` in prefix notation, we can write
`($) f x` for the same effect. See for yourself.
<!-- prettier-ignore-end -->

```haskell
ghci> negate 5
-5
ghci> ($) negate 5
-5
ghci> head "8-)"
'8'
ghci> ($) head "8-)"
'8'
ghci> div 9 2
4
ghci> ($) div 9 2
4
```

At first glance, it seems like the operator `$` is redundant. Why should it even
exist? A short answer is that `$` allows us to write readable code by avoiding
(nested) parentheses as much as possible. Let's consider an example. To satisfy
your daily mathematics fix, you evaluate the expression $2 \times (4 + 3)$
to 14. You know that anything within parentheses must be calculated first, then
multiply the result by 2. The symbol `$` allows you to tell Haskell to evaluate
the expression within parentheses first. Here are equivalent ways to evaluate
$2 \times (4 + 3)$ in Haskell.

```haskell
ghci> 2 * (4 + 3)
14
ghci> (*) 2 $ 4 + 3
14
```

The operator `$` means that Haskell should treat the right-hand side of `$` as
an operand of `*`. In general, the function application operator `$` directs
Haskell to first evaluate or process whatever expression is to the right of `$`.
Whenever you have an expression that involves `$`, you should try in your mind
to parse the expression from right to left instead of the usual left to right.
The examples below should clarify how to use `$`.

```haskell
ghci> import Text.Printf
ghci> tail (init "8caterpillar-")
"caterpillar"
ghci> tail $ init "8caterpillar-"
"caterpillar"
ghci> printf "Quotient is %d\n" (div 11 3)
Quotient is 3
ghci> printf "Quotient is %d\n" $ div 11 3
Quotient is 3
ghci> head (tail (tail "abcdef"))
'c'
ghci> head $ tail $ tail "abcdef"
'c'
```

<!--=========================================================================-->

[^a]: Ackchyually, [`||`][or] and [`&&`][and] are boolean functions.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[and]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:-38--38-
[bananya]: https://web.archive.org/web/20231010043830/https://en.wikipedia.org/wiki/Bananya
[bool]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html
[dollarSign]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-36-
[not]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:not
[or]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:-124--124-
[pizzaCats]: https://web.archive.org/web/20230713110453/https://en.wikipedia.org/wiki/Samurai_Pizza_Cats
<!-- prettier-ignore-end -->

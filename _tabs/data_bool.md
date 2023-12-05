---
title: Bool-urns
math: true
order: 9
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

[`or.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/or.hs)
```haskell
import           Text.Printf

-- Boolean or.
main = do
    let coffee = True
    let tea = False
    let water = True
    let beer = False
    putStrLn (printf "Coffee or tea? %s" $ show (coffee || tea))
    putStrLn (printf "Tea or water? %s" $ show (tea || water))
    putStrLn (printf "Tea or beer? %s" $ show (tea || beer))
```

<!--=========================================================================-->

## Dollar sign

<!-- prettier-ignore-start -->
Hang on. What is the dollar sign [`$`][dollarSign] doing in the program
[`or.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/or.hs)
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

## And

> "And you do Addition?" the White Queen asked. "What's one and one and one and
> one and one and one and one and one and one and one?"\
> "I don't know," said Alice. "I lost count."\
> "She can't do Addition," the Red Queen interrupted.\
> --- Lewis Carroll. _Through the Looking-Glass_. Macmillan, 1871, Chapter IX.

The boolean operator [`&&`][and] means "and", i.e. logical conjunction. Its
result is `True` provided that both operands are `True`. Its result is `False`
for all other cases. The table below helps to clarify the effect of `&&`.

| `&&`    | `False` | `True`  |
| :------ | :------ | :------ |
| `False` | `False` | `False` |
| `True`  | `False` | `True`  |

Unlike the expression `True || False`, the result of `True && False` is `False`.
The only time when `&&` returns `True` is the expression `True && True`. Again,
take some time to work through the boolean results of the following program.

[`and.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/and.hs)
```haskell
import           Text.Printf

-- Boolean and.
main = do
    let coffee = True
    let tea = False
    let water = True
    let beer = False
    putStrLn (printf "Coffee and tea? %s" (show (coffee && tea)))
    putStrLn (printf "Coffee and water? %s" (show (coffee && water)))
    putStrLn (printf "Tea and beer? %s" (show (tea && beer)))
```

<!--=========================================================================-->

## Exercises

<strong>Exercise 1.</strong> Simplify the statement: "Haskell is not not fun."

<strong>Exercise 2.</strong> What's the back of your back?

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> Rewrite the program
[`or.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/or.hs)
by using [`$`][dollarSign] to replace the outermost pairs of
parentheses. Rewrite the program
[`and.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/and.hs)
to use as few parentheses as possible.
<!-- prettier-ignore-end -->

<strong>Exercise 4.</strong> Examine the terminal session below. Determine which food Tabby
dislikes. Write a program that uses boolean operators to achieve the same output
as in the terminal session.

```sh
$ ghc food.hs && ./food
[1 of 2] Compiling Main             ( food.hs, food.o )
[2 of 2] Linking food
Tabby likes fish or cheese? True
Tabby likes fish and cheese? False
```

<strong>Exercise 5.</strong> Both of the types [`Bool`][bool] and [`Int`][int] are based on
[`Enum`][enum], as can be verified by the output of the GHCi commands
`:info Bool` and `:info Int`. The method [`fromEnum`][fromEnum] can be used to
convert a boolean value to its corresponding integer value: `True` becomes 1,
`False` becomes 0. A quiz has four questions: a, b, c, and d. Your results for
the quiz are given below. The value `True` means you answered a question
correctly and `False` means otherwise. Use the boolean values and the method
`fromEnum` to calculate how many questions you answered correctly.

```haskell
ghci> a = True
ghci> b = False
ghci> c = True
ghci> d = True
```

<strong>Exercise 6.</strong> The word "or" in everyday English means, "Either this or that, but
not both." In computer programming, the latter meaning of "or" is called
exclusive or, often abbreviated as XOR. Given two boolean values `a` and `b`,
the boolean operator XOR is defined in terms of `||` and `&&` as the expression

```haskell
(a || b) && not (a && b)
```

Fortunately, you do not need to use the above expression whenever you want to
calculate the XOR of two boolean values. The package [`Data.Bits`][dataBits] has
the method [`xor`][xor]. Write a program that uses `xor` to achieve the same
output as shown in the terminal session below.

```sh
$ ghc pet.hs && ./pet
[1 of 2] Compiling Main             ( pet.hs, pet.o )
[2 of 2] Linking pet
Sam likes cats and dogs? False
Sam likes cats or dogs? True
Sam likes cats XOR dogs? True
```

<strong>Exercise 7.</strong> Modify the following program so the expression `likeCat && likeTiger`
returns `False`.

[`pet.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/data/pet.hs)
```haskell
import           Text.Printf

main = do
    let likeCat = True
    let likeDog = True
    let likeTiger = True
    let likeWolf = False
    printf "Sam likes cats and dogs? %s\n" $ show $ likeCat && likeDog
    printf "Sam likes tiger or wolf? %s\n" $ show $ likeTiger || likeWolf
    printf "Sam likes cat or tiger? %s\n" $ show $ likeCat || likeTiger
    printf "Sam likes cat and tiger? %s\n" $ show $ likeCat && likeTiger
```

<strong>Exercise 8.</strong> Given two boolean values `a` and `b`, [De Morgan's laws][deMorgan]
are the statements:

```haskell
not (a || b) == (not a) && (not b)
not (a && b) == (not a) || (not b)
```

Verify the above statements yourself for various boolean values of `a` and `b`.

<strong>Exercise 9.</strong> Sam is using a search engine to find pet images. The search query is,
"cat or dog". Provide an equivalent boolean expression for Sam's query.

<strong>Exercise 10.</strong> Determine the output of the following.

```haskell
ghci> import Text.Printf
ghci> likeCat = True
ghci> putStrLn $ printf "%s" $ show $ not $ not likeCat
```

<!--=========================================================================-->

[^a]: Ackchyually, [`||`][or] and [`&&`][and] are boolean functions.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[and]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:-38--38-
[bananya]: https://web.archive.org/web/20231010043830/https://en.wikipedia.org/wiki/Bananya
[bool]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html
[dataBits]: https://web.archive.org/web/20231116111136/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bits.html
[deMorgan]: https://web.archive.org/web/20231202011153/https://en.wikipedia.org/wiki/De_Morgan%27s_laws
[dollarSign]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-36-
[enum]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Enum
[fromEnum]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fromEnum
[int]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#t:Int
[not]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:not
[or]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:-124--124-
[pizzaCats]: https://web.archive.org/web/20230713110453/https://en.wikipedia.org/wiki/Samurai_Pizza_Cats
[xor]: https://web.archive.org/web/20231116111136/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bits.html#v:xor
<!-- prettier-ignore-end -->

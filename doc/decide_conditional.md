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

:include: file="assets/src/decide/sardine.hs", line=25:-

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
:script: file="assets/src/decide/sardine.hs"
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
:script: file="assets/src/decide/sardine.hs"
as follows.
<!-- prettier-ignore-end -->

<!-- prettier-ignore -->
:include: file="assets/src/decide/sardine-time.hs", line=25:-

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

:include: file="assets/src/decide/nested.hs", line=25:-

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

:include: file="assets/src/decide/double.hs", line=25:-

Let's see how a `do` block can help Sam organize some of her weekend chores.
Saturday is the day for weekly grocery shopping. Sam needs to stock up on food
for herself as well as cat food for Tabby. The local supermarket has a sale this
weekend on pet supplies. Sam needs to stock up on Tabby's favourite treats:
sardine and tuna. Sunday is the weekly grooming day for Tabby. Tabby needs to be
brushed and combed to help keep her coat clean. Sunday is also laundry day. The
above chores are translated into the program below to help Sam remind herself of
her weekend todo lists.

:include: file="assets/src/decide/weekend.hs", line=25:-

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
Many countries have Saturday and Sunday as their weekend. Write a program that
prompts for the name of a day of the week. Output whether the given day is a
weekend.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise: label="ex_even_odd"
Write a program that prompts for an integer. Output whether the given integer is
even or odd.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Write a program that prompts for two integers. Output the maximum of both
values. Repeat the exercise for the minimum of two integers.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise: label="ex_vegetables"
On Monday, Sam would feed pork and mixed vegetables to Tabby. Modify the program
:script: file="assets/src/decide/sardine.hs"
to account for Tabby's meal on Monday.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise: label="ex_current_day"
The program
:script: file="assets/src/decide/day.hs"
below prints the current day of the week, using functions defined in the package
[`Data.Time`][dataTime]. The function [`getCurrentTime`][getCurrentTime] returns
the current time in UTC format, using your computer's system clock. We then use
[`utctDay`][utctDay] to extract the current date, excluding the current time.
The date is converted to the format of the Gregorian calendar and we destructure
the resulting tuple as the variables `year`, `month`, and `day`. The function
[`fromGregorian`][fromGregorian] converts the values of `year`, `month`, and
`day` to the format `year-month-day`, which is then fed to the function
[`dayOfWeek`][dayOfWeek] to tell us the current day of the week. Repeat the
[previous exercise](#ex_vegetables), but using the current day of the week
instead of hard coding a day string.
<!-- prettier-ignore-end -->

:include: file="assets/src/decide/day.hs", line=25:-

<!-- prettier-ignore-start -->
:exercise:
The program
:script: file="assets/src/decide/time.hs"
below outputs the current time of the day in 24-hour format. The function
[`getCurrentTime`][getCurrentTime] returns the current time in UTC format, using
your computer's system clock. The function
[`getCurrentTimeZone`][getCurrentTimeZone] returns your computer's configured
time zone. Using your local time zone and the UTC date/time, the function
[`utcToLocalTime`][utcToLocalTime] returns your current local date/time,
including fractional seconds. However, you only want the hour, minute, and
second as integers so you use the function [`localTimeOfDay`][localTimeOfDay] to
obtain the required information, then destructure the result. Noon starts from
12 pm. Write a program to obtain the current hour. If the current time is 12 pm,
then output the string `"It's high noon"`. Otherwise output the string
`"Not yet high noon"` for all other hours.
<!-- prettier-ignore-end -->

:include: file="assets/src/decide/time.hs", line=25:-

<!-- prettier-ignore-start -->
:exercise: label="ex_absolute_value"
The absolute value of a number $x$ is defined as:
<!-- prettier-ignore-end -->

$$
|x|
=
\begin{cases}
  x,& \text{if } x \geq 0,\\[8pt]
  -x,& \text{otherwise}.
\end{cases}
$$

Write a program that prompts for a number and outputs its absolute value.

<!-- prettier-ignore-start -->
:exercise:
According to [this website][catFood], it is safe to feed the following fruits to
cats: apple, banana, blueberries, cantaloupe, strawberries, watermelon. Eggs and
cheese are also safe for cats. In addition to Tabby's scheduled meal on Monday
and Friday, Sam wants to feed mixed fruits to Tabby on Tuesday, scrambled eggs
on Wednesday, and hard cheese such as cheddar or Gouda on Thursday. Repeat
[this exercise](#ex_current_day), but incorporate the above meals for Tabby on
Tuesday, Wednesday, and Thursday.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
A four-digit year is a leap year, provided one of the following conditions holds:
<!-- prettier-ignore-end -->

1. The number can be divided by 4 and cannot be divided by 100.
1. The number can be divided by 400.

Write a program to determine whether the current year is a leap year. If it is a
leap year, divide the year by 2 and output the current year together with its
halved value. If the current year is not a leap year, output the string
`"No ribbit for froggy"`. You are not allowed to hard code the digits of the
current year.

<!-- prettier-ignore-start -->
:exercise: label="ex_daily_saying"
The weekdays are Monday, Tuesday, Wednesday, Thursday, and Friday. The weekend
consists of Saturday and Sunday. Write a program to prompt for the current day
of the week. If it is a weekday, output the string `"It's a weekday"`. If the
day is part of the weekend, output the string `"Weekend fun"`. If it is a
Wednesday, Thursday, or Friday output the string `"WTF"`. Furthermore, output
the following strings, depending on the given day.
<!-- prettier-ignore-end -->

-   Monday. Output `"A case of the Mondays"`.
-   Tuesday. Output `"Taco night"`.
-   Wednesday. Output `"It's Wednesday, my dude"`.
-   Thursday. Output `"Hang in there. One more day."`.
-   Friday. Output `"Thank Gwynevere it's Friday"`.
-   Saturday. Output `"Caturday :3"`.
-   Sunday. Output `"Sunday driver"`.

<!--=========================================================================-->

[^a]:
    A `do` block is not necessary to denote all code in the function `main`.
    Other techniques are available to allow you to perform a sequence of
    actions.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[catFood]: https://web.archive.org/web/20230102115754/https://be.chewy.com/nutrition-food-treats-15-human-foods-that-are-safe-for-cats/
[dataTime]: https://web.archive.org/web/20231118105934/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time.html
[dayOfWeek]: https://web.archive.org/web/20230823185222/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-Calendar.html#v:dayOfWeek
[fromGregorian]: https://web.archive.org/web/20230823185222/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-Calendar.html#v:fromGregorian
[getCurrentTime]: https://web.archive.org/web/20231118105935/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-Clock.html#v:getCurrentTime
[getCurrentTimeZone]: https://web.archive.org/web/20230608215306/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-LocalTime.html#v:getCurrentTimeZone
[localTimeOfDay]: https://web.archive.org/web/20230608215306/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-LocalTime.html#t:LocalTime
[utctDay]: https://web.archive.org/web/20231118105935/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-Clock.html#t:UTCTime
[utcToLocalTime]: https://web.archive.org/web/20230608215306/https://hackage.haskell.org/package/time-1.12.2/docs/Data-Time-LocalTime.html#v:utcToLocalTime
<!-- prettier-ignore-end -->

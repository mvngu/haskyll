---
title: Case-y Jones
math: true
order: 17
---

In the section [En garde!](../decide_guard/), we learnt that guarded equations
allow us to simulate the behaviour of the `switch` statement from languages such
as C, Java, and JavaScript. Guarded equations also behave similarly to the
`match` statement from Python. Below, we discuss another way to mimic the
`switch` and `match` statements.

<!--=========================================================================-->

## Brief case

Let's start with an example. An integer $n$ is even if it is a multiple of 2,
and odd otherwise. We write the latter as the following mathematical expression:

$$
\begin{equation}
\label{eqnParity}
p(n)
=
\begin{cases}
\text{even},& \text{if } n \bmod 2 = 0,\\[8pt]
\text{odd},& \text{otherwise}.
\end{cases}
\end{equation}
$$

In Haskell, we use the case expression to implement formula (\ref{eqnParity}).
Examine the code below:

[`parity.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.hs)
```haskell
-- | Whether an integer is even or odd.  This implementation uses a case
-- expression.
parity :: Int -> String
parity n =
    case mod n 2 == 0 of
        True  -> "even"
        False -> "odd"
```

A case expression has the format specified below:

```haskell
case expression of
    pattern1 -> expression1
    pattern2 -> expression2
    ...
    patternN -> expressionN
    _        -> defaultExpression
```

We start a case expression with the keyword `case`, followed by an expression
`expression` that evaluates to one of a finite number of values. If the value
matches `pattern1`, then `expression1` is evaluated. In case the value matches
`pattern2`, then `expression2` is evaluated. And so on. The default pattern is
the wildcard `_`, which should be the last pattern of a case expression as a
means of catching all other patterns not handled by `pattern1` to `patternN`.
The wildcard pattern is equivalent to the `default` case in the `switch`
statement of C and JavaScript, and the case `_` in a Python `match` statement.

Let's compare the Haskell code above with implementations in other languages. In
C, expression (\ref{eqnParity}) can be implemented via a `switch` statement as
follows:

[`parity.c`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.c)
```c
#include <stdio.h>

/**
 * The switch statement in C.
 */
int main() {
    int k = 6;
    switch (k % 2) {
    case 0:
        printf("%d is even\n", k);
        break;
    default:
        printf("%d is odd\n", k);
    }
    return 0;
}
```

Here's a JavaScript implementation:

[`parity.js`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.js)
```js
// The switch statement in JavaScript.
const k = 6;
switch (k % 2) {
    case 0:
        console.log(`${k} is even`);
        break;
    default:
        console.log(`${k} is odd`);
}
```

Python wants to join in the fun:

[`parity.py`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.py)
```py
def main():
    """
    The match statement in Python.
    """
    k = 6
    match k % 2:
        case 0:
            print(f"{k} is even")
        case _:
            print(f"{k} is odd")
```

<!--=========================================================================-->

## Renaissance artists

Do you know which colour is associated with which ninja turtle? Donatello is
purple, Leonardo (da Vinci) is blue, Michelangelo is orange, and Raphael is red.
Given a name of a ninja turtle, we want to output the corresponding colour. Any
other name would not be recognized as the name of a ninja turtle. In case you
cannot remember the colour of a turtle, the function below might help:

[`turtle.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/turtle.hs)
```haskell
-- | The colour associated with a ninja turtle.
turtle :: String -> String
turtle name =
    case name of
        "Donatello"    -> "purple"
        "Leonardo"     -> "blue"
        "Michelangelo" -> "orange"
        "Raphael"      -> "red"
        _              -> "unknown ninja turtle"
```

<!-- prettier-ignore-start -->
Here's a slightly more difficult problem. Given a person's name, output the
first vowel in the name. Some names do not contain vowels at all, in which case
output the null character `'\0'`. The following code solves the above
problem. Similar to the script
[`parity.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.hs)
, the code below illustrates that the wildcard pattern `_` is not required as
the final pattern in a case expression, provided we have covered all
possibilities.
<!-- prettier-ignore-end -->

[`name.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/name.hs)
```haskell
import Data.Char
import Data.Foldable
import Text.Printf

-- | The first vowel in a name.
firstVowel :: String -> Char
firstVowel str =
    case (vowel str) of
        []    -> '\0'
        (x:_) -> x

-- | All vowels in a name.
vowel :: String -> String
vowel str = [s | s <- str, (toLower s) `elem` "aeiou"]
```

<!-- prettier-ignore-start -->
The function `vowel` in the script
[`name.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/name.hs)
is defined in terms of a list comprehension, a topic to be discussed in the
section [¿Comprende?](../list_comprehension/). Test the above code with these
Renaissance artists:
<!-- prettier-ignore-end -->

-   Albrecht Dürer
-   Andrea Mantegna
-   Donatello
-   Giovanni Bellini
-   Jan van Eyck
-   Leonardo da Vinci
-   Lorenzo Ghiberti
-   Michelangelo
-   Raphael
-   Sandro Botticelli

The following names do not have vowels at all. Use the names to test the above
code as well.

-   Brynn Ng
-   Gwynyth Symth

<!--=========================================================================-->

## Which one?

We conclude this section with a retrospective on the decision-making constructs
available in Haskell. Hitherto the chapter has discussed the following
techniques for decision-making:

1. Conditional expression
1. Guarded equation
1. Pattern matching
1. Case expression

Which technique should you choose? Generally, you should err on the side of
readability. A conditional expression is ideal for simple decision-making, where
the conditional is a short expression that allows you to fit an
`if...then...else` construct on one line, like the ternary operator in some
other languages. Some Haskell code formatter would automatically structure an
`if...then...else` across three lines, which defeats the purpose of a
conditional expression being like a ternary operator. You might as well use a
guarded equation instead of a conditional expression.

Pattern matching is ideal for the situation where you have a finite set of
values. Suppose you have the values $a_1,\, a_2,\, \dots,\, a_n$. With a guarded
equation you would test each value via a guard such as `| x == a1`. It is
tedious to write out all such conditionals, especially when you have three or
more conditionals. Your code can be simplified somewhat by using pattern
matching. Case expression and pattern matching are almost identical. Whenever
you can replace a case expression by pattern matching, do so. For everything
else, use a Master Car... err... a case expression.

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> Rewrite the function `parity` of the script
[`parity.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.hs)
to use a `where` clause.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> Rewrite the function `parity` of the script
[`parity.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.hs)
to use a conditional expression.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> Rewrite the function `parity` of the script
[`parity.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/decide/parity.hs)
to use a guarded equation.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> The following table presents various famous Renaissance artists and one of their
expertise.
<!-- prettier-ignore-end -->

| Artist            | Expertise |
| ----------------- | --------- |
| Albrecht Dürer    | painter   |
| Andrea Mantegna   | painter   |
| Donatello         | sculptor  |
| Giovanni Bellini  | painter   |
| Jan van Eyck      | painter   |
| Leonardo da Vinci | painter   |
| Lorenzo Ghiberti  | sculptor  |
| Michelangelo      | painter   |
| Raphael           | painter   |
| Sandro Botticelli | painter   |

Write a function that, given the name of a Renaissance artist, outputs the
artist's expertise.

<!-- prettier-ignore-start -->
<strong>Exercise 5.</strong> Write a function that accepts a person's name. If the name has at most three
letters, output the name. If the name has more than three letters, output the
first letter of the name. If the given parameter is an empty string, output the
null character `\0`. Use a case expression in your solution.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 6.</strong> Repeat the previous exercise, but without using a case expression.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 7.</strong> Using a case expression, write a function that takes a list of integers. If the
list is empty, output zero. If the list has only one element, square the
number. If the list has only two elements, multiply those two elements
together. For all other cases, sum the elements of the list. Provide another
implementation that does not use case expression.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 8.</strong> The table below presents the dress/shoes combination as recommended by
[InStyle][InStyle]. Write a function that takes the name of a dress and outputs
the corresponding recommended shoes.
<!-- prettier-ignore-end -->

| Dress                  | Shoes                             |
| ---------------------- | --------------------------------- |
| babydoll dress         | loafers                           |
| blazer dress           | kitten heels                      |
| button-down shirtdress | white sneakers                    |
| cocktail dress         | open-toe heeled sandals           |
| denim dress            | cowboy boots, sneakers, loafers   |
| full skirt             | pointed-toe pumps, heeled sandals |
| maxidress              | strappy block heels               |
| midi dress             | open-toe kitten heels             |
| minidress              | ballet flats                      |
| slip dress             | anything and everything           |
| sundress               | loafers                           |
| T-shirt dress          | combat boots                      |

<!-- prettier-ignore-start -->
<strong>Exercise 9.</strong> The following are categories of [HTTP status codes][httpStatusCode]:
<!-- prettier-ignore-end -->

-   1xx --- informational response
-   2xx --- successful
-   3xx --- redirection
-   4xx --- client error
-   5xx --- server error

Write a function that takes a status code and outputs the category to which the
code belongs.

<!-- prettier-ignore-start -->
<strong>Exercise 10.</strong> This is a continuation of the previous exercise. Refer to
[this page][httpStatusCode] for an extended list of HTTP status codes and their
meanings. Write a function that takes a status code and outputs its meaning.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[httpStatusCode]: https://web.archive.org/web/20240105224035/https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
[InStyle]: https://web.archive.org/web/20240106070733/https://www.instyle.com/what-shoes-to-wear-with-dresses-7558636
<!-- prettier-ignore-end -->

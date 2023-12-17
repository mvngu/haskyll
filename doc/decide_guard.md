---
title: En garde!
math: true
---

Hi! I'm a shouty man.[^a] Do you miss the `switch` statement from languages such
as C, Java, and JavaScript? Or the `match` statement from Python? Tired of
writing (or reading) nested conditional expressions like the following?

:include: file="assets/src/decide/nested.hs", name="nested.hs", line=25:40

Say no more. What if I tell you that you can get rid of nested conditional
expressions? How would you like to organize your nested conditional expressions
according to the cases or conditions you want to match? Curious? Read on.

<!--=========================================================================-->

## Guarded equations

A conditional expression can be replaced with a guarded equation. To understand
what a guarded equation can do for you, recall the function `maxInt` from the
section [Multiple parameters](../decide_function/#multiple-parameters):

:include: file="assets/src/decide/max.hs", name="max.hs", line=27:32

Here is the same function, but written as a guarded equation:

:include: file="assets/src/decide/max.hs", name="max.hs", line=34:38

And here is the guarded equation translated to a mathematical expression:

$$
\text{max}(x,\, y)
=
\begin{cases}
x,& \text{if } x > y,\\[8pt]
y,& \text{otherwise}.
\end{cases}
$$

A guarded equation is a function that follows the format

```haskell
funcName a b ...
    | conditional_1 = result_1
    | conditional_2 = result_2
    ...
    | otherwise = result_n
```

First, we have the name `funcName` of the guarded equation. We use the name of
the guarded equation and pass parameters to it in the same way that we apply a
function. A guarded equation is a function. The pipe symbol `|` is read as "such
that" and signifies the beginning of a guard. A guard is a conditional, an
expression that evaluates to a boolean value. To the right of the guard is the
equal sign `=`, followed by the result corresponding to the guard. The line

```haskell
| conditional_1 = result_1
```

can be read as, "The value of the function is such that if `conditional_1` holds
`True`, then the output is `result_1`." The other lines have similar
interpretation. The final line of a guarded equation is

```haskell
| otherwise = result_n
```

Like the `switch` statement (and the label `default`) in some languages, Haskell
does not require the guard [`otherwise`][otherwise] in the final line of your
guarded equation. However, do bear in mind that the guard `otherwise` is defined
as `otherwise = True` and serves as a catch-all for every case not handled by
the previous guards. Use the guard `otherwise` to handle the default output of
your guarded equation.

<!--=========================================================================-->

## Body mass index

The [body mass index][bmi] (BMI) is a quick and easy way to assess a person's
health in terms of their weight and height. The formula is given as

$$
\text{BMI}
=
\frac{
  \text{weight}
}{
  \text{height} \times \text{height}
}
$$

where the weight (or mass) is measured in kilograms and the height is measured
in metres. According to the [US Centers for Disease Control and
Prevention][usCDC] (CDC), an adult of 20 years or older can be categorized as
follows according to their BMI.

| BMI           | Status         |
| :------------ | :------------- |
| below 18.5    | underweight    |
| 18.5--24.9    | healthy weight |
| 25.0--29.9    | overweight     |
| 30.0 or above | obese          |

The information in the above table is translated to a guarded equation as
follows.

:include: file="assets/src/decide/bmi.hs", name="bmi.hs", line=32:39

<!--=========================================================================-->

## Java example

Different coffee beverages are best served with cups of various sizes. According
to [this website][coffeeCup], the cup sizes corresponding to some drinks are as
given below.

| Drink       | Cup size    |
| :---------- | :---------- |
| espresso    | 56--85 ml   |
| cappuccino  | 142--170 ml |
| latte       | 227--426 ml |
| frappuccino | 312--426 ml |

Your mission, should you choose to accept it, is to write a function that takes
the name of a caffeinated drink and outputs the corresponding cup size. Did you
decline? No problem. Below is a translation of the above table to Haskell code.

:include: file="assets/src/decide/coffee.hs", name="coffee.hs", line=27:34

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
Write a guarded equation to determine the minimum of two integers.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Rewrite the program
:script: file="assets/src/decide/nested.hs", name="nested.hs"
by using guarded equation.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The [sign or signum function][signFunction] is defined as follows:
<!-- prettier-ignore-end -->

$$
\text{sgn}(x)
=
\begin{cases}
-1,& \text{if } x < 0,\\[8pt]
0,& \text{if } x = 0,\\[8pt]
1,& \text{if } x > 0.
\end{cases}
$$

Implement the sign function as a Haskell guarded equation.

<!-- prettier-ignore-start -->
:exercise:
Repeat the [daily saying exercise](../decide_conditional/#ex_daily_saying), but
use guarded equation.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The [triangular function][triangularFunction] is defined as:
<!-- prettier-ignore-end -->

$$
\text{tri}(x)
=
\begin{cases}
1 - |x|,& \text{if } |x| < 1,\\[8pt]
0,& \text{otherwise}.
\end{cases}
$$

Repeat the exercise on
[absolute value](../decide_conditional/#ex_absolute_value), but implement a
guarded equation. Then implement the triangular function as a guarded equation.

<!-- prettier-ignore-start -->
:exercise:
The size of a college in the USA [can be categorized][collegeSize] according to
the number of students the college has.  Refer to the table below.
<!-- prettier-ignore-end -->

| Students            | Size   |
| :------------------ | :----- |
| less than 5,000     | small  |
| 5,000 to 15,000     | medium |
| greater than 15,000 | large  |

Implement the above table as a guarded equation.

<!-- prettier-ignore-start -->
:exercise:
In the USA, the size of woman's clothing can be designated by a number between 0
and 22. We can [assign the size to a category][womanSize] as given below.
<!-- prettier-ignore-end -->

| Numeric size | Category |
| :----------- | :------- |
| 0--2         | XS       |
| 4--6         | S        |
| 8--10        | M        |
| 12--14       | L        |
| 16--18       | XL       |
| 20           | XXL      |
| 22           | XXXL     |

Implement the above table as a guarded equation.

<!-- prettier-ignore-start -->
:exercise:
A quadratic equation can be written in the general form
<!-- prettier-ignore-end -->

$$
ax^2 + bx + c = 0
$$

where $a,b,c$ are real numbers with $a \neq 0$. The solution(s) to a quadratic
equation depends on the value of the discriminant $\Delta = b^2 - 4ac$. In
particular, we have the following cases:

1. If $\Delta > 0$, then we have two distinct real solutions.
1. If $\Delta = 0$, then we have a repeated real solution.
1. If $\Delta < 0$, then we have two distinct complex solutions.

Write a guarded equation to determine the type of solutions of a given quadratic
equation.

<!-- prettier-ignore-start -->
:exercise:
Write a Haskell function that outputs the body mass index given an adult's
weight (kilogram) and height (metre). Use your implementation to test the
function `weightStatus` from the section [Body mass index](#body-mass-index).
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Using guarded equation, write a function for each of the following.
<!-- prettier-ignore-end -->

-   The maximum of three integers.
-   The minimum of three integers.
-   The middle of three integers.

<!--=========================================================================-->

[^a]:
    A recurring salesman from _Horrible History_. See him in [action
    here][shoutyMan].

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[bmi]: https://web.archive.org/web/20231202071810/https://en.wikipedia.org/wiki/Body_mass_index
[coffeeCup]: https://web.archive.org/web/20230410035003/https://fluentincoffee.com/coffee-cup-sizes-chart/
[collegeSize]: https://web.archive.org/web/20231209104604/https://www.collegedata.com/resources/the-facts-on-fit/college-size-small-medium-or-large
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
[shoutyMan]: https://youtu.be/x7WiPl5s91A
[signFunction]: https://web.archive.org/web/20231202004602/https://en.wikipedia.org/wiki/Sign_function
[triangularFunction]: https://web.archive.org/web/20231123204312/https://en.wikipedia.org/wiki/Triangular_function
[usCDC]: https://web.archive.org/web/20231207003413/https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html
[womanSize]: https://web.archive.org/web/20231209104319/https://threadcurve.com/womans-clothing-size-conversion-chart/
<!-- prettier-ignore-end -->

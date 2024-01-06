---
title: Compare the pair
math: true
order: 10
---

Boolean values commonly arise when you need to compare strings, numbers, or
something else. Is the number 1 less than 2? Of course the expression is true.
Haskell supports the usual comparison operators:

-   Equal to, [`==`][equalTo].
-   Not equal to, [`/=`][notEqual].[^a]
-   Less than, [`<`][lessThan].
-   Less than or equal to, [`<=`][lessThanEqual].
-   Greater than, [`>`][greaterThan].
-   Greater than or equal to, [`>=`][greaterThanEqual].

Here are some mathematics facts because, I have been told, everyone loves facts.

```haskell
ghci> import Text.Printf
ghci> a = 1
ghci> b = 2
ghci> printf "a < b? %s\n" $ show $ a < b
a < b? True
ghci> printf "a > b? %s\n" $ show $ a > b
a > b? False
ghci> printf "a <= b? %s\n" $ show $ a <= b
a <= b? True
ghci> printf "a >= b? %s\n" $ show $ a >= b
a >= b? False
ghci> printf "a == b? %s\n" $ show $ a == b
a == b? False
ghci> printf "a /= b? %s\n" $ show $ a /= b
a /= b? True
```

The above operators can also be used to compare strings. Comparison is according
to lexicographic order.

```haskell
ghci> "a" < "b"
True
ghci> "a" > "b"
False
ghci> "A" < "a"
True
ghci> "A" == "a"
False
ghci> "A" /= "a"
True
```

The method [`compare`][compare] allows you to determine the ordering of two
values. Unlike the comparison operators, the method `compare` does not return a
boolean value. Given two values that can be compared, the method `compare`
returns one of the following values.

-   `LT`, meaning less than.
-   `EQ`, meaning equal.
-   `GT`, meaning greater than.

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> Why are the strings `"Meow"` and `"meow"` different? Within a GHCi session,
convert either or both strings so the resulting strings compare equal according
to `==`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> Why are `'a'` and `"a"` different? Within a GHCi session, convert either or both
so the resulting values would compare equal according to `==`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> Modify the program below so it would compile and the relevant values compare
equal according to `==`.
<!-- prettier-ignore-end -->

[`same.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/data/same.hs)
```haskell
import Text.Printf

-- | Same or different?
main = do
    let a = 42
    let b = "42"
    printf "a == b? %s\n" $ show $ a == b
```

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> The comparison operators also work with characters of the English alphabet. Just
like the integers have an ordering to tell you that $1 < 2$ holds true,
characters of the English alphabet have an ordering as well, i.e. alphabetic or
lexicographic ordering. The letter "a" always comes before "b" and Haskell can
confirm this dictionary ordering if you run the code `"a" < "b"`. Here, the
operator `<` means "precede". The expression `"a" < "b"` can be read as: Does
the letter "a" come before "b"? Note that an uppercase letter always precedes
any lowercase letter. Consider the program below. Why does the expression
`"aardvark" < "Aardvark"` return `False`? Modify the program so the result of
the operator `<` is `True`.
<!-- prettier-ignore-end -->

[`dictionary.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/data/dictionary.hs)
```haskell
import Text.Printf

-- | A small dictionary.
main = do
    let a = "aardvark"
    let b = "armadillo"
    let c = "aardwolf"
    let d = "Aardvark"
    printf "b < a? %s\n" $ show $ b < a
    printf "c < a? %s\n" $ show $ c < a
    printf "b < c? %s\n" $ show $ b < c
    printf "a < d? %s\n" $ show $ a < d
```

<!-- prettier-ignore-start -->
<strong>Exercise 5.</strong> A quiz has three statements, each of which evaluates to a boolean value. The
statements are shown in the program below. Modify the program to output the
number of correct statements, using only boolean arithmetics. Insert your code
at the location shown in the program.
<!-- prettier-ignore-end -->

[`quiz.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/data/quiz.hs)
```haskell
import Text.Printf

-- | How many correct solutions?
main = do
    let resultA = 2 < 3
    let resultB = 37 /= (read "37" :: Integer)
    let resultC = 2 == 2.0
    -- Insert code here.
```

<!-- prettier-ignore-start -->
<strong>Exercise 6.</strong> Translate the expression $1 < 2 < 3$ to Haskell code.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

[^a]:
    This is different from languages such as C, Java, and Python which use `!=`
    to compare for inequality.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[compare]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:compare
[equalTo]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-61--61-
[greaterThan]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-62-
[greaterThanEqual]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-62--61-
[lessThan]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-60-
[lessThanEqual]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-60--61-
[notEqual]: https://web.archive.org/web/20231128114053/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-47--61-
<!-- prettier-ignore-end -->

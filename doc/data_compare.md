---
title: Compare the pair
math: true
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

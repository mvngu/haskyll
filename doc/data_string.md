---
title: The string and I
math: true
---

Numbers are magnificent, but have you seen what can be done with strings? In
this section, we will discuss strings. In particular, how to split strings, join
strings, and manipulate them in other ways. We start off with characters in the
section [Characters](#characters) because a string can be conceptualized as a...
um... string of characters. The section [Strings](#strings) then discusses
common operations on strings. We will learn how to join strings together, split
a string apart, and embed strings and numbers into another string.

<!--=========================================================================-->

## Characters

> The character for elation is written in octal notation as `\o/`.

Haskell uses the type [`Char`][char] to represent characters. Like some other
languages,[^a] a character literal is delimited by single quotation marks. The
character literal "a" is written in Haskell as `'a'`. Each value of the type
`Char` should be one Unicode character, which can be given using one of the
following formats:

-   Glyph. The glyph of a Unicode character is its visual representation. The
    glyph for the character "a" is `a` and we write it in Haskell as `'a'`. The
    Greek letter beta is written as `'β'`. Many characters, e.g. control
    characters, do not have their own glyphs and we must use special escape
    sequences to specify such characters.
-   Decimal. A character can be given by its decimal notation. The character "a"
    has the decimal code 97 and we write it in Haskell as `'\97'`. Notice the
    use of the backslash symbol `\`. The newline (or line feed) character can be
    written as `'\n'` or via its decimal notation as `'\10'`.
-   Octal. A character can be written in terms of its octal notation. The
    character "a" has the octal code 0141 and we write it in Haskell as
    `'\o0141'`. Notice the use of the escape sequence `\o` (with the lowercase
    version of O) to specify that we are using octal notation. The newline
    character is written in octal notation as `'\o012'`. Yay `\o/`! Time to pet
    `:3`.

<!--=========================================================================-->

### The package `Data.Char`

To do anything interesting with characters, we must load the package
[`Data.Char`][dataChar]. Loading is done via the keyword [`import`][import]. In
the GHCi session below, we perform some basic operations on a character.

```haskell
ghci> import Data.Char
ghci> c = 'a'
ghci> isNumber c
False
ghci> isAlpha c
True
ghci> isLower c
True
ghci> toUpper c
'A'
```

<!--=========================================================================-->

## Strings

Strings in Haskell are represented in many different ways. A simple and easy to
understand representation is as a list of characters.[^b] A list in Haskell is
represented using square brackets, e.g. `["abc","defg"]`. The type
[`String`][string] is defined as a list of characters. Unlike the package
[`Data.Char`][dataChar], the package [`Data.String`][dataString] is loaded by
default to provide us with a few functions for processing strings. The type
`String` is simple to understand, easy to explain to beginners of the Haskell
language, and values of type `String` can be manipulated by means of standard
Haskell functions and operators.[^f]

In the GHCi session below, we create a string `s` and use the function
[`lines`][lines] to split the string into multiple lines. The split occurs at
the newline character `\n`. The result is a list of two elements, each being a
substring of `s`. As its name implies, the function [`unlines`][unlines] joins
multiple strings into one string. We then use the function [`words`][words] to
decompose the string `s` into words. This is similar to the function `lines` in
the sense that `words` uses whitespace to split a string. The function
[`unwords`][unwords] joins multiple words, each represented as a string, into
one string.

```haskell
ghci> s = "The five boxing wizards\njump quickly."
ghci> lines s
["The five boxing wizards","jump quickly."]
ghci> unlines (lines s)
"The five boxing wizards\njump quickly.\n"
ghci> words s
["The","five","boxing","wizards","jump","quickly."]
ghci> unwords (words s)
"The five boxing wizards jump quickly."
```

<!--=========================================================================-->

[^a]:
    The languages C, C++, and Java each uses single quotation marks to delimit a
    character literal.

[^b]:
    This is similar to how strings are represented in C, where a string is
    merely an array of characters.

[^f]:
    Use the package [`Data.Text`][dataText] to manipulate strings if performance
    is a top priority.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[char]: https://web.archive.org/web/20231128120029/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
[dataChar]: https://web.archive.org/web/20231128120029/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
[dataString]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html
[import]: https://web.archive.org/web/20231128054800/https://wiki.haskell.org/Import
[lines]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:lines
[string]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#t:String
[unlines]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:unlines
[unwords]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:unwords
[words]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:words
<!-- prettier-ignore-end -->

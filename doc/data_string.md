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

[^a]:
    The languages C, C++, and Java each uses single quotation marks to delimit a
    character literal.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[char]: https://web.archive.org/web/20231128120029/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
<!-- prettier-ignore-end -->

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

### Care to join?

> "Jones, you'd better join our cooperative life insurance company before that
> cough of yours gets any worse."\
> "I'd like to do it, Furguson, but I don't believe I would pass the medical examination."\
> "That's all right. I'm on the examining board. I can get you in."\
> "Then I won't join it, Furguson. I don't want to have anything to do with a company
> that would take a risk on me."\
> --- [_The Chicago Daily Tribune_][chicagoDailyTribune], "In a Minor Key:
> Unanswerable", 06th June, 1891, p.4, column 5.

In the section [Printing numbers](../data_number/#printing-numbers), we learnt
that the operator[^c] [`++`][plusplus] can join two strings together. Another
way to concatenate strings is to use the aptly named function
[`concat`][concat]. Both `++` and `concat` have the same effect. Here are some
differences between `++` and `concat`:

1. The function `concat` is used in prefix notation, whereas `++` is used in
   infix notation.
1. The function `concat` takes a list of strings as its argument, whereas `++`
   behaves like a binary operator.
1. The operator `++` can be used in prefix notation by surrounding it within
   parentheses, i.e. `(++)`. The function `concat` cannot be used in infix
   notation.

The GHCi session below should clarify the similarity and differences between
`++` and `concat`.

```haskell
ghci> "battle" ++ "beetle" -- infix notation
"battlebeetle"
ghci> (++) "battle" "beetle" -- prefix notation
"battlebeetle"
ghci> concat ["any", "way"] -- prefix notation
"anyway"
```

The cons operator `:` is similar to `++` insofar as `:` allows for
concatenation. The cons operator is a binary operator. To use `:` for
concatenating to a string, the left operand of `:` must be a character and the
right operand must be a string. Like `++`, the cons operator can be used in
prefix or infix notations.

```haskell
ghci> 'b' : "c"
"bc"
ghci> 'a' : ('b' : "c")
"abc"
ghci> (:) 'b' "c"
"bc"
ghci> (:) 'a' ((:) 'b' "c")
"abc"
```

<!--=========================================================================-->

### Splitting headache

> _Dick_: Come on, Harry. Let's make like a banana split and leave.\
> --- _3rd Rock from the Sun_, season 2, episode 19, 1997

The functions [`lines`][lines] and [`words`][words] can split a string according
to whitespaces. What if you want to split a string `s` at a given index? Use the
function [`splitAt`][splitAt]. The function requires two arguments:

-   An integer $k$ representing the index at which to split `s`. In Haskell,
    index starts from zero.
-   The string `s` itself.

The function returns a tuple of two elements. A tuple in Haskell is represented
using parentheses, e.g. `("abc","defg")`. The first element is a substring that
consists of the first $k$ characters of `s`. The second element is a substring
made up of the rest of `s`. Let's see `splitAt` in action. We use the function
[`length`][length] to query the number of characters in a string.

```haskell
ghci> s = "Split"
ghci> t = " me like a log."
ghci> u = s ++ t
ghci> u
"Split me like a log."
ghci> length s
5
ghci> splitAt (length s) u
("Split"," me like a log.")
```

We now have another problem. The function [`splitAt`][splitAt] returns a tuple
of two elements. How are we to extract the individual elements? We have two ways
to extract the individual elements of a tuple: a quick way and a labourious way.
Let's consider the labourious way first. The tuple functions [`fst`][fst] and
[`snd`][snd] extract the first and second elements, respectively, of a tuple
having two elements. Below we use the functions `fst` and `snd` to extract the
left and right parts of a splitted string.

```haskell
ghci> str = "Split me like a log."
ghci> left = fst (splitAt 5 str)
ghci> right = snd (splitAt 5 str)
ghci> left
"Split"
ghci> right
" me like a log."
```

Enough of the labouriously fun way. A quick way to extract elements from a tuple
is to destructure the tuple.[^d] The function [`splitAt`][splitAt] returns a
tuple of two elements. It makes sense to assign the result to another tuple that
has two elements.[^e] Observe destructuring in action.

```haskell
ghci> str = "Split me like a log."
ghci> (left, right) = splitAt 5 str
ghci> left
"Split"
ghci> right
" me like a log."
```

<!--=========================================================================-->

### More index fun

The function [`splitAt`][splitAt] is not alone in splitting a string based on an
integer index. Similar to `splitAt`, the function [`take`][take] accepts two
arguments: an integer index $k$ at which to split a string, and the string
itself. In contrast to `splitAt`, the function `take` returns a substring of the
first $k$ characters of the given string. No need to use [`fst`][fst] with
`splitAt`.

```haskell
ghci> status = "splitting headache"
ghci> take 5 status
"split"
```

Here's a quick quiz. The opposite of `take` is [blank]. If you answer "drop",
well done! In case your response is "leave", please stay. Don't make like a tree
and leave. The function [`drop`][drop] takes an integer $k$ and a string `s`,
and returns all but the first $k$ characters of `s`. Equivalently, `drop`
removes the first $k$ characters of `s`. The function is more convenient than
using [`snd`][snd] with [`splitAt`][splitAt]. See it for yourself.

```haskell
ghci> status = "splitting headache"
ghci> take 5 status
"split"
ghci> drop 5 status
"ting headache"
ghci> (take 5 status) ++ (drop 5 status)
"splitting headache"
```

In general, the functions `take` and `drop` give us the left and right portions,
respectively, of a string. The leftmost section of a string is its very first
character. The rightmost section of a string is its very last character. The
leftmost and rightmost elements of a string can conveniently be accessed via the
functions [`head`][head] and [`last`][last], respectively. Time for a biology
lesson with a caterpillar.

```haskell
ghci> insect = "8caterpillar-"
ghci> head insect
'8'
ghci> last insect
'-'
```

Dropping the `head` character, we would have the rest of the string, as returned
by the function [`tail`][tail]. Dropping the `last` character, we would have all
characters except the rightmost one, as returned by the function [`init`][init].
The caterpillar is fed up with being dissected. It uses the function
[`reverse`][reverse] to do a 180-degree turn and crawl away.

```haskell
ghci> insect = "8caterpillar-"
ghci> tail insect
"caterpillar-"
ghci> (head insect) : (tail insect)
"8caterpillar-"
ghci> init insect
"8caterpillar"
ghci> (init insect) ++ ((last insect) : "")
"8caterpillar-"
ghci> reverse insect
"-rallipretac8"
```

<!--=========================================================================-->

### String format

The operator `++` can be used to concatenate as well as format strings. This can
be problematic if a string includes numbers. A workaround is to use the method
[`show`][show]. Here is an example.

```haskell
ghci> name = "Tabby"
ghci> age = 2
ghci> food = "fish"
ghci> name ++ " is " ++ show age ++ " years old and likes " ++ food ++ "."
"Tabby is 2 years old and likes fish."
```

As you can see, using `++` together with `show` to format a string can be
cumbersome. The resulting code can be difficult to read. What we need is a more
convenient way of formatting strings. The package [`Text.Printf`][textPrintf]
provides functions to format strings, using the same formatting conventions as
the function [`printf`][Cprintf] in the C programming language. The format
specifier `%s` is a placeholder for a string and `%d` is a placeholder for an
integer. You can use the Haskell function [`printf`][printf] to achieve the same
output as per the above GHCi session.

```haskell
ghci> import Text.Printf
ghci> name = "Tabby"
ghci> age = 2
ghci> food = "fish"
ghci> printf "%s is %d years old and likes %s.\n" name age food
Tabby is 2 years old and likes fish.
```

We can format floating-point numbers as well. Prepare to be dazzled:

```haskell
ghci> import Text.Printf
ghci> printf "%s is yummy, but pi is %f\n" "pie" pi
pie is yummy, but pi is 3.141592653589793
```

<!--=========================================================================-->

## Exercises

:exercise: The cons operator `:` can be used for string concatenation. The left
operand of `:` is a character, whereas the right operand is a string. Can the
left operand be an empty character, i.e. `''`? Why or why not? Can the right
operand be an empty string, i.e. `""`? Why or why not?

<!-- prettier-ignore-start -->
:exercise: Rewrite the programs
:script: file="assets/src/data/age.hs", name="age.hs"
and
:script: file="assets/src/data/circle.hs", name="circle.hs"
to use the function [`printf`][printf] for string formatting.
<!-- prettier-ignore-end -->

:exercise: In the section [Splitting headache](#splitting-headache), you learnt
about destructuring a tuple. Does destructuring work with lists as well? Split
the following strings at whitespaces and destructure the results:
`"battle beetle"` and `"Peter panning gold"`.

:exercise: A phrase when abbreviated is commonly written using the uppercase of
the first letter of each word. For example, _ante meridiem_ (meaning before
noon) is abbreviated as AM, _post meridiem_ (meaning after noon) is abbreviated
as PM, and your significant other (i.e. your bae) is abbreviated as SO. Write a
program to prompt for a two-word phrase and output the abbreviation of the
phrase.

:exercise: Use one or more functions discussed in this section to extract the
following words from the string `"chopper"`: chop, hopper, cop, copper, her,
Cher.

:exercise: Write a program that prompts for a string `s`, and two integers $i$
and $j$ where $i < j$. Extract the substring in `s` between the indices $i$ and
$j$, inclusive.

:exercise: The package [`Data.Text`][dataText] should be used instead of the
type [`String`][string] whenever you require efficient text processing. Import
the package and use its functions to work through various code examples in this
section.

:exercise: Use one or more string manipulation functions discussed in this
section to extract the word "caterpillar" from the string `"8caterpillar-"`.
Repeat the exercise, but use the package [`Data.Text`][dataText].

:exercise: Write a program that prompts for a string. Exchange the first and
last characters with each other and output the resulting string. For example,
the input string `"lived"` should be transformed to `"divel"`. What happens if
you enter an empty string or a string having one character?

:exercise: Write a program that prompts for a string `s` and an integer $i$.
Remove the character at index $i$ in `s` and output the resulting string.

<!--=========================================================================-->

[^a]:
    The languages C, C++, and Java each uses single quotation marks to delimit a
    character literal.

[^b]:
    This is similar to how strings are represented in C, where a string is
    merely an array of characters.

[^c]: Ackchyually, `++` is a function.
[^d]:
    JavaScript has the [destructuring assignment syntax][jsDestructure]. The
    analogous notion in Python is [unpacking][pyUnpack].

[^e]: Like equality of vectors in mathematics. Everyone loves mathematics, yes?
[^f]:
    Use the package [`Data.Text`][dataText] to manipulate strings if performance
    is a top priority.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[char]: https://web.archive.org/web/20231128120029/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
[chicagoDailyTribune]: https://archive.org/details/per_chicago-daily-tribune_the-chicago-daily-tribun_1891-06-06_51_157/page/n3/mode/2up
[concat]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:concat
[Cprintf]: https://web.archive.org/web/20231129002029/https://en.wikipedia.org/wiki/Printf
[dataChar]: https://web.archive.org/web/20231128120029/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html
[dataString]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html
[dataText]: https://web.archive.org/web/20231120192818/https://hackage.haskell.org/package/text-2.1/docs/Data-Text.html
[drop]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:drop
[fst]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fst
[head]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:head
[import]: https://web.archive.org/web/20231128054800/https://wiki.haskell.org/Import
[init]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:init
[jsDestructure]: https://web.archive.org/web/20231201211455/https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
[last]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:last
[length]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:length
[lines]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:lines
[plusplus]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-43--43-
[printf]: https://web.archive.org/web/20231128101446/https://hackage.haskell.org/package/base-4.19.0.0/docs/Text-Printf.html#v:printf
[pyUnpack]: https://web.archive.org/web/20231130001457/https://docs.python.org/3/tutorial/controlflow.html#unpacking-argument-lists
[reverse]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:reverse
[show]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:show
[snd]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:snd
[splitAt]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:splitAt
[string]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#t:String
[tail]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:tail
[take]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:take
[textPrintf]: https://web.archive.org/web/20231128101446/https://hackage.haskell.org/package/base-4.19.0.0/docs/Text-Printf.html
[unlines]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:unlines
[unwords]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:unwords
[words]: https://web.archive.org/web/20231128114047/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-String.html#v:words
<!-- prettier-ignore-end -->

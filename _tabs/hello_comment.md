---
title: Any comments?
order: 4
---

> Any fool can write code that a computer can understand. Good programmers write
> code that humans can understand.\
> -- Martin Fowler. _Refactoring: Improving the Design of Existing Code_[^a]

Great code must balance various tensions. It should be comprehensible to a human
reader as well as being self-documenting. You and I are not coding geniuses
(yet). We should strive to document the Haskell code we write and document it
well.

<!--=========================================================================-->

## Single-line comments

A single-line Haskell comment starts with the double dash symbol `--`. The
"Hello, world" program from the section [Tales from the script][taleScript] can
be documented like so:

[`hello-single.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/hello/hello-single.hs)
```haskell
-- The traditional greeting.
main = print "Hello, world"
```

The double dash `--` can be used for multiline comments. All you need to do is
prefix each comment line with `--`. Haskell offers another way to insert
multiline comments.

<!--=========================================================================-->

## Multiline comments

Some programming languages offer a way to comment multiple lines.[^b] Haskell is
no exception. The beginning of a multiline Haskell comment is marked by the
symbol `{-`. The end of the multiline comment is designated by `-}`. Here is the
"Hello, world" program accompanied by a multiline comment.

[`hello-multi.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/hello/hello-multi.hs)
```haskell
{-
This is the first program you would write when you learn a programming
language.  This traditional program is called the "Hello, world" program.
-}
main = print "Hello, world"
```

<!--=========================================================================-->

## When in Rome...

The GHC project has its own tool to automatically extract documentation from
Haskell source files. The utility expects you to document your Haskell code
using various annotations. The very first documentation line of a function is
annotated as `-- |`, i.e. the double dashes followed by a whitespace and the
pipe symbol. Each subsequent line of documentation is prefixed by `--`. Here is
the "Hello, world" program annotated according to the Haskell way of
documentation.

[`hello-doc.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/hello/hello-doc.hs)
```haskell
-- | This is the first program you would write when you learn a
-- programming language.  This traditional program is called the
-- "Hello, world" program.  This documentation style is used by the GHC
-- project to document Haskell source code.
main = print "Hello, world"
```

<!--=========================================================================-->

## Why document?

A computer will ignore your comments. Why bother inserting comments in your
Haskell source files? The usual reason is documentation. A computer executes
your Haskell code, but it is a human (most probably yourself) who would be
reading and trying to understand the code at some future time. You write code
not just for a computer, but for other humans as well.

Imagine you are trying to solve a programming problem. You struggle for a few
hours, maybe a few days or weeks. After a while, you find a clever solution and
implement it in Haskell code. The code works and outputs the correct result. You
move on to another problem or some other challenge. Some time passed, probably a
few weeks or months. You come back to the code for the clever solution and have
forgotten how or why the code works. Reading the code gives you some hints, but
you still struggle to remember the name of the technique you used. If only you
had written at least a one-line comment to explain the technique.

The above situation is contrived, absolutely. The message is clear: document
your code. Even if it is a one-line comment, use that single line to note the
name of the (tricky or clever) technique the code is implementing.

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> Software documentation is more than just commenting your programming code. You
need to know the type of documentation you are reading or writing. Is it a
tutorial, an exposition, a how-to guide, or a reference manual? Learn more about
different [types of documentation][docSystem].
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> Writing software documentation is difficult. But do not despair. The
[Write the Docs][writeDocs] project has a [beginner's guide][writeDocsGuide] to
help you get started. Browse through the guide for tips on how to begin
documenting your (first) project.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> The GHC project uses a tool called [Haddock][haddock] to extract documentation
from annotated Haskell source files. Learn more about [Haddock][haddock]. In
particular, you might want to browse the section on how to annotate and markup
your Haskell source code.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> Let's see how the function [`print`][print] is documented. Load the page for the
API documentation of [`print`][print]. Locate a link called `Source`. Click on
the link to open the page that contains the corresponding
[source code of `print`][printSrc]. Take a moment to examine how the source code
of [`print`][print] is annotated and documented.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

[^a]:
    Martin Fowler. _Refactoring: Improving the Design of Existing Code_, 2nd
    edition. Pearson Education, 2019, p.10.

[^b]:
    C, C++, Java, and JavaScript all use the delimiters `/*` and `*/` to mark
    the beginning and end, respectively, of a multiline comment. Python uses the
    triple single quotation marks `'''` (or the triple double quotation marks
    `"""`) to delimit the start and end of a multiline comment.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[docSystem]: https://web.archive.org/web/20231128182201/https://documentation.divio.com
[haddock]: https://haskell-haddock.readthedocs.io/en/latest/
[print]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:print
[printSrc]: https://hackage.haskell.org/package/base-4.19.0.0/docs/src/System.IO.html#print
[taleScript]: ../hello_friend/#tales-from-the-script
[writeDocs]: https://www.writethedocs.org
[writeDocsGuide]: https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/
<!-- prettier-ignore-end -->

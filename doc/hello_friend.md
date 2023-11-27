---
title: Say hello to my little friend
---

In this section, you will write the traditional "Hello, world" program. This
section assumes you have an environment setup on your computer where you can
write, compile, and execute Haskell code. Refer to the section [Glasgow Haskell
Compiler][ghc] for general guidance.

<!--========================================================================-->

## GHCi

Open a terminal or command window in your operating system. Type the command
`ghci` to load the interactive version of GHC, called GHCi. GHCi is a REPL
(Read-Eval-Print-Loop) environment for Haskell. The character `i` means
interactive. Your terminal would show something like below.

```sh
$ ghci
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
ghci>
```

The first line shows the executable that loads GHCi. Do not worry about the
second line. It merely shows various basic information about GHC. The third
line, i.e. `ghci>`, is the prompt. You are meant to type Haskell code, or GHCi
commands, following the character `>`. Some versions of GHCi would show their
prompts as `Prelude>` when you run `ghci`.

<!--========================================================================-->

## 'Allo 'Allo!

The "Hello, world" program is the traditional[^a] first program you would write
when learning a programming language. Let's succumb to peer pressure and write
your first program in Haskell.

Enough with the boring introduction. How would you get Haskell to print the
string `"Hello, world"`? Use the function [`print`][print]. Here is a sample
terminal session:

```sh
ghci> print "Hello, world"
"Hello, world"
```

So far so good.

Some people dislike quotation marks in a printed string. Use the function
[`putStr`][putStr] to print a string to standard output, without including the
quotation marks.

```sh
ghci> putStr "Hello, world"
Hello, worldghci>
```

The function [`putStr`][putStr] does indeed print a string and exclude quotation
marks. However, as the above terminal session shows, [`putStr`][putStr] does not
include a newline character after printing the string, like the function
[`print`][print] does. What we need is the best of both worlds. The function
[`putStrLn`][putStrLn] can:

1. Print a string to standard output.
1. Exclude quotation marks.
1. Include a newline character at the end of the printed string.

Here is a sample terminal session:

```sh
ghci> putStrLn "Hello, world"
Hello, world
```

<!--========================================================================-->

[^a]: Tradition is peer pressure from dead (and living) people.

<!--========================================================================-->

[ghc]: ../hello_ghc

<!-- prettier-ignore -->
[print]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:print

<!-- prettier-ignore -->
[putStr]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:putStr

<!-- prettier-ignore -->
[putStrLn]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:putStrLn
[python]: https://www.python.org

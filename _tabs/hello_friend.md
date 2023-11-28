---
title: Say hello to my little friend
order: 3
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

## Tales from the script

The Haskell REPL, i.e. GHCi, is suitable for quick experimentation. Sooner or
later you would want to store Haskell code in a text file. Create a text file
called `hello.hs` and place the following code in the file:

[`hello/hello.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/hello/hello.hs)
```haskell
main = print "Hello, world"
```

Ignore the code segment `main = `. We will discuss that later on in the section
[The `main` function](#the-main-function).

Now use GHC to compile your source file to machine code. The compiler is called
`ghc`. The following terminal session demonstrates the compilation and execution
process.

```sh
$ cat hello.hs
main = print "Hello, world"
$ ghc hello.hs
[1 of 1] Compiling Main             ( hello.hs, hello.o )
Linking hello ...
$ ls
hello  hello.hi  hello.hs  hello.o
$ ./hello
"Hello, world"
```

For our purposes, the important files shown in the above terminal session are:

-   `hello.hs` -- The source file.
-   `hello` -- The executable file, in machine code.

The other files generated by the compiler should not be of concern at the
moment.

You can also load your source file from within GHCi. At the REPL prompt, use the
command [`:load`][load] to load your source file. The command can be shortened
as `:l` with a lowercase version of L. The above terminal session can be
achieved within GHCi as follows:

```sh
ghci> :load hello.hs
[1 of 1] Compiling Main             ( hello.hs, interpreted )
Ok, one module loaded.
ghci> main
"Hello, world"
```

Notice that GHCi does not compile the provided source file. In fact, GHCi
interprets the given source file. This feature of GHCi is similar to programming
languages that offer a REPL environment.[^b]

<!--========================================================================-->

## The `main` function

Recall the "Hello, world" program from the section
[Tales from the script](#tales-from-the-script), reproduced below:

[`hello/hello.hs`](https://github.com/quacksouls/haskyll/blob/main/assets/src/hello/hello.hs)
```haskell
main = print "Hello, world"
```

The program creates a function called `main`. The body of the function is the
line:

`print "Hello, world"`

which is assigned as the definition of `main` via the assignment operator `=`.
The function `main` has a special meaning in Haskell.[^c] The function is the
entry point of your program. Execution starts from the function `main`. The
function, if it exists, is automatically called whenever you run the compiled
binary file or load your source file into GHCi.

<!--========================================================================-->

[^a]: Tradition is peer pressure from dead (and living) people.
[^b]:
    For example, the REPL environment of the [Python][python] programming
    language or the enhanced interactive shell provided by [IPython][ipython].

[^c]:
    Various other programming languages have a `main` function. Prominent
    examples include C, C++, and Java.

<!--========================================================================-->

[ghc]: ../hello_ghc
[ipython]: https://ipython.org

<!-- prettier-ignore -->
[load]: https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html#ghci-cmd-:load

<!-- prettier-ignore -->
[print]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:print

<!-- prettier-ignore -->
[putStr]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:putStr

<!-- prettier-ignore -->
[putStrLn]: https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:putStrLn
[python]: https://www.python.org
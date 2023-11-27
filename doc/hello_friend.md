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

[ghc]: ../hello_ghc

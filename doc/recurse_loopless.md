---
title: No loop for you
math: true
---

> To iterate is human, to curse a bug divine.

In this section, you will meet some functions that allow you to perform various
kinds of loop. The function you use for looping depends on what you want to
accomplish. Do you want to loop over a list and print each element to standard
output? Do you want to apply a function to each element of a list? Or, more
generally, do you want to perform an action a given number of times? Read on to
learn how to loop without looping.

<!--=========================================================================-->

## One, two, skip a few

Many programming languages have a looping mechanism to allow you to repeat a
block of code a certain number of times. The following C code uses the `for`
loop to output all integers from 1 to 10, inclusive:

:include: file="assets/src/recurse/ten.c", name="ten.c", line=25:-

The same thing can be accomplished in JavaScript as follows:

:include: file="assets/src/recurse/ten.js", name="ten.js", line=25:-

Here's a Python version:

:include: file="assets/src/recurse/ten.py", name="ten.py", line=25:-

Haskell does not have a `for` loop _per se_. Recursion is the only looping
mechanism. However, the function [`for_`][for_] allows us to write a looping
construct similar to the `for` loop in C, JavaScript, Python and many other
languages. Observe:

:include: file="assets/src/recurse/ten.hs", name="ten.hs", line=25:-

What does the code segment `\x -> do` mean? Why did we write `\x`? All will be
revealed in the next section.

<!--=========================================================================-->

## Who's anonymous?

> _Babe:_ Baa-ram-ewe. Baa-ram-ewe. To your breed, your fleece, your clan be
> true. Sheep be true. Baa-ram-ewe.\
> --- _Babe_, 1995

<!-- prettier-ignore-start -->
In the program
:script: file="assets/src/recurse/ten.hs", name="ten.hs", line=25:-
shown at the end of the previous section, we used the function [`for_`][for_]
to write a loop that prints all integers between 1 and 10, inclusive. The loop
uses the symbol `\x`, something we have not seen before. It is the symbol `\`
that interests us.
<!-- prettier-ignore-end -->

The symbol `\` is the start of a lambda expression, also called [anonymous
function][anonymousFunction]. A lambda expression allows us to define a short
function that is used once, without having to give the function a name. Here is
the general template for a lambda expression:

```haskell
\x -> expression
```

The symbol `\` is read as "lambda" because it looks similar to the Greek letter
$\lambda$.[^a] The symbol `x` is the parameter of our lambda expression. We are
not restricted to `x` as the parameter name. We could also write
`\a -> expression` as well. The arrow symbol `->` separates the lambda
declaration `\x` on its left-hand side and the function definition `expression`
on its right-hand side. An example or two should help to clarify how to define
and use lambda expressions.

Recall the following program from the section [DIY](../decide_function/#diy):

:include: file="assets/src/decide/negate.hs", name="negate.hs", line=27:29

Here is the same function as a lambda expression:

```haskell
ghci> (\x -> -1 * x) 5
-5
ghci> (\x -> -1 * x) (-5)
5
ghci> (\x -> -1 * x) $ -5
5
ghci> (\x -> -1 * x) $ -4.2
4.2
ghci> (\x -> -1 * x) 12
-12
```

The following program:

:include: file="assets/src/decide/upper.hs", name="upper.hs", line=25:30

from the section [DIY](../decide_function/#diy) is translated to a lambda
expression as:

```haskell
ghci> import Data.Char
ghci> (\x -> (toUpper $ head x) : tail x) "ayyy!"
"Ayyy!"
ghci> (\x -> (toUpper $ head x) : tail x) "to bee or not two bees"
"To bee or not two bees"
ghci> (\x -> (toUpper $ head x) : tail x) "42 is a number"
"42 is a number"
```

<!-- prettier-ignore-start -->
It should be clear by now that the program
:script: file="assets/src/recurse/ten.hs", name="ten.hs"
from the section [One, two, skip a few](#one-two-skip-a-few) uses a lambda
expression. Don't let the keyword `do` fool you. The keyword `do` allows us to
write a block of sequential code as if we are programming in a language such as
C, JavaScript, or Python. We could also have written the program like so:
<!-- prettier-ignore-end -->

```haskell
ghci> import Data.Foldable
ghci> for_ [1 .. 10] $ \x -> putStrLn $ show x
1
2
3
4
5
6
7
8
9
10
```

The question now is: Why did we pass a lambda expression to the function
[`for_`][for_]?

<!--=========================================================================-->

## Hoogle map

Functions in Haskell are higher-order functions. This means that a Haskell
function has the following properties:

1. Can accept a function as a parameter.
1. Can output a function as a result.

We are only interested in the first property. A discussion of the second
property will be delegated to another section.

The function [`map`][map] is useful for demonstrating that a function can be
passed as parameter to another function. The function `map` has two parameters:

-   A function $f$ that has parameters.
-   A list $\ell = [a_1, a_2, \dots, a_n]$ of arguments to pass to $f$.

The function `map` will pass each element of $\ell$ to $f$, one at a time. It is
as if we apply $f$ to each element of $\ell$, i.e. the function application
`f a_i`. The output of `map` is a list of the results of the function
application:

```haskell
[f a_1, f a_2, ..., f a_n]
```

As an example, suppose you want a function that adds 1 to each number in a list.
The function below accomplishes the task:

:include: file="assets/src/recurse/one.hs", name="one.hs", line=27:30

Note that in its definition, the function `addOne` has to take care of iterating
over its input list. Furthermore, the function has to construct its list of
results, appending one result at a time. The function `map` takes care of the
above two tasks for us. Our task is to define a function that takes a number,
add 1 to the number, and output the result. Here is `map` in action:

```haskell
ghci> map (+1) [1 .. 10]
[2,3,4,5,6,7,8,9,10,11]
ghci> map (\x -> x + 1) [1 .. 10]
[2,3,4,5,6,7,8,9,10,11]
```

Let's capitalize each name:

```haskell
ghci> import Data.Char
ghci> map (\str -> (toUpper $ head str) : tail str) ["ava", "bella", "cleo"]
["Ava","Bella","Cleo"]
```

Below, we reverse various strings:

```haskell
ghci> map reverse ["Anna", "def", "live"]
["annA","fed","evil"]
ghci> map reverse ["Was it a car or a cat I saw?", "racecar"]
["?was I tac a ro rac a ti saW","racecar"]
```

And concatenating some strings:

```haskell
ghci> map (\(s, t) -> s ++ t) [("pre", "view"), ("re", "do"), ("anti", "c")]
["preview","redo","antic"]
```

<!--=========================================================================-->

## Coffee filter

You have a list some of whose elements you want to keep, while the remaining
elements should be discarded. A simple solution would be to iterate over each
element and test whether to keep the element. Fortunately, you do not have to
write your own function to discard the elements you do not want. Haskell has the
higher-order function [`filter`][filter] to do exactly as described above. The
function `filter` has two parameters:

-   A predicate $p$, otherwise known as a function that takes an input and
    outputs a boolean value. This is the test function. The purpose of the
    predicate is to check whether or not you want to retain a given value. The
    result of the predicate should be `True` if you want to keep a value and
    `False` otherwise.
-   A list $\ell$, each of whose elements is to be tested against the predicate.
    Some elements of the list should be discarded. It is the job of the
    predicate to help us remove those unwanted elements.

The function `filter` outputs a sublist of $\ell$ containing those elements of
$\ell$ that pass the predicate $p$. The above seems more complicated than it
should be. The following examples should clarify how to use `filter`.

<!--=========================================================================-->

### Even or odd?

You have a list of integers between 1 and 10, inclusive. You want to keep the
even integers. To use `filter` to retain the even integers, you must define a
predicate. The predicate takes an integer and outputs `True` if the integer is
even, `False` otherwise. The value `True` is a signal that `filter` should
retain whichever value resulted in the predicate outputting `True`. On the other
hand, `filter` would use the value `False` to ignore whichever value resulted in
the predicate outputting `False`. Testing whether or not an integer is even is a
rather straightforward task. A lambda expression would suffice as a predicate.
We do not need to write a function with type signature. On the other hand, the
library function [`even`][even] already does the job of the predicate we
require. The GHCi session below summarizes our discussion:

```haskell
ghci> ell = [1 .. 10]
ghci> filter (\x -> mod x 2 == 0) ell
[2,4,6,8,10]
ghci> filter even ell
[2,4,6,8,10]
```

<!--=========================================================================-->

### No sweat, my pet?

You might ask: Why the obsession with numbers? How about an example relating to
pets. You are developing a database of pet names. As a prototype, you have the
following list of names:

:include: file="assets/src/recurse/pet.hs", name="pet.hs", line=29:50

Being in the mood for vitamin C, you want a list of pet names that begin with
"C". The problem boils down to testing whether a string starts with another
string. The function [`isPrefixOf`][isPrefixOf] is perfect for the job. In
general, you want a function that, given a prefix `prefix`, outputs all pet
names that begin with `prefix`. Refer to the following Haskell code:

:include: file="assets/src/recurse/pet.hs", name="pet.hs", line=52:54

<!--=========================================================================-->

## A loop for output

Refer back to the question at the end of the section
[Who’s anonymous?](#whos-anonymous). The function [`for_`][for_] is a
higher-order function, which is why it accepts a function as a parameter.
Whereas [`map`][map] takes a function and a list of arguments (in that order),
`for_` is like `map` with its parameters flipped around. The function `for_`
takes a list of arguments and a function, in that order. Major differences
certainly exist between `map` and `for_`, but we won't discuss the differences
in any detail. We are interested in one difference between the two functions.

The function `map` does not allow us to print to standard output, whereas `for_`
can be used to print to standard output. Despite their differences and
individual limitations, the two functions together allow us to solve many
looping problems. For example, consider the following lists of [average
weights][oceaniaAverageWeight] of adult female and male within Oceania:
Australia/New Zealand, Polynesia, Melanesia, Micronesia (in that order). Each
weight value is given in kilograms.

```haskell
female = [73.1, 87.3, 64.6, 78.9]
male = [88.4, 93.8, 68.1, 82.7]
```

We want to convert each weight to pounds and print each result to standard
output. The conversion to pounds can be done using `map`. We then use the
function `for_` to print each pound value to standard output. Here's our code:

:include: file="assets/src/recurse/weight.hs", name="weight.hs", line=25:-

<!--=========================================================================-->

## Random numbers

In this section, we consider random numbers and how to generate a bunch of
random numbers. The function that allows us to perform an action a certain
number of times is `replicateM`. Using `replicateM`, we can perform actions
other than generating random numbers, e.g. repeating a function call as many
times as we want.

<!--=========================================================================-->

### Guess the number

Alice and Bob are playing a game of guess the number. Alice chooses an integer
between 1 and 10, inclusive, and does not reveal the chosen number to Bob. Bob
has three attempts to guess the number. Bob thinks he is pretty good at the game
because in most of the previous games he was able to pick a correct answer
within two guesses. However, this time Alice uses a program to help her choose a
random integer. A little bit of randomness would add an extra layer of
difficulty to the game. Here is one of Alice's GHCi sessions:

```haskell
ghci> import System.Random.Stateful
ghci> n <- uniformRM (1, 10) globalStdGen :: IO Int
ghci> :type n
n :: Int
ghci> n
4
```

Let's unpack the line:

```haskell
n <- uniformRM (1, 10) globalStdGen :: IO Int
```

The package [`random`][random] provides various functions to generate
pseudorandom numbers. The function [`globalStdGen`][globalStdGen] is a global
pseudorandom number generator (PRNG). Given a tuple of numbers $(a,\, b)$, the
function [`uniformRM`][uniformRM] generates a random number between $a$ and $b$,
inclusive, by using the global PRNG `globalStdGen`. The segment `:: IO Int`
means that we want the result to be of type `IO Int`. We use the symbol `<-` to
extract the `Int` value and assign the value to `n`. If we want the output to be
of type `IO Integer`, we could have written:

```haskell
n <- uniformRM (1, 10) globalStdGen :: IO Integer
```

so that `n` would be assigned a number of type `Integer`. The above line can be
simplified to:

```haskell
n <- uniformRM (1, 10) globalStdGen
```

to achieve the same effect. Good luck to you, Bob, in your attempt to beat a
PRNG.

<!--=========================================================================-->

### Toss the die

Alice and Bob now decide to play dice. Each person rolls a die six times and
adds up the results of the six rolls. The player who has the highest sum wins.
Alice has written the program below to automate the gameplay.

:include: file="assets/src/recurse/dice.hs", name="dice.hs", line=25:-

The functions that interest us are [`sum`][sum] and [`replicateM`][replicateM].
The function `sum` takes a list of numbers and add all the numbers together.
Simple as 1, 2, 3:

```haskell
ghci> sum [1, 2, 3]
6
ghci> [1 .. 10]
[1,2,3,4,5,6,7,8,9,10]
ghci> sum [1 .. 10]
55
ghci> [1, 3 .. 10]
[1,3,5,7,9]
ghci> sum [1, 3 .. 10]
25
ghci> [2, 4 .. 10]
[2,4,6,8,10]
ghci> sum [2, 4 .. 10]
30
```

<!--=========================================================================-->

#### Replicate

The function `replicateM` is rather more complex than `sum`. It is more general
than the basic function [`replicate`][replicate]. Understanding how `replicate`
works would help us understand how to use `replicateM`.

The function `replicate` takes an integer `n` of type `Int` and a value `x` of
any type, and outputs a list of length `n` where each element of the list is
`x`. How would `replicate` be useful and in which situations? I don't know.
Let's consider some examples. An overly friendly person would do this:

```haskell
ghci> replicate 5 "hello"
["hello","hello","hello","hello","hello"]
```

Your hungry cat would say this:

```haskell
ghci> replicate 10 "meow"
["meow","meow","meow","meow","meow","meow","meow","meow","meow","meow"]
```

Your mathematical friends might find the following useful:

```haskell
ghci> replicate 4 $ replicate 4 0 -- 4 x 4 zero matrix
[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
ghci> replicate 5 $ replicate 3 1 -- 5 x 3 matrix of ones
[[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1]]
```

The function `replicateM` works similarly to `replicate`. The function
`replicateM` takes an integer `n` of type `Int` and an action `act`, and
performs the action `act` for `n` times. Your chatty cat might say this:

```haskell
ghci> import Data.Foldable
ghci> for_ [1..3] (\_ -> putStrLn "meow")
meow
meow
meow
```

However, it might prefer to use `replicateM`:

```haskell
ghci> import Control.Monad
ghci> replicateM 3 $ putStrLn "meow"
meow
meow
meow
[(),(),()]
ghci> replicateM_ 3 $ putStrLn "meow"
meow
meow
meow
```

The version [`replicateM_`][replicateM_] with the underscore character `_`
ignores the result, which is why it suppresses the list `[(),(),()]`, unlike
`replicateM`.

Let's return to our function for rolling a die a given number of times. In
particular, consider the line:

:include: file="assets/src/recurse/dice.hs", name="dice.hs", line=31:31

The code `uniformRM (1, 6) globalStdGen :: IO Int` outputs a PRNG , which can be
called to generate a random integer between 1 and 6, inclusive. Thus,
`replicateM` repeatedly calls the given PRNG as many times as required, each
call generating a random number.

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
The list below shows the temperatures in Fahrenheit of a particular city, during
a week.
<!-- prettier-ignore-end -->

```haskell
[79, 84, 76, 70, 66, 62, 61]
```

Use `map` to help you convert each temperature value to Celsius.

<!-- prettier-ignore-start -->
:exercise:
Use `map` and/or lambda expression to define the following:
<!-- prettier-ignore-end -->

1.  A function that outputs a list of the first $n$ positive even numbers.
1.  A function that outputs a list of the first $n$ positive odd numbers.
1.  A function that squares a number.
1.  A function that halves an integer if it is even, otherwise add 1 to the
    integer.

<!-- prettier-ignore-start -->
:exercise:
The [table below][planetGravity] shows the gravity of each heavenly body in the
Solar System as a multiple of the gravity of Earth. If a person weighs $x$
pounds on Earth and a heavenly body has a multiple $m$ of Earth's gravity, then
the person would weigh $xm$ pounds on that body. According to the US
[Centers for Disease Control and Prevention][CDC] (CDC), an adult male in the
USA has an average weight of 199.8 pounds and an adult female has an average
weight of 170.8 pounds. These are statistics for adults 20 years and older. Use
`map` to calculate the weight of an adult on the various heavenly bodies listed
below. Present your results both in pounds and in kilograms.
<!-- prettier-ignore-end -->

| Body    | Multiple of Earth’s gravity |
| :------ | :-------------------------- |
| Mercury | 0.38                        |
| Venus   | 0.91                        |
| Earth   | 1                           |
| Moon    | 0.166                       |
| Mars    | 0.38                        |
| Jupiter | 2.34                        |
| Saturn  | 1.06                        |
| Uranus  | 0.92                        |
| Neptune | 1.19                        |
| Pluto   | 0.06                        |

<!-- prettier-ignore-start -->
:exercise:
The pets database below includes the name of a pet and its age. Two problems
exist in the database:
<!-- prettier-ignore-end -->

1. Each age is represented as a string. Age should be represented as an integer.
1. The database has not been updated since last year. Each age should increment
   by 1.

```haskell
database =
    [ ("Anonymouse", "1")
    , ("Charlie Chihuahua", "2")
    , ("Chirp O'Tweet", "1")
    , ("Frankie Frankfurt", "2")
    , ("Garry Longtongue", "1")
    , ("Goldie Horn", "1")
    , ("Hamsuke Hamton", "1")
    , ("Harry Speedbump", "2")
    , ("Robbie Hopster", "1")
    , ("Scratchy Meowser", "3")
    , ("Tabby Whiskers", "2")
    , ("Terry Terrier", "2")
    , ("Woofy McBark", "3")
    ]
```

Write a program to correct the above two issues in the pets database.

<!-- prettier-ignore-start -->
:exercise:
Write a function to simulate the flip of a coin $n$ times. Determine the
fraction of heads in 100 flips of a coin. In theory, a fair coin should give you
the same chance of obtaining heads as tails. Use your function to toss a coin a
large number of times and report on the fraction of heads you obtain. The
fraction should be 0.5 or close to that value.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
To generate random floating-point numbers between 0 and 1, inclusive, we can use
the code:
<!-- prettier-ignore-end -->

```haskell
ghci> import System.Random.Stateful
ghci> uniformRM (0 :: Double, 1 :: Double) globalStdGen
6.843028547738073e-2
ghci> uniformRM (0 :: Double, 1 :: Double) globalStdGen
0.6394135102399352
ghci> uniformRM (0 :: Double, 1 :: Double) globalStdGen
0.38650239419241794
```

It is simpler to use the function [`uniformDouble01M`][uniformDouble01M]:

```haskell
ghci> import System.Random.Stateful
ghci> uniformDouble01M globalStdGen
0.18284067219920286
ghci> uniformDouble01M globalStdGen
0.517526326563552
ghci> uniformDouble01M globalStdGen
0.4764826378654226
```

A test has a 75% success rate. Use the function `uniformDouble01M` to simulate
the result of the test for 100 people. For your simulated results, calculate the
fraction of people who pass the test.

<!-- prettier-ignore-start -->
:exercise: label="ex_gcd_subtraction"
The [greatest common divisor][greatestCD] (GCD) of two integers is the largest
factor of both integers. In this exercise, we consider only non-negative
integers. Euclid showed that if $a$ and $b$ are positive integers such that
$a > b$, the GCD of $a$ and $b$, written as $\gcd(a,\, b)$, is the same as the
GCD of $a - b$ and $b$. Euclid's algorithm calculates the GCD by successive
subtraction of the smaller integer from the larger integer. At the $i$-th step,
suppose we have $a_i$ and $b_i$ with $a_i > b_i$. The pair for the $(i+1)$-st
step is
<!-- prettier-ignore-end -->

$$
a_{i+1}
=
\max(a_i - b_i,\, b_i),
\qquad
b_{i+1}
=
\min(a_i - b_i,\, b_i)
$$

and we have $\gcd(a_i,\, b_i) = \gcd(a_{i+1},\, b_{i+1})$. Eventually at some
step $k$ we obtain $a_k = b_k$ and therefore $\gcd(a,\, b) = a_k = b_k$.
Implement Euclid's algorithm. Generate random pairs of positive integers and
calculate the GCD of each pair. Test your implementation against the function
[`gcd`][gcd].

<!-- prettier-ignore-start -->
:exercise:
This exercise considers positive factors of an integer $n > 0$.
<!-- prettier-ignore-end -->

1. Write a program that scans through all integers from 1 up to and including
   $n$, testing each integer to see whether it is a factor of $n$. Return a list
   of all positive factors of $n$.
1. Improve the above technique as follows. Let $1 < k \leq \sqrt{n}$ be a factor
   of $n$. Then $n / k$ is also a factor of $n$. Thus you only need to search
   through all integers from 1 up to and including
   $\left\lceil \sqrt{n} \right\rceil$. Use the latter technique to determine
   all positive factors of $n$.
1. Using the function [`filter`][filter], write a function that outputs all
   [prime numbers][primeNumbers] between 1 and $n$, inclusive. You might find
   the function [`all`][all] useful.

<!-- prettier-ignore-start -->
:exercise:
Let's play some word games.
<!-- prettier-ignore-end -->

1. A [pangram][pangram] is a sentence that uses every letter of the English
   alphabet. The case of a letter does not matter. A famous pangram is the
   sentence, "The quick brown fox jumps over the lazy dog." Write a function to
   determine whether a given sentence is a pangram.
1. A [univocalic][univocalic] is a word, sentence, or piece of writing that uses
   only one vowel of the English alphabet. An example is a poem by C. C.
   Bombaugh written in 1890 and using only the vowel "O". Here are two lines
   from the poem:

    > No cool monsoons blow soft on Oxford dons,\
    > Orthodox, jog-trot, book-worm Solomons

    Another example is Cathy Park Hong's poem ["Ballad in A"][balladInA], which
    uses only the vowel "A" (save for one word). See whether you can spot the
    exception in the poem. Write a function to determine whether a string is
    univocalic.

1. A [supervocalic][supervocalic] is a word, phrase, or proper noun that
   contains each of the vowels "A", "E", "I", "O", "U" exactly once.[^b]
   Examples include "cauliflower", "oriental rug", and "au revoir". Supervocalic
   proper nouns include [Constance Cummings][constanceCummings], [Irmgard
   Flügge-Lotz][irmgardFluggeLotz], [Austin Powers][austinPowers], and [Hugo
   Weaving][hugoWeaving]. Write a function to determine whether a string is
   supervocalic.

<!-- prettier-ignore-start -->
:exercise:
In this exercise, you will implement a simple guess-the-number game. The game
takes two positive integers $a$ and $b$, where $a < b$, and chooses a random
integer $n$ from the range $[a,\, b]$. Now you must guess the chosen number.
Enter your guess $g$. If $g = n$, then the game ends. Otherwise, output whether
$g$ is higher or lower than $n$, and enter another guess.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

[^a]:
    The symbol `\` also looks similar to the Chinese character 入. Why is `\`
    not pronounced as "rù" like in Mandarin?

[^b]:
    The word "supervocalic" was coined by Eric W. Chaikin in the paper: Eric W.
    Chaikin. AEIOU: Supervocalics in Webster's Third. _Word Ways_, volume 33,
    issue 4, 2000. The concept was already known long before Chaikin created the
    word to describe the concept. See the article by [Susan Thorpe][Thorpe1999].

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[all]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:all
[anonymousFunction]: https://web.archive.org/web/20231203074524/https://en.wikipedia.org/wiki/Anonymous_function
[austinPowers]: https://web.archive.org/web/20231206120010/https://en.wikipedia.org/wiki/Austin_Powers_(character)
[balladInA]: https://web.archive.org/web/20231127170513/https://www.poetryfoundation.org/poetrymagazine/poems/53500/ballad-in-a
[CDC]: https://web.archive.org/web/20231216104909/https://www.cdc.gov/nchs/fastats/body-measurements.htm
[constanceCummings]: https://web.archive.org/web/20231204021053/https://en.wikipedia.org/wiki/Constance_Cummings
[even]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:even
[filter]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:filter
[for_]: https://web.archive.org/web/20231128114100/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Foldable.html#v:for_
[gcd]: https://web.archive.org/web/20231216113250/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:gcd
[globalStdGen]: https://web.archive.org/web/20231219044923/https://hackage.haskell.org/package/random-1.2.1.1/docs/System-Random-Stateful.html#v:globalStdGen
[greatestCD]: https://web.archive.org/web/20231213173440/https://en.wikipedia.org/wiki/Greatest_common_divisor
[hugoWeaving]: https://web.archive.org/web/20231217100604/https://en.wikipedia.org/wiki/Hugo_Weaving
[irmgardFluggeLotz]: https://web.archive.org/web/20231227030330/https://en.wikipedia.org/wiki/Irmgard_Fl%C3%BCgge-Lotz
[isPrefixOf]: https://web.archive.org/web/20231223101221/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-List.html#v:isPrefixOf
[map]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:map
[oceaniaAverageWeight]: https://web.archive.org/web/20231207093639/https://www.worlddata.info/average-bodyheight.php
[pangram]: https://web.archive.org/web/20231213121652/https://en.wikipedia.org/wiki/Pangram
[planetGravity]: https://web.archive.org/web/20231218075802/https://www.calctool.org/astrophysics/weight-other-planets
[primeNumbers]: https://web.archive.org/web/20231223022623/https://en.wikipedia.org/wiki/Prime_number
[random]: https://web.archive.org/web/20231130072459/https://hackage.haskell.org/package/random
[replicate]: https://web.archive.org/web/20231216113250/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:replicate
[replicateM]: https://web.archive.org/web/20231219074438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Control-Monad.html#v:replicateM
[replicateM_]: https://web.archive.org/web/20231219074438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Control-Monad.html#v:replicateM_
[sum]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:sum
[supervocalic]: https://web.archive.org/web/20231227023909/https://everything2.com/title/supervocalic
[Thorpe1999]: https://web.archive.org/web/20231227024553/https://wordways.com/thorpe99.html
[uniformDouble01M]: https://web.archive.org/web/20231219044923/https://hackage.haskell.org/package/random-1.2.1.1/docs/System-Random-Stateful.html#v:uniformDouble01M
[uniformRM]: https://web.archive.org/web/20231219044923/https://hackage.haskell.org/package/random-1.2.1.1/docs/System-Random-Stateful.html#v:uniformRM
[univocalic]: https://web.archive.org/web/20231223084026/https://en.wikipedia.org/wiki/Univocalic
<!-- prettier-ignore-end -->

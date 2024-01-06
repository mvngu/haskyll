---
title: Bool-like
math: true
order: 26
---

The boolean operators `&&` and `||` take boolean values as their operands.
Sometimes you want to apply a boolean operator to a list of boolean values.
Writing something like `a && b && c && d && e` can quickly become unwieldy and
tedious. What you want are versions of `&&` and `||` that can operate on lists,
not necessarily of boolean values. Well, this is your lucky day. For a limited
time only starting from now to eternity, you can use various functional versions
of your favourite boolean operators. Too good to be `True`? Au contraire, mon
ami(e).

<!--=========================================================================-->

## and

The function [`and`][and] outputs `True` if all elements of a list are `True`,
and `False` otherwise. It is the function counterpart of the operator `&&`. The
function `and` is useful when we want to know whether all elements of a list
satisfy a given property. For example, below we check whether all elements of a
list are even.

```haskell
ghci> and [even x | x <- [1 .. 10]]
False
ghci> and [even x | x <- [2, 4 .. 10]]
True
ghci> and [even x | x <- [1, 3 .. 10]]
False
```

Pietro manages a pet shop. As part of his monthly routine, Pietro checks to see
whether all pets in his shop have had a health check within the last 12 months.
A number of new pets were delivered to the shop recently. Pietro does not recall
bringing the new pets to a veterinary clinic within the last two weeks. The
following shows the pets database and the health check status of all animals in
Pietro's shop.

[`pet.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/pet.hs)
```haskell
import Data.Foldable
import Text.Printf

-- | Database of pets.  Each element in the database follows this format:
--
-- (pet-name, animal-type, health-check)
--
-- pet-name := The name of the pet.
-- animal-type := The type of animal, e.g. cat, dog, fish, etc.
-- health-check := Whether the pet has had a health check within the last
-- 12 months.
pet =
    [ ("Anonymouse", "mouse", False)
    , ("Cat Scan", "cat", True)
    , ("Catherine the Grater", "cat", True)
    , ("Charlie Chihuahua", "dog", True)
    , ("Chirpie O'Tweet", "bird", False)
    , ("Dogalogue", "dog", True)
    , ("Fido Dogstoevsky", "dog", True)
    , ("Frankie Frankfurt", "dog", True)
    , ("Garry Longtongue", "lizard", True)
    , ("Goldie Horn", "fish", False)
    , ("Hamsuke Hamton", "hamster", True)
    , ("Harry Speedbump", "hedgehog", True)
    , ("Hissy Fit", "cat", True)
    , ("Meowzart", "cat", True)
    , ("Mrs. Clucky", "bird", True)
    , ("Papa's New Guinea", "guinea pig", True)
    , ("Roam Ferret Roam", "ferret", True)
    , ("Robbie Hopster", "rabbit", True)
    , ("Scratchy Meowser", "cat", True)
    , ("Tabby Whiskers", "cat", True)
    , ("Terry Terrier", "dog", True)
    , ("Woofy McBark", "dog", True)
    ]

-- | Extract a particular type of animal from the database.
extract :: String -> [(String, String, Bool)]
extract "" = error "Cannot be empty string"
extract t  = filter (\(_, animal, _) -> animal == t) pet

-- | Whether a list of pets have had a health check within the last
-- 12 months.
hasHealthCheck :: [(String, String, Bool)] -> Bool
hasHealthCheck [] = False
hasHealthCheck xs = and [check | (_, _, check) <- xs]

-- | Managing a pets database.
main = do
    let animal =
            [ "bird"
            , "cat"
            , "dog"
            , "ferret"
            , "fish"
            , "guinea pig"
            , "hamster"
            , "hedgehog"
            , "lizard"
            , "mouse"
            , "rabbit"
            ]
    putStrLn "Health check status"
    printf "all pets -> %s\n" $ show . hasHealthCheck $ pet
    for_ animal $ \anim -> do
        let pt = extract anim
        putStr anim
        printf " -> %s\n" $ show . hasHealthCheck $ pt
```

<!--=========================================================================-->

## or

The function [`or`][or] outputs `True` if one element of a list is `True`. Like
its operator counterpart `||`, `or` outputs `False` if all elements are `False`.
The function `or` is useful in situations where we only care that one element is
`True`. It might be the case that multiple elements are `True`. However, we are
only interested in whether at least one element is `True`.

For example, the list of integers from 1 up to and including 10 has at least one
odd number. Similarly, the list `[1 .. 10]` has at least one even number. The
following GHCi session should confirm the above observations:

```haskell
ghci> or [even x | x <- [1 .. 10]]
True
ghci> or [odd x | x <- [1 .. 10]]
True
```

The vowels of the English alphabet are "A", "E", "I", "O", and "U". Some words
in English do not contain a vowel at all. Here are some common, and not so
common, words that consist of only consonants:

| C     | G     | P     | S      | T     | W    |
| ----- | ----- | ----- | ------ | ----- | ---- |
| cry   | glyph | ply   | sty    | thy   | why  |
| crypt | gym   | pwn   | sync   | try   | wry  |
| cyst  | gypsy | pygmy | syzygy | tryst | wyrm |

If you were to test each of the above words for vowels, the result would be
`False`. Observe:

[`word.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/word.hs)
```haskell
import Data.Foldable
import Text.Printf

-- | Some words in the English language that contain only consonants.
word =
    [ "cry"
    , "crypt"
    , "cyst"
    , "glyph"
    , "gym"
    , "gypsy"
    , "ply"
    , "pwn"
    , "pygmy"
    , "sty"
    , "sync"
    , "syzygy"
    , "thy"
    , "try"
    , "tryst"
    , "why"
    , "wry"
    , "wyrm"
    ]

-- | Whether a word has one or more vowels.
hasVowel :: String -> Bool
hasVowel str = or [s `elem` "aeiou" | s <- str]

-- | Test words to see whether they have vowels.
main = do
    let result = or $ map (\w -> hasVowel w) word
    printf "Any words have a vowel? %s\n" $ show result
    putStrLn "Test individual word for vowels"
    for_ word $ \w -> do
        printf "%s -> %s\n" w $ show . hasVowel $ w
```

<!--=========================================================================-->

## all

The function [`all`][all] is a predicate counterpart of [`and`][and]. Whereas
`and` expects all elements of a list to be boolean values, `all` accepts a
predicate that is used to determine whether all elements of a list satisfy the
predicate. For example, suppose we have a list of integers. We do not know
whether all the integers are positive. The function `all` can help us in this
scenario. Consider the GHCi session below:

```haskell
ghci> import Control.Monad
ghci> import System.Random.Stateful
ghci> ella <- replicateM 20 (uniformRM (-3, 20) globalStdGen :: IO Integer)
ghci> ellb <- replicateM 20 (uniformRM (-3, 20) globalStdGen :: IO Integer)
ghci> ellc <- replicateM 20 (uniformRM (1, 20) globalStdGen :: IO Integer)
ghci> ella
[1,2,15,12,1,10,17,-3,7,20,-3,3,8,8,14,19,11,-2,1,18]
ghci> all (\x -> x > 0) ella
False
ghci> ellb
[1,10,4,1,3,2,10,-1,6,4,20,0,4,-2,14,19,-3,18,16,13]
ghci> all (\x -> x > 0) ellb
False
ghci> ellc
[6,9,9,13,16,2,17,11,15,7,2,7,9,16,20,8,4,7,18,5]
ghci> all (\x -> x > 0) ellc
True
```

As another example, consider the table below of the [goals scored][arsenal] by
players of Arsenal during the 2022---2023 season of the Premier League. We
included only male players who scored at least one goal. The header "Goals-PK"
means non-penalty goals.

| Player              | Goals | Goals-PK |
| ------------------- | ----: | -------: |
| Ben White           |     2 |        2 |
| Bukayo Saka         |    14 |       12 |
| Eddie Nketiah       |     4 |        4 |
| Fabio Vieira        |     1 |        1 |
| Gabriel Dos Santos  |     3 |        3 |
| Gabriel Jesus       |    11 |       10 |
| Gabriel Martinelli  |    15 |       15 |
| Granit Xhaka        |     7 |        7 |
| Jakub Kiwior        |     1 |        1 |
| Leandro Trossard    |     1 |        1 |
| Martin Ødegaard     |    15 |       15 |
| Oleksandr Zinchenko |     1 |        1 |
| Rob Holding         |     1 |        1 |
| Reiss Nelson        |     3 |        3 |
| Thomas Partey       |     3 |        3 |
| William Saliba      |     2 |        2 |

Our question is: Were all the goals scored non-penalty? If a player scored $g$
goals and statistics says the player scored $h$ non-penalty goals, then all
goals scored by the player is non-penalty provided that $g = h$. I'm too lazy to
check by hand. Let's delegate the manual work to Haskell:

[`arsenal.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/arsenal.hs)
```haskell
import Text.Printf

-- | Goals scored by male players of Arsenal during the 2022--2023
-- season of the Premier League. Each tuple follows the format
-- (name, goals, goals-pk), where
--
-- name := The name of the player.
-- goals := The number of goals the player scored.
-- goals-pk := The number of non-penalty goals scored.
goal =
    [ ("Ben White", 2, 2)
    , ("Bukayo Saka", 14, 12)
    , ("Eddie Nketiah", 4, 4)
    , ("Fabio Vieira", 1, 1)
    , ("Gabriel Dos Santos", 3, 3)
    , ("Gabriel Jesus", 11, 10)
    , ("Gabriel Martinelli", 15, 15)
    , ("Granit Xhaka", 7, 7)
    , ("Jakub Kiwior", 1, 1)
    , ("Leandro Trossard", 1, 1)
    , ("Martin Ødegaard", 15, 15)
    , ("Oleksandr Zinchenko", 1, 1)
    , ("Rob Holding", 1, 1)
    , ("Reiss Nelson", 3, 3)
    , ("Thomas Partey", 3, 3)
    , ("William Saliba", 2, 2)
    ]

-- | Were all the goals scored non-penalty?
main = do
    let testAll = all (\(_, g, p) -> g == p) goal
    let testAnd = and [g == p | (_, g, p) <- goal]
    let testOr = or [g == p | (_, g, p) <- goal]
    printf "(all) all non-penalty goals? %s\n" $ show testAll
    printf "(and) all non-penalty goals? %s\n" $ show testAnd
    printf "(or) some non-penalty goals? %s\n" $ show testOr
```

<!--=========================================================================-->

## any

The function [`any`][any] is the predicate counterpart of [`or`][or]. The
function `or` requires all elements of a list to be boolean values. On the other
hand, `any` requires a predicate based upon which the function decides whether
some elements of a list satisfy the predicate.

Consider a bunch of random integers. We know that there are negative integers
and zero. Is there at least one positive integer? Let's find out.

```haskell
ghci> import Control.Monad
ghci> import System.Random.Stateful
ghci> a <- replicateM 20 (uniformRM (-20, 3) globalStdGen :: IO Integer)
ghci> b <- replicateM 20 (uniformRM (-20, 2) globalStdGen :: IO Integer)
ghci> c <- replicateM 20 (uniformRM (-20, 0) globalStdGen :: IO Integer)
ghci> a
[-16,-14,-1,-16,-19,-4,-8,-19,-1,-5,-6,1,-7,-3,-8,-15,-4,-11,-17,-10]
ghci> any (\x -> x > 0) a
True
ghci> b
[2,-4,-5,-5,2,0,2,-1,-18,-14,-2,-15,-11,-20,-15,-11,0,-4,-14,-4]
ghci> any (\x -> x > 0) b
True
ghci> c
[-20,-17,-10,-1,-6,-6,-3,-4,-3,-3,-1,-8,-4,-7,-19,-14,0,-15,-1,-7]
ghci> any (\x -> x > 0) c
False
```

Violet wants to increase her vocabulary. The words in her list vary in length.
She wants to know whether the list has a short word, i.e. a word of at most 5
letters. Learning short words all the time is no fun. Violet also wants to
determine whether the list has a long word, i.e. a word of at least 8 letters.
Let's use Haskell to find out:

```haskell
ghci> a = ["benign", "elixir", "tumid", "intemperance", "narcissist"]
ghci> any (\str -> length str <= 5) a
True
ghci> any (\str -> length str >= 8) a
True
```

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
<strong>Exercise 1.</strong> Consider the script
[`arsenal.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/arsenal.hs)
from the section [all](#all). Modify the script to use `any` to determine
whether any of the goals scored were a result of a penalty kick.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 2.</strong> Recall the script
[`pet.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/pet.hs)
from the section [and](#and). Modify the script to determine whether all birds
have had a health check within the last 12 months. Furthermore, determine
whether some of the birds have had a health check within the same time period.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 3.</strong> Many words in English that do not have a vowel use the letter "Y" to simulate a
vowel sound. Refer to the script
[`word.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/word.hs)
from the section [or](#or). Modify the script to determine whether some of the
words in the word list do not use "Y". Print such words to standard output.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 4.</strong> Recall the [exercise](../list_range/#exGilbreath) on
[Gilbreath's conjecture][GilbreathConjecture] from the section
[Free range numbers](../list_range/). Let $\ell$ be a list of prime numbers not
exceeding an integer $n > 1$. Successive application of the difference operation
would eventually result in the list `[1]`. Determine how many times you must
perform the difference operation in order to obtain a list that satisfies one of
the properties below:
<!-- prettier-ignore-end -->

-   All elements of the list are 1.
-   The list has a zero.
-   Each element of the list is either 0 or 1.
-   Each element of the list is either 0, 1, or 2.

The values of $n$ are drawn from the list `[10, 100, 1000, 10000, 100000]`.

<!-- prettier-ignore-start -->
<strong>Exercise 5.</strong> The [Britannica Dictionary][BritannicaDictionary] has a list of 100 core words
for the TOEFL. Let's refer to these words as the Britannica core. Use the
Britannica core to answer the following questions.
<!-- prettier-ignore-end -->

1. For each letter of the alphabet, is there a word that starts with the given
   letter? Output each letter for which the Britannica core does not have a word
   beginning with the letter.
1. Do all words have at least two unique vowels? Output each word in the
   Britannica core that uses exactly one unique vowel.
1. Are all words of at least length 5? Output each word that has length 4 or
   less.

<!-- prettier-ignore-start -->
<strong>Exercise 6.</strong> Consider the list below of [female players][sydneyFCfemale] of Sydney FC during
the 2022---2023 soccer season in Australia.
<!-- prettier-ignore-end -->

[`sydney.hs`](https://github.com/mvngu/haskyll/blob/main/assets/src/list/solution/sydney.hs)
```haskell
-- | Data on female players of Sydney FC during the 2022--2023 season.
-- Each tuple follows the format:
--
-- (name, nationality, goals, non-penalty-goals, penalty-kicks)
--
-- where
--
-- name := The name of the player.
-- nationality := The nationality of the player.
-- goals := The number of goals scored.
-- non-penalty-goals := The number of goals that do not result from a
--     penalty kick.
-- penalty-kicks := The number of penalty kicks.
player =
    [ ("Princess Ibini-Isei", "AUS", 7, 6, 1)
    , ("Charlize Rule", "AUS", 0, 0, 0)
    , ("Sarah Hunter", "AUS", 4, 4, 0)
    , ("Cortnee Vine", "AUS", 7, 7, 0)
    , ("Mackenzie Hawkesby", "AUS", 6, 5, 1)
    , ("Natalie Tobin", "AUS", 2, 2, 0)
    , ("Charlotte Mclean", "AUS", 0, 0, 0)
    , ("Jada Mathyssen-Whyman", "AUS", 0, 0, 0)
    , ("Shay Hollman", "AUS", 0, 0, 0)
    , ("Deborah De La Harpe", "IRL", 0, 0, 0)
    , ("Kirsty Fenton", "AUS", 0, 0, 0)
    , ("Madison Haley", "USA", 8, 8, 0)
    , ("Rachel Lowe", "AUS", 4, 4, 0)
    , ("Anna Green", "NZL", 0, 0, 0)
    , ("Katie Offer", "AUS", 0, 0, 0)
    , ("Indiana Dos Santos", "AUS", 1, 1, 0)
    , ("Tahlia Franco", "AUS", 0, 0, 0)
    , ("Rola Badawiya", "AUS", 1, 1, 0)
    , ("Mary Stanic-Floody", "AUS", 0, 0, 0)
    , ("Remy Siemsen", "AUS", 2, 2, 0)
    , ("Shadeene Evans", "AUS", 0, 0, 0)
    , ("Abbey Lemon", "AUS", 0, 0, 0)
    , ("Jynaya Dos Santos", "AUS", 0, 0, 0)
    , ("Teigan Collister", "AUS", 0, 0, 0)
    , ("Anika Stajcic", "AUS", 0, 0, 0)
    , ("Jasmine Black", "AUS", 0, 0, 0)
    , ("Margaux Chauvet", "AUS", 0, 0, 0)
    ]
```

Write a program to help you answer the following questions:

1. Are all players of Australian nationality? Output those players who are not
   Australian nationals.
1. Of those players who scored at least one goal, were all the goals the results
   of non-penalty kicks? Output those players who scored penalty goals.
1. Of those players who had at least 1 penalty kick, did the kicks all result in
   goals?
1. Of those players who are not Australian nationals, did any of them score
   goals? Output non-Australian nationals and the number of goals each of those
   players scored.

<!-- prettier-ignore-start -->
<strong>Exercise 7.</strong> Implement the function [`and`][and] without using the operator `&&`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 8.</strong> Implement the function [`or`][or] without using the operator `||`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 9.</strong> Implement the function [`all`][all] without using the operator `&&`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
<strong>Exercise 10.</strong> Implement the function [`any`][any] without using the operator `||`.
<!-- prettier-ignore-end -->

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[all]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:all
[and]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:and
[any]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:any
[arsenal]: https://web.archive.org/web/20240102151301/https://fbref.com/en/squads/18bb7c10/2022-2023/Arsenal-Stats#all_stats_standard
[BritannicaDictionary]: https://web.archive.org/web/20231003205858/https://www.britannica.com/dictionary/eb/3000-words/topic/TOEFL%20Vocabulary%20Words
[GilbreathConjecture]: https://web.archive.org/web/20240101031921/https://en.wikipedia.org/wiki/Gilbreath%27s_conjecture
[or]: https://web.archive.org/web/20231223101438/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:or
[sydneyFCfemale]: https://web.archive.org/web/20240103044029/https://fbref.com/en/squads/5903e501/2022-2023/Sydney-FC-Women-Stats
<!-- prettier-ignore-end -->

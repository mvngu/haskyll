---
title: You're not on the list
math: true
---

> _Bouncer:_ Are you on the list?\
> _The Mask:_ Nooo... but I believe my friends are. Perhaps you know them. Franklin,
> Grant, and Jackson.\
> --- _The Mask_, 1994

In the section [The string and I](../data_string/), you learnt that a string can
be understood as a list of characters. You will come across lists again and
again as you delve deeper into Haskell. This section will discuss lists and
various operations to perform on them. Take the time to familiarize yourself
with lists. You can hug them and kiss them, but most important of all learn how
to use them.

<!--=========================================================================-->

## How, or construction

> Bob the Builder!\
> Can we fix it?\
> Bob the Builder!\
> Yes, we can!\
> --- _Bob the Builder_, theme song

How to build a list? Use square brackets like so:

```haskell
ghci> []
[]
```

The list `[]` is empty. Nothing exciting. What we want are non-empty lists like
so:

```haskell
ghci> [1, 2, 3]
[1,2,3]
ghci> [True, False, True]
[True,False,True]
ghci> ["a", "b", "c"]
["a","b","c"]
ghci> ['a', 'b', 'c']
"abc"
```

Notice that the list `['a', 'b', 'c']` is represented as the string `"abc"`.
This is why we say that a string can be considered as a list of characters.

All the lists above have literal values as elements. Their elements are
pre-defined. What we want is a way to construct lists and add elements to them
as required. That is a job for the cons operator `:`. The cons operator
*cons*tructs a list by prepending one element to a given list. We can build a
list of one element like so `[1]`, a list of two elements as `[1, 2]`, and a
list of three elements as `[1, 2, 3]`. The cons operator constructs the same
lists as follows:

```haskell
ghci> 1 : []
[1]
ghci> 1 : (2 : [])
[1,2]
ghci> 1 : 2 : []
[1,2]
ghci> 1 : (2 : (3 : []))
[1,2,3]
ghci> 1 : 2 : 3 : []
[1,2,3]
```

Another detail to note about all the above lists is the type of the elements.
The empty list `[]` has no elements; it does not make sense to talk about the
type of its element. Other lists shown above are non-empty. Here is the crucial
point: all elements of each list have the same type. The list `[1, 2]` is valid
because all elements have the same type. Haskell will throw a tantrum at a list
such as `[1, '2']` because you are mixing different types.

<!--=========================================================================-->

## Who, or membership

> _Boy:_ Hey Billy! Hey Joey! Come on in. There's plenty of room. Sorry, not
> you, Homer.\
> _Homer:_ Why not!?\
> _Boy:_ [Points to the sign, "No Homers Club".]\
> _Homer:_ But you let in Homer Glumplich!\
> _Homer Glumplich:_ Hyuck hyuck!\
> _Boy:_ It says no Homers. We're allowed to have one.\
> --- _The Simpsons_, season 6, episode 12, 1995

Everyone is lining up to enter the hip replacement joint, club Coco Hasko. Burly
the Bouncer has a list of VIPs and checks it once. When a patron attempts to
enter the club, Burly uses the function [`elem`][elem] to query whether the
patron's name is on his list. He might suspect that a patron is not on the list
and would use the function [`notElem`][notElem] to confirm his suspicion. A
typical nights goes something like this:

```haskell
ghci> vip = ["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> elem "Anne" vip
False
ghci> elem "Fiona" vip
True
ghci> "Fiona" `elem` vip
True
ghci> notElem "Danielle" vip
True
ghci> "Daniel" `notElem` vip
False
```

The functions `elem` and `notElem` are usually applied in prefix notation.
However, you can delimit the functions within backticks to apply the functions
in infix notation.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[elem]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:elem
[notElem]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:notElem
<!-- prettier-ignore-end -->

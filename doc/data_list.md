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

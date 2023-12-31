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
type of its elements. Other lists shown above are non-empty. Here is the crucial
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

## What, or basic properties

It's a slow night for Burly the Bouncer. The queue is long, but not everyone can
enter the Coco Hasko. Burly uses the time to memorize his list of VIPs. Early in
the evening when the club was making preparation to open for the night, Burly's
list of VIPs was empty because his boss was still trying to confirm the VIPs who
would attend the club. The function [`null`][null] would output `True` when
given his early, empty list. He now knows that the list is non-empty so the
function `null` would output `False` when given his current list. Since the VIP
list is non-empty, the next logical step is to find out how many people are on
the list. Burly uses the function [`length`][length] for this purpose. Here is
how Burly checks some basic properties of his list of VIPs.

```haskell
ghci> null []
True
ghci> vip = ["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> null vip
False
ghci> length vip
6
```

Burly knows that the VIP list is ordered from most important to least important.
Haskell uses non-negative integers to index lists. The first element of a list
has index 0, the second has index 1, and so on. The operator
[`!!`][exclaimExclaim] is usually applied in the infix notation. Given a list
and an index, the operator `!!` outputs the element in the list at the specified
index. Burly wants to confirm the most important and least important VIPs. Here
goes:

```haskell
ghci> vip = ["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> vip !! 0
"Anna"
ghci> (!!) vip 0
"Anna"
ghci> vip !! (length vip)
"*** Exception: Prelude.!!: index too large
CallStack (from HasCallStack):
  error, called at libraries/base/GHC/List.hs:1368:14 in base:GHC.List
  tooLarge, called at libraries/base/GHC/List.hs:1378:50 in base:GHC.List
  !!, called at <interactive>:4:5 in interactive:Ghci4
```

The most important VIP is Anna, who occupies the position at index 0. Like other
operators, e.g. `+` and `-`, that are usually applied in infix notation, the
operator `!!` can be used in prefix notation by enclosing it within parentheses.

Burly knows that the code `length vip` outputs the number of elements in his
list. But why would Haskell throw a tantrum at the code `vip !! (length vip)`
when Burly attempts to find out the least important VIP? The reason is that
Haskell indexes a list starting from index 0. If $n$ is the number of elements
in the list, the last element has index $n - 1$. Burly must subtract one from
the length of his list.

```haskell
ghci> vip = ["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> vip !! ((length vip) - 1)
"Fiona"
```

Haskell is happy now.

<!--=========================================================================-->

## Which, or components

> Which witch is the witchiest of all?

Some of the VIP guests have arrived. Burly needs to check his list and update
them accordingly. Anna is the first to arrive. Burly already knows that Anna is
at the top (i.e. the first element) of the list. Burly knows that the element at
index 0 can be accessed as `vip !! 0`. The function [`head`][head] provides an
alternative way to access the first element of the VIP list. If Anna is crossed
off the list of VIPs, Burly can use the function [`tail`][tail] to access all
but the first element of his list, effectively removing Anna from the list.

```haskell
ghci> vip = ["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> vip !! 0
"Anna"
ghci> head vip
"Anna"
ghci> tail vip
["Bianca","Cary","Daniel","Ethan","Fiona"]
```

Fiona is the next VIP to arrive at club Coco Hasko. As she is at the bottom
(i.e. the last element) of the list, her index in the updated list is the length
of the list minus one. Another way for Burly to access the last element of his
list is to use the function [`last`][last]. Burly crosses Fiona off his VIP list
and then uses the function [`init`][init] to obtain all elements of the list
except for the last element, thus removing Fiona from the list.

```haskell
ghci> vip = ["Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> vip !! ((length vip) - 1)
"Fiona"
ghci> last vip
"Fiona"
ghci> init vip
["Bianca","Cary","Daniel","Ethan"]
```

<!--=========================================================================-->

## Together, or join

> _Rufus:_ You want to be a public nuisance?\
> _Chicolini:_ Sure! How much does the job pay?\
> _Rufus:_ I got a good mind to join a club and beat you over the head with it.\
> --- _Duck Soup_, 1933

Burly the Bouncer has deleted two guests from his VIP list. He is breathing a
sigh of relief when his boss approaches him. The boss said he is expecting
another three VIP guests tonight: Gwen, Harry, Ira. Burly uses the operator
[`++`][plusPlus] to append the new list to his own list. Another way to update
his list would be for Burly to have a list of two elements: the first element is
his own list, the second element being the list of further guests to welcome.
Burly can then use the function [`concat`][concat] to concatenate all elements
together into a single list. Here is Burly's code:

```haskell
ghci> vip = ["Bianca","Cary","Daniel","Ethan"]
ghci> more = ["Gwen", "Harry", "Ira"]
ghci> vip ++ more
["Bianca","Cary","Daniel","Ethan","Gwen","Harry","Ira"]
ghci> concat [vip, more]
["Bianca","Cary","Daniel","Ethan","Gwen","Harry","Ira"]
```

<!--=========================================================================-->

## Apart, or split

> _Juliet:_ Good night, good night. Parting is such sweet sorrow\
> That I shall say "Good night" till it be morrow.\
> --- William Shakespeare, _Romeo and Juliet_, act 2, scene 2

Joining lists together all the time is no fun. Let's play anti-Cupid and break
up lists.

<!--=========================================================================-->

### I'll take these

Instead of the function [`init`][init], Burly could also have used the function
[`take`][take] to keep all elements of a list except for the last element. The
function `take` accepts two parameters:

1. The number of elements to keep, going from left to right in a list.
1. The list to process.

To remove the last element of a list, Burly would retain all but the last
element. The integer parameter of `take` would be the length of the list minus
one. Here is a comparison between `init` and `take`:

```haskell
ghci> vip = ["Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> init vip
["Bianca","Cary","Daniel","Ethan"]
ghci> take ((length vip) - 1) vip
["Bianca","Cary","Daniel","Ethan"]
```

Unlike the function `init` which removes the last element of a list, the
function `take` can remove multiple elements from the right side of a list.
Consider the following scenario. The state of Burly's VIP list is:

```haskell
["Bianca","Cary","Daniel","Ethan","Gwen","Harry","Ira"]
```

Harry and Ira have arrived. They are waiting to get their names checked off
Burly's list and be allowed inside club Coco Hasko. Burly uses the function
`elem` to ensure that each of the two patrons are indeed on his list of VIP
guests. Yep, these two check out OK. Burly now wants to use the function `take`
to remove the above two VIPs from his list. The list currently has seven names.
Removing two names is equivalent to retaining the first five names. Here is
Burly's implementation and double check.

```haskell
ghci> vip = ["Bianca","Cary","Daniel","Ethan","Gwen","Harry","Ira"]
ghci> take ((length vip) - 2) vip
["Bianca","Cary","Daniel","Ethan","Gwen"]
ghci> take 5 vip
["Bianca","Cary","Daniel","Ethan","Gwen"]
```

<!--=========================================================================-->

### Drop it

Whereas `take` removes elements from the right side of a list, the function
[`drop`][drop] removes elements from the left side of a list. The function
`drop` takes two parameters:

1. The number of elements to remove from the left side of a list.
1. The list to process.

The function `tail` is a special case of `drop` because `tail` removes the
leftmost element. Here is a repeat of the `tail` operation from the section
[Which, or components](#which-or-components), but compared with `drop`.

```haskell
ghci> vip = ["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
ghci> tail vip
["Bianca","Cary","Daniel","Ethan","Fiona"]
ghci> drop 1 vip
["Bianca","Cary","Daniel","Ethan","Fiona"]
```

As noted above, `drop` is more powerful than `tail` because the former can
remove any number of elements from the left side of a list. Consider the next
scenario. The state of Burly's list is now:

```haskell
["Bianca","Cary","Daniel","Ethan","Gwen"]
```

Bianca and Cary have arrived and waiting for Burly to allow them admittance into
club Coco Hasko. Burly checks off the two patrons' names on his VIP list. To
update his list, Burly needs to drop the first two names from the list. Observe:

```haskell
ghci> vip = ["Bianca","Cary","Daniel","Ethan","Gwen"]
ghci> drop 2 vip
["Daniel","Ethan","Gwen"]
```

<!--=========================================================================-->

### JCVD epic split

The function [`splitAt`][splitAt] is a general-purpose facility for separating a
list into two segments. Whereas [`take`][take] and [`drop`][drop] are
generalizations of [`init`][init] and [`tail`][tail], respectively, `splitAt`
generalizes all of the above four functions. In fact, `splitAt` can also be used
to simulate the functionalities of [`head`][head] and [`last`][last]. The
parameters of `splitAt` are:

1. The number $n$ of elements that form the first segment, going from left to
   right. This is the split boundary.
1. The list $\ell$ to process.

The function `splitAt` outputs a tuple containing two elements:

-   The first element is a sublist of the first $n$ elements of $\ell$. This
    sublist can be obtained by `take n ell`. Let's call the sublist the left
    segment of $\ell$.
-   The second element of the tuple is a sublist of the remaining elements of
    $\ell$, excluding the first $n$ elements. This sublist can obtained by
    `drop n ell`. Refer to the sublist as the right segment of $\ell$.

Let's see `splitAt` in action.

```haskell
ghci> ell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ghci> take 4 ell
[1,2,3,4]
ghci> drop 4 ell
[5,6,7,8,9]
ghci> (take 4 ell, drop 4 ell)
([1,2,3,4],[5,6,7,8,9])
ghci> splitAt 4 ell
([1,2,3,4],[5,6,7,8,9])
```

The above GHCi session demonstrates that `splitAt` can simulate the
functionalities of `take` and `drop`. How do you extract the respective
sublists? As noted in the section
[Splitting headache](../data_string/#splitting-headache), you can use the
functions [`fst`][fst] and [`snd`][snd] to extract the first (or left) and
second (or right) elements, respectively, of the tuple output by `splitAt`. On
the other hand, you can destructure the tuple. Refer to the following GHCi
session.

```haskell
ghci> ell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ghci> (left, right) = splitAt 4 ell
ghci> take 4 ell
[1,2,3,4]
ghci> fst $ splitAt 4 ell
[1,2,3,4]
ghci> left
[1,2,3,4]
ghci> drop 4 ell
[5,6,7,8,9]
ghci> snd $ splitAt 4 ell
[5,6,7,8,9]
ghci> right
[5,6,7,8,9]
```

It should make sense now how `splitAt` can be used to simulate the
functionalities of `head` and `last`. The function `head` extracts the first
element of a list. This is equivalent to splitting the list at the first
element, then retain the left element of the resulting tuple. The function
`last` extracts the last element of a list. You can do the same thing by
splitting the list at the penultimate element, then retain the right element of
the tuple. The above description bears some resemblance to how you use `splitAt`
to achieve the same functionalities as `take` and `drop`. Observe:

```haskell
ghci> ell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ghci> head ell
1
ghci> (fst $ splitAt 1 ell) !! 0
1
ghci> last ell
9
ghci> (snd $ splitAt ((length ell) - 1) ell) !! 0
9
```

Not exactly elegant, but `splitAt` gets the job done nonetheless. On second
thought, it is more elegant and faster to use `head` and `last` than endure the
rigmarole of `splitAt` and `fst` (or `snd`) and indexing.

<!--=========================================================================-->

## Exercises

<!-- prettier-ignore-start -->
:exercise:
Is each list construction below valid? Why or why not?
<!-- prettier-ignore-end -->

-   `'a' : "b"`
-   `'a' : 'b'`
-   `[1] : [2]`
-   `[1]: [[2]]`

<!-- prettier-ignore-start -->
:exercise:
The function [`reverse`][reverse] takes a list and reverses its elements. Use
`reverse` to simulate the functionalities of `head`, `last`, `init`, and `tail`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
The function [`and`][and] takes a list of boolean values and outputs whether all
of those values are `True`. Similarly, the function [`or`][or] takes a list of
boolean values and outputs whether one of the values is `True`. Use `and` and
`or` to simulate the operators `&&` and `||`, respectively.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Use `reverse` to simulate the functionalities of `take` and `drop`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Use `splitAt` to simulate the functionalities of `head` and `last`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Use `splitAt` to remove the middle element of the list `[1, 2, 3, 4, 5]`. Repeat
the exercise, but without using `splitAt`.
<!-- prettier-ignore-end -->

<!-- prettier-ignore-start -->
:exercise:
Access the element in the middle of the list:
<!-- prettier-ignore-end -->

```haskell
["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona"]
```

<!-- prettier-ignore-start -->
:exercise: label="exRangeNotation"
The range notation `..` allows you to create a list of integers. Two useful ways
to create lists of numbers are:
<!-- prettier-ignore-end -->

1. The format `[first..last]` creates a list of integers with the first number
   being `first` and the last being `last`. The numbers in between are integers
   greater than `first`, but less than `last`. Successive integers are increased
   by a step size of one.
1. The format `[first, second..last]` is more general than the previous format.
   It allows you to create a list integers where the step size is the difference
   between `first` and `second`.

Use the first format to create a list of integers between one and ten,
inclusive. Repeat the exercise but use the second format. Use the second format
to create a list of odd integers between zero and 20, inclusive. Repeat the
exercise, but create even integers.

<!-- prettier-ignore-start -->
:exercise:
The function [`zip`][zip] takes two lists $A$ and $B$ and outputs a list of
pairs in corresponding positions. The first element of $A$ is paired with the
first element of $B$, the second element of $A$ is paired with the second
element of $B$, and so on. Given the list of VIPs:
<!-- prettier-ignore-end -->

```haskell
["Anna", "Bianca", "Cary", "Daniel", "Ethan", "Fiona", "Gwen", "Harry"]
```

assign an ID to each person. Then use `zip` to construct a list of name/ID
pairs.

<!-- prettier-ignore-start -->
:exercise:
The function [`unzip`][unzip] takes a list of ordered pairs and deconstruct them
into a tuple of two lists: a left list and a right list. The left list consists
of the first elements of each pair. The right list has all the second elements
of each pair. Use `unzip` to deconstruct the list
<!-- prettier-ignore-end -->

```haskell
[(1,"a"), (2,"b"), (3,"c"), (4,"d")]
```

into a tuple of left and right lists. Apply `concat` to the right list, then
`zip` the left list with the result. What do you notice?

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[and]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:and
[concat]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:concat
[drop]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:drop
[elem]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:elem
[exclaimExclaim]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:-33--33-
[fst]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:fst
[head]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:head
[init]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:init
[last]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:last
[length]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:length
[notElem]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:notElem
[null]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:null
[or]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:or
[plusPlus]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:-43--43-
[reverse]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:reverse
[snd]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:snd
[splitAt]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:splitAt
[tail]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:tail
[take]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:take
[unzip]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:unzip
[zip]: https://web.archive.org/web/20231130152929/https://hackage.haskell.org/package/base-4.19.0.0/docs/GHC-List.html#v:zip
<!-- prettier-ignore-end -->

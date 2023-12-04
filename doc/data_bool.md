---
title: Bool-urns
math: true
---

> _Roy:_ (Singing) We don't need no education.\
> _Moss:_ Yes you do. You've just used a double negative.\
> --- _The IT Crowd_, season 1, episode 4, 2006

Do you like samurai? Do you like pizza? Do you like cats? If you answer yes to
all three questions, you might like [Samurai Pizza Cats][pizzaCats]. Do you also
like banana? Perhaps you might be interested in [Bananya][bananya]. Questions
such as the above often require a yes/no answer. Yes means true, you prefer
something. No means false, you dislike something. Questions or statements that
can be answered with yes/no or true/false are said to have boolean values.
Haskell models boolean values via the type [`Bool`][bool], which has two defined
values: `True` and `False`.

What else can you do with boolean values? A simple operation is to use the
function [`not`][not] to negate a boolean value, thus resulting in the opposite
value. The result of `not True` is `False` because the opposite of `True` is
`False`. As you might have already guessed, the result of `not False` is `True`.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[bananya]: https://web.archive.org/web/20231010043830/https://en.wikipedia.org/wiki/Bananya
[bool]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html
[not]: https://web.archive.org/web/20231128114058/https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Bool.html#v:not
[pizzaCats]: https://web.archive.org/web/20230713110453/https://en.wikipedia.org/wiki/Samurai_Pizza_Cats
<!-- prettier-ignore-end -->

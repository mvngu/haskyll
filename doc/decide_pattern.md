---
title: Pattern matching
math: true
---

The basic idea of pattern matching is simple. Organize the definition of your
function according to the specific patterns you want to match. That does not
sound simple at all. We need an example.

<!--=========================================================================-->

## Traffic lights

Put on your traffic engineer hat. The traffic light red means stop, orange means
wait, and green means go. We can translate the latter description to a guarded
equation like so:

:include: file="assets/src/decide/traffic.hs", name="traffic.hs", line=3:9

Alternatively, we can use pattern matching. How? Observe:

:include: file="assets/src/decide/traffic.hs", name="traffic.hs", line=11:16

Each equation above has a specific pattern (i.e. a literal value) we want to
match. For instance, in the equation

```haskell
trafficp "red"    = "stop"
```

the pattern is the literal string `"red"` and the output corresponding to this
pattern is `"stop"`. Similar to the guarded equation where we have the catch-all
guard [`otherwise`][otherwise], the last equation in our pattern matching should
be the wildcard pattern `_`, i.e. the underscore character. The wildcard
equation

```haskell
trafficp _        = "Invalid traffic light"
```

handles all other cases not matched by the patterns above it.

<!--=========================================================================-->

<!-- prettier-ignore-start -->
[otherwise]: https://web.archive.org/web/20231202002935/https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:otherwise
<!-- prettier-ignore-end -->

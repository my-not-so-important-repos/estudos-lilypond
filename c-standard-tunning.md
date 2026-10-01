Use the tuning as a `string-tuning` / `\stringTuning` value for the tab staff, and set it to standard C:

```lilypond
\new TabStaff \with {
  stringTunings = #bass-tuning
} { ... }
```

For **standard C** on a 6-string guitar, the tuning is:

- C
- F
- A#
- D#
- G
- C

In LilyPond pitch names, that is usually written as:

```lilypond
#(define standard-c-tuning (string-tuning '(c f bes ees g c)))
```

Then use it on the staff:

```lilypond
\new TabStaff \with {
  stringTunings = #standard-c-tuning
} {
  c'1
}
```

Notes:
- LilyPond uses `bes` for **B-flat** (`A#` enharmonically).
- LilyPond uses `ees` for **E-flat** (`D#` enharmonically).

If you want, I can also show:
1. how to define this in a reusable variable, or
2. how to make fretboard/chord diagrams use the same tuning.

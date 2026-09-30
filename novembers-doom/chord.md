To make fretboard/chord diagrams use the same tuning, define the tuning once and pass it both to the **TabStaff** and to the **fretboard/chord-shape code**.

For standard C, use:

```lilypond
#(define standard-c-tuning (string-tuning '(c f bes ees g c)))
```

Then:

### 1) Use it in tab
```lilypond
\new TabStaff \with {
  stringTunings = #standard-c-tuning
} {
  c'1
}
```

### 2) Use it in fretboard/chord diagrams
The file you linked shows that predefined diagrams are stored with a key that includes the tuning:

```scheme
(cons tuning pitches)
```

So the tuning you use for diagrams must match the same `standard-c-tuning` object/value.

Example with a chord diagram:

```lilypond
#(define standard-c-tuning (string-tuning '(c f bes ees g c)))

#(addChordShape 'myChord standard-c-tuning "x;3;5;5;5;3")
```

Then when LilyPond looks up the diagram, it must use that same tuning.

### 3) If you want predefined fretboards
Use the tuning when defining the fretboard table / diagram storage, not just in the staff. In practice, that means:
- define the tuning
- add chord shapes with that tuning
- render fretboards using that tuning

Example:

```lilypond
#(define standard-c-tuning (string-tuning '(c f bes ees g c)))

#(addChordShape 'cmaj7 standard-c-tuning "x;3;5;4;5;3")

\new ChordNames {
  <c e g b>
}
\new FretBoards {
  <c e g b>
}
```

If the built-in diagram doesn’t show up, it usually means the tuning attached to the chord-shape table does **not** exactly match the tuning on the tab staff.

### Important detail
Use the same spelling LilyPond expects:
- `bes` = B♭
- `ees` = E♭

So standard C is:

```lilypond
#(define standard-c-tuning (string-tuning '(c f bes ees g c)))
```

If you want, I can give you a complete working LilyPond example that includes:
- `TabStaff`
- `ChordNames`
- `FretBoards`
- standard C tuning shared by all three


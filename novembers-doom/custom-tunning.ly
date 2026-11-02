\version "2.24.3"
\language "english"

\header {
  title = "I Hurt Those I Adore"
  composer = "Novembers Doom"
  arranger = "HeitorJr"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "a5landscape")
  % Add space for instrument names
  indent = 10\mm
}

global = {
  \key c \major
  \time 4/4
}

electricGuitar = {
  \global
  % Music follows here.
  c,, f,, as,, ds, g, c
}

\score {
  \new StaffGroup \with {
    systemStartDelimiter = #'SystemStartSquare
    \consists "Instrument_name_engraver"
    instrumentName = "E.Gt."
  } <<
    \new Staff \with {
      midiInstrument = "electric guitar (clean)"
    } { \transposition c \transpose c c' \electricGuitar }
    \new TabStaff \with {
      stringTunings = \stringTuning <c,, f,, as,, ds, g, c>
      midiInstrument = "electric guitar (clean)"

    } << \electricGuitar >>
  >>
  \layout { }
  \midi {
    \tempo 4=185
  }
}

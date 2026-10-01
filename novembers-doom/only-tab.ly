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

}

\score {
  \new TabStaff \with {
    stringTunings = #guitar-tuning
    midiInstrument = "electric guitar (clean)"
    \consists "Instrument_name_engraver"
    instrumentName = "E.Gt."
  } \electricGuitar
  \layout { }
  \midi {
    \tempo 4=185
  }
}

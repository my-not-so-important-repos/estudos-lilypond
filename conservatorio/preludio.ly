\version "2.24.3"
\include "../header.ly"

\header {
  title = "Preludio I"
  tagline = ##f
}


global = {
  \key c \major
  \numericTimeSignature
  \time 3/4
}

right = {
  \global

  r e' g' | r e' g' | r e' g' | r e' g'

  r2. | <e' g'>2.
}

left = {
  \global
  % Music follows here.
  \repeat volta 2
  {
    c'2. | b | a | g 
  }
  %\bar ":|"
  c' | c'
  \bar "|."
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}

\version "2.24.3"

\include "header.ly"

\header {
  subsubtitle = "Peaceful Days"
}

right = \relative c'' {
  \global
  g'8 f e d   f e d c |
  c8  d  e \tieNeutral  d   d2 
  r8  a8  a2  b
}

left = \relative c' {
  \global
  \clef treble
  \chordmode {
    c2 f, bes, s |
    s4 <g c' f'>2 <g b g'>2 
  }
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \right
    \new Staff = "left" {
      \clef bass \left
    }
  >>
  \layout {}
  \midi {}
}

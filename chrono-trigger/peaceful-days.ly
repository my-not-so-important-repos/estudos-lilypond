\version "2.24.3"

\header {
  subsubtitle = "Peaceful Days"
  enteredby = "HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

global = {
  \easyHeadsOn
  \key c \major
  \time 4/4
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
    s4
    <g c' f'>2
    <g b g'>2 
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

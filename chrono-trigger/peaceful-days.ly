\version "2.24.3"

\header {
  subsubtitle = "Peaceful Days"
  % Remove default LilyPond tagline
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \easyHeadsOn
  \key c \major
  \time 4/4
}

right = \relative c'' {
  \global
  % Music follows here.
  g'8 f e d   f e d c |
  c8  d  e \tieNeutral  d   d2 
  
  r8  a8  a2  b
}

left = \relative c' {
  \global
  \clef treble
  % Music follows here.
  \chordmode {
    c2 f, bes, s |
    s4 <g c' f'>2 <g b g'>2 
    
  }
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "lead 1 (square)"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "lead 1 (square)"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=90
  }
}

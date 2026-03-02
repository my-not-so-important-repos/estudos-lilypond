\version "2.24.3"
\include "header.ly"

\header {
  title = "Presentiment"
  subtitle = "Chrono Trigger"
}

right = \relative c' {
  \global
  r \tuplet 3/2 { d' g a } \tuplet 3/2 { d a g d  }
  % \bar "|."
}



\score {
  \new PianoStaff <<
    \new Staff = "right" \right
  >>
  \layout { }
}

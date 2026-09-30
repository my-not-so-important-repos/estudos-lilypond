\version "2.24.3"

\header {
  title = "Presentiment"
  subtitle = "Chrono Trigger"
  enteredby = "HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  %#(set-paper-size "a5" 'landscape)
  #(set-paper-size "a5landscape")
}
\layout { indent = 0 }
global = {
  \easyHeadsOn
  \key c \major
  \time 4/4
}

right = \relative c' {
  \global
  r \tuplet 3/2 { d' g a } \tuplet 3/2 { d a g d  }
  \bar "|."
}


\score {
  \new PianoStaff <<
    \new Staff = "right" \right
  >>
  \layout { }
}

\version "2.24.3"

\header {
  title = "Presentiment"
  subtitle = "Chrono Trigger"
  enteredby = "HeitorJr"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \key c \major
  \time 4/4
}

right = \relative c' {
  \global
  r \tuplet 3/2 { d' g a } d a g d 
  % \bar "|."
}



\score {
  \new PianoStaff <<
    
    \new Staff = "right" \right
  >>
  \layout { }
}

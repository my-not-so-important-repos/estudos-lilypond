\version "2.24.3"
\language "portugues"

\header {
  title = "Ode a Alegria"
  composer = "Beethoven"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "a5")
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

global = {
  \key do \major
  \time 4/4
}

right = \relative do' {
  \global
  mi mi fa sol |
  sol fa mi re |
  \break
  do do re mi |
  mi2 re2 |
  
  \bar "|."
  
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \right
  >>
  \layout { }
}

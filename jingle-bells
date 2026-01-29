\version "2.24.3"

\header {
  title = "Jingle Bells"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \key c \major
  \numericTimeSignature
  \time 4/4
 % \tempo 4=100
}

right = \relative c' {
  \global
  e4 e e2 |
  e4 e e2 |
  e4 g c, d |
  e1 | \break
  
  f4 f f2 |
  e4 e e2 |
  d4 e d e |
  d2 f2 | \break
  
  e4 e e2 |
  e4 e e2 |
  e4 g c, d |
  e1 | \break
  
  f4 f f2 |
  e4 e e2 |
  g4 g f d |
  c1
  
  \bar "."
}

\score {

  \new Staff = "right"
  \right

  \layout { }
  \midi { }
}

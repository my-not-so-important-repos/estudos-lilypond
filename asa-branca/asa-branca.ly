\version "2.24.3"

\header {
  title = "Asa Branca"
  % Remove default LilyPond tagline
  composer = "Luiz Gonzaga"
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
  r2 c4 d
  e2 g2 |
  g2 e2 |
  f2 f2 |
  
  \break
  
  r2 c4 d |
  e2 g2 |
  g2 f2 |
  e1 |
  
  \break
  
  r4 c4 c d |
  e2 g2 |
  r4 g4 f e |
  c2 f2 |
  
  \break
  
  r4 e4 e d |
  d2 e2 |
  r4 d4 d c |
  c1
  
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \right
  >>
  \layout { }
}

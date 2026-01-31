\version "2.24.3"

\header {
  title = "As flores nascem em maio"
  enteredby = "HeitorJr"
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
  g'4 e e2 |
  f4 d d2 |
  c4 d e f |
  g4 g g2 |
  \break
  
  g4 e e2 |
  f4 d d2 |
  c4 e g g |
  c,2. r4 |
  \break

  d4 d d d |
  d  e f2 |
  e4 e e e |
  e4 f g2 |
  \break
  
  g4 e e2 |
  f4 d d2 |
  c4 e g g |
  c,1
  
  \bar "|."
}

acordes = \chordmode {
  \global
  c1 | g | c     | g  |
  c  | g | c2 g2 | c1 |
  g1 | s | c     | s  |
  s  | g | c2 g  | c1 |
}

\score {

  \new PianoStaff <<
    \new ChordNames { \acordes }
    \new Staff = "right" \right
  >>

  \layout { }
  % \midi { }
}

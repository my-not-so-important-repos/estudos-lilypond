\version "2.24.3"
\include "../header.ly"
#(set-global-staff-size 30)

\header {
  title = "Ode a Alegria"
  composer = "Beethoven"
}

\layout {
  \context {
    \Score
  }
}

global = {
  \tempo 4=120
}

right = \relative c' {
  \global
  \easyHeadsOn
  e e f g | g f e d |
  \break

  c c d e | e2 d2 |
  \break

  e4 e f g |
  g f e d
  \break

  c4 c d e | d2 c2

  \bar "|."
}



acordes = \chordmode {
  \global
  c1 | g |
  c | g |
  c g |
  c | g2 c2
}


\score {
  \new PianoStaff <<
    \new ChordNames { \acordes }
    \new Staff = "right" \right
  >>
  \layout {}
  \midi {}
}

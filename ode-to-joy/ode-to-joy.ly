\version "2.24.3"
%\language "portugues"

\layout {
  indent = 0
}

\header {
  title = "Ode a Alegria"
  composer = "Beethoven"
  enteredby = "HeitorJr"
  % Remove default LilyPond tagline
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape")
}

\layout {
  \context {
    \Score
  }
}

global = {
  \key c \major
  \time 4/4
  \tempo 4=120
  \numericTimeSignature
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

\version "2.24.3"
\include "../header.ly"

\header {
  subtitle = "Jingle Bells"
}


right = \relative c' {
  \global {
    \tempo 4=100
  }
  e4 e e2 |
  e4 e e2 |
  e4 g c, d |
  e1 | \break
  
  f4 f f2 |
  e4 e e2 |
  d4 e d e |
  d2 g2 | \break
  
  e4 e e2 |
  e4 e e2 |
  e4 g c, d |
  e1 | \break
  
  f4 f f2 |
  e4 e e2 |
  g4 g f d |
  c1
  
  \bar "|."
}

acordes = \chordmode {
  \global {
    \tempo 4=100
  }
  c1 | s1 | s | s |
  g | c | g | s
  c1 s s s
  g c g c
}

\score {

  <<
    \context ChordNames="bass" {
      \acordes
    }

    \context Staff="default" {
      \clef treble
      \right
    }
  >>

  \layout { }
  \midi { }
}

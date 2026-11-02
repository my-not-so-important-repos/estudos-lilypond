\version "2.24.3"

\header {
  title = "Peço Força"
  enteredby = "HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape")
}

\layout { indent = 0 }

global = {
  \easyHeadsOn
  \time 4/4
  \key c \major
  \tempo 4=110
}

melody = {
  \global
  g4 g8 c'4 g
  %\break
  c' c' e' c' c'
  \break
  d' e' g' d'
  e' d' c'

}

words = \lyricmode {
  Pe ço For ça
  la vem for ça
  Deus do céu foi quem man do ou
}

\score {
  <<
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}

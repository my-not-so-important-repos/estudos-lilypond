\version "2.24.3"
\language "english"
\include "predefined-guitar-fretboards.ly"

\layout {
  indent = 0
}

\header {
  title = "Índice de acordes - guitarra"
  tagline = ##f
}

chordNames = \chordmode {
  c d e f g a b
  \break
  c:7 d:7 e:7 f:7 g:7 a:7 b:7
  \break
  c:min d:min e:min f:min g:min a:min b:min
  \break
  c:min7 d:min7 e:min7 f:min7 g:min7 a:min7 b:min7
  \break
  cs ds es fs gs as bs
  \break
  cs:7 ds:7 es:7 fs:7 gs:7 as:7 bs:7
  \break
  cs:min ds:min es:min fs:min gs:min as:min bs:min
  \break
  cs:min7 ds:min7 es:min7 fs:min7 gs:min7 as:min7 bs:min7

}


\score {
  <<
    \new ChordNames \chordNames
    \new FretBoards \chordNames
  >>
  \layout { }
}

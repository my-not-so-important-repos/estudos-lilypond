\version "2.24.3"

\layout {
  indent = 0
}

\header {
  subsubtitle = "Aquarela - Toquinho"
  enteredby = "HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  %#(set-paper-size "a5landscape" )
  #(set-paper-size "a5" 'landscape )
}

global = {
  \key c \major
  \time 4/4
  \tempo 4=120
  \numericTimeSignature
  \easyHeadsOn
}


right = {
  r4   g'8  g'  c''  c''4  b'8  |
  a'4  g'8  g'  c''  c''4  b'8  |
  a'4  g'8  g'  a'4    a'|
  a'1  |
}


acordes = \chordmode {
  c1  | e:m | f | g |  \break
  c1  | e:m | f | g |  \break
  e:m | g   | f | g |  \break
  c   | e:m | f | g |  \break
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
  \layout {}
  \midi {}
}

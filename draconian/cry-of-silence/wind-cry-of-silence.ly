\version "2.24.3"
\language "english"
\include "../../header.ly"

\header {
  title = "Cry of Silence"
}

flute = \relative c'' {
  \global
  \tempo 4=100

  % {
  ef2. f4 ef d  c  ef d2 bf
  g f  ef1 f2 g1
  %}

  %{
  d2 e4 d d b d cis1 a4
  fis4 <e fis> d
  d e fis
  %}
}

\score {
  \new Staff \with {
    midiInstrument = "flute"
  } \flute
  \layout { }
  \midi {
  }
}

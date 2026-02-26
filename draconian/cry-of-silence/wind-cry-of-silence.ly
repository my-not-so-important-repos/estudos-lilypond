\version "2.24.3"
\language "english"

\header {
  title = "Cry of Silence"
  % Remove default LilyPond tagline
  tagline = ##f
}

#(set-global-staff-size 35)

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \key c \major
  \time 4/4
}

flute = \relative c'' {
  \global
  % Music follows here.

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
    \tempo 4=100
  }
}

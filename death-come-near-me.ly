\version "2.24.3"

\header {
  title = "Death Come Near Me"
}

global = {
  \time 4/4
  \key c \major
  \tempo 4=120
}

soprano = \relative c'' {
  \global
  b c a e
}

%{
alto = \relative c' {
  \global
  f
}
%}

tenor = \relative c' {
  \global
  c4
  
}

bass = \relative c {
  \global
  f, g
  
  a % all
  c % cows
  e % eat
  g % grass
  
}

verseOne = \lyricmode {
  \set stanza = "a."
  la ll hh
}

verseTwo = \lyricmode {
  \set stanza = "b."
  Hãn Hõn
}

verseThree = \lyricmode {
  \set stanza = "3."
  Rou!
}


\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      %\new Voice = "alto" { \voiceTwo \alto }
    >>
    
    %{
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseThree
    %}

    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi { }
}

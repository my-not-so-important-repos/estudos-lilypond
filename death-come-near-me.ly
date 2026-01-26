%{
Escrito por HeitorJr usando Frescobaldi.
criação    : 2026-01-25
modificação: 2026-01-25

Histórico de Mudanças
=====================
v1.1 - Layout A5 Landscape para melhor compatibilidade com e-readers.
v1.0 - implantação.

%}

\version "2.24.3"

\header {
  title = "Death Come Near Me"
  instrument = "synthesizer"
  composer = "Draconian"
  arranger = "HeitorJr"
}

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \numericTimeSignature
  \time 4/4
  \key c \major
  \tempo 4=120
}

soprano = \relative c'' {
  \global

  % b4 c a e
  d ees d c d ees d8 r
  %\break
  f ees d c bes
}

%{
alto = \relative c' {
  \global
  f
}
%}

tenor = \relative c' {
  \global
  c, 
  
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
      instrumentName = \markup \center-column { Spiritus Vaporama }
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
      instrumentName = \markup \center-column { Bass PW2 }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>

    
  \layout { }
  \midi { }
}

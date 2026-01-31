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
  % instrument = "synthesizer"
  % composer = "Composer: Draconian"
  % arranger = "Arranger: HeitorJr"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \numericTimeSignature
  \time 4/4
  \key c \major
  % \tempo 4=120
  
  \easyHeadsOn
}

soprano = \relative c'' {
  \global

  % b4 c a e
  d4 ees d c |
  d4 ees d2 |
  f4 ees d c |
  bes4 a 
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

chord_c = \relative c' {
  \global
  <c e g>
}

bass = \relative c {
  \global
  \easyHeadsOn

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
    
%{
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { Bass PW2 }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
    
    \new Staff \with {
      midiInstrument = "acoustic grand"
      instrumentName = \markup \center-column { mk2 }
    } <<
      \clef treble
      \new Voice = "chord_c" { 
        \voiceOne \chord_c
        \chordmode { c1 g a g c }
      }
    >>
%%}
  >>

    
  \layout { }
  %\midi { }
}

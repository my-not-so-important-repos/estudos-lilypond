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

right = \relative c' {
  \global
  % 1
  r2 c4   d |  e2 g2   |  g2 e2     |  f2 f2   |
  \break
  % 5
  r2 c4   d |  e2 g2   |  g2 f2     |  e1      |
  \break
  % 9
  r4 c4 c d |  e2 g2   |  r4 g4 f e |  c2 f2   |
  \break
  % 13
  r4 e4 e d |  d2 e2   |  r4 d4 d c |  c1
  \bar "|."
}

acordes = \chordmode {
  \global

  s1 | c,   | s | f, |
  s  | c,   | s | s  |
  s  | c,:7 | s | f, |
  s  | g,,  | s | c, |
}


% {
\score {

  <<
    \context ChordNames="bass" {
      \acordes
    }

    \context Staff="default" {
      \clef treble
      \right
    }
    %{
    \context Staff="bass2" {
      \clef bass
      \acordes
    }
    %}
  >>

  %{
  \new PianoStaff <<
    \new ChordNames { \acordes }
    \new Staff = "right" \right
  >>
  %}
  \layout {}
  \midi {}
}
%}


%{ Melhor compatíbilidade com piano-booster
\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "lead 1 (square)"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "lead 1 (square)"
    } { \clef bass \acordes }
  >>
  \layout { }
  \midi {
    \tempo 4=90
  }
}
% %}

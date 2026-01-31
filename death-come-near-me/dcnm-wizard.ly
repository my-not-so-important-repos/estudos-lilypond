%{
               Titulo: Death come near me
  Composição original: Draconian
        arranjado por: HeitorJr
%}

\version "2.24.3"
%\language "portugues"

\header {
  title = "Death Come Near Me"
  % instrument = "Synthesizer"
  composer = "Draconian"
  % arranger = "Arranjo: HeitorJr"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \numericTimeSignature
  \key c \major
  \time 4/4
  \easyHeadsOn
}

flute = \relative c'' {
  \global
  % Music follows here.
  d4 ees d c
  d4 ees d2
  f4 ees d c
  bes4 a bes c
  bes4 a g2 f4
}

solinhoFinal = \relative c'' {
  \global
  { d ees c d2 }
}

% -----------------------------------

\score {
  <<
    \flute
    \solinhoFinal
  >>
  \layout { }
}

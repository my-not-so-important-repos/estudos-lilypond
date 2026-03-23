%{
               Titulo: Death come near me
  Composição original: Draconian
        arranjado por: HeitorJr
%}

\version "2.24.3"
\language "english"

\header {
  subsubtitle = "Death Come Near Me - Draconian"
  % arranger = "Arranjo: HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 40)
\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \numericTimeSignature
  \key c \major
  %\time 4/4
  \easyHeadsOn
}



intervalo = {
  s s s s
}


intro = \relative c'' {
  d4 e-flat d c  d4 e-flat d1
  
  f4 e-flat d c
  b-flat4 a b-flat c
  b-flat4 a g f4 e-flat2
}


solinhoFinal = \relative c'' {
  d4 ef c d2 b-flat
  \intervalo
}


tudo = {
  \global
  \intro
  \bar "||"
  \solinhoFinal
}

% -----------------------------------

\score {
  <<
    \tudo
  >>
  \layout {}
  \midi {}
}

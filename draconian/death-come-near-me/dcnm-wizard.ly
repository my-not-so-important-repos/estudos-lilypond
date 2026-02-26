%{
               Titulo: Death come near me
  Composição original: Draconian
        arranjado por: HeitorJr
%}

\version "2.24.3"
%\language "portugues"

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
  d4 ees d c  d4 ees d1
  
  f4 ees d c
  bes4 a bes c
  bes4 a g f4 ees2
}


solinhoFinal = \relative c'' {
  d4 ees c d2 c bes 
  \intervalo
}


tudo = {
  \global
  \intro
  \intervalo
  \solinhoFinal
}

% -----------------------------------

\score {
  <<
    \tudo
  >>
  \layout { }
}

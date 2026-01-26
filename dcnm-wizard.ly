%{
               Titulo: Death come near me
  Composição original: Draconian
        arranjado por: HeitorJr
%}

\version "2.24.3"
%\language "portugues"

\header {
  title = "Death Come Near Me"
  instrument = "Synthesizer"
  composer = "Composição: Draconian"
  arranger = "Arranjo: HeitorJr"
}

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \numericTimeSignature
  \key c \major
  \time 4/4
}

violin = \relative c'' {
  \global
  % Music follows here.

}

flute = \relative c'' {
  \global
  % Music follows here.
  d ees d c
  d ees d r
  f ees d c
  bes a bes c
  bes a g f
}

solinhoFinal = \relative c'' {
  \global
  { d ees c d }
}


% \relative c'' 
% { c a f' e }
  
acousticBass = \relative c, {
  \global
  % Music follows here.
  d % ees d c d ees d
}







%-----------------------------------

violinPart = \new Staff \with {
  instrumentName = "Violin"
} \violin

flutePart = \new Staff \with {
  instrumentName = "Flute"
} \flute

acousticBassPart = \new Staff \with {
  instrumentName = "Acoustic bass"
} { \clef "bass_8" \acousticBass }

solinhoFinal = \new Staff {
  \clef treble
  \solinhoFinal
}




%-----------------------------------
\score {
  <<
    %\violinPart
    \flutePart
    \solinhoFinal
    %\acousticBassPart
  >>
  \layout { }
}

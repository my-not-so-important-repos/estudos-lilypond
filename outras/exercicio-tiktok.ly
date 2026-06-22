\version "2.24.3"
\language "english"

\layout {
  indent = 0
}

#(set-global-staff-size 35)

\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

global = {
  %\set Score.measureBarType = ""
  %\key c \major
  \numericTimeSignature
  \time 8/4
  %\tempo 4=120
  \tempo 4=60 
  \easyHeadsOn
}

\header {
  title = "Exercício do tik-tok"
  enteredby = "HeitorJr"
}

voicedefault = {
  %\set Score.measureBarType = ""
  \global
  c'4-. c'-. c'8-. df'4-. df'-. df'8-. c'4-. c'-. c'8-. bf4-. 
  bf-. bf8-. c'4-. c'-. c'8-. df'4-. df'-. df'8-. c'4-. c'-. c'8-. bf4-.  
  
  \bar "|."
}



voice_bass =  {
  \global
  \clef bass
  f2
}

\score{
  <<
    \context Staff="default" {
      \voicedefault
    }
    \context Staff="bass" {
      \voice_bass
    }
  >>

  \layout {}
  \midi {}
}


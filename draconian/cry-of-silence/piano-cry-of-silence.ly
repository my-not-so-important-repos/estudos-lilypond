\version "2.24.3"
\language "english"

\header {
  crossRefNumber = "1"
  footnotes = ""
  tagline = ##f
  %"Lily was here 2.24.3 -- automatically converted from ABC"
  subtitle = "Cry of Silence"
  enteredby = "HeitorJr"
}

#(set-global-staff-size 30)

\layout {
  indent = 0
}

\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

global = {
  \key c \major
  \numericTimeSignature
  \time 4/4
  \tempo 4=125
  \easyHeadsOn
}

voicedefault =  {
  \global
  s4 g' ef' ef''
  s1
  s4 g' ef' ef''
  s2 g' d'
  s4 g' c' ef''
}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global
  \clef bass
  ef1 
  s1
  ef1 
  
  
  c1
  %\bar "|."
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

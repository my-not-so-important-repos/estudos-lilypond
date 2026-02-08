\version "2.24.3"

\header {
  subsubtitle = "Death Come Near Me"
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "a5landscape")
}


% ----------------------------------------

\version "2.7.40"

\header {
  crossRefNumber = "1"
  footnotes = ""
  tagline = ##f
  %"Lily was here 2.24.3 -- automatically converted from ABC"
}

#(set-global-staff-size 30)
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

tananaaam_finger = {
  a'4-1  e''  d''
}

tananaaam = {
  a'4  e''  d''
}

descida_finger = {
  d''8[    c'']
  \bar "|"
  d''4    d''8[    e'']    d''[    c''    a'8-1    g'-2] |
}

descida = {
  d''8[    c'']
  \bar "|"
  d''4    d''8[    e'']    d''[    c''    a'8    g'] |
}


voicedefault =  {
  %\set Score.measureBarType = ""
  \global

  \repeat volta 2 {
    \bar ".|:" 
    d'' es'' c''
  }
}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global
  \clef bass
  
  \repeat volta 2 {
    \bar ".|:" 
    a1 | a 
  }
  a1
  \bar "|."
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

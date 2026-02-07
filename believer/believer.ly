\version "2.7.40"

\header {
  crossRefNumber = "1"
  footnotes = ""
  tagline = ##f
  %"Lily was here 2.24.3 -- automatically converted from ABC"
  subtitle = "Believer - Imagine Dragons"
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape" )
                  %"a5" 'landscape )
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
    \tananaaam_finger
    \descida_finger
    \tananaaam_finger
    \descida
    \break

    a'4 c'' a''2-5 | e''4.-5 e''8 d'' c'' a' g' |
    a'4 c'' a''2 |
    gis''1
  }
  a''1
}


\score{
  <<
    \context Staff="default" {
      \voicedefault
    }
  >>
  
  \layout {}
  \midi {}
}

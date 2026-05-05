\version "2.24.3"
\include "../header.ly"

\header {
  subtitle = "Believer - Imagine Dragons"
  enteredby = "HeitorJr"
}

tananaaam_finger = {
  a'4-1  e''  d''
}

tananaaam = {
  a'4  e''  d''
}

descida_finger = {
  d''8[    c'']
  %\bar "|"
  d''4    d''8[    e'']    d''[    c''    a'8-1    g'-2] |
}

descida = {
  d''8[    c'']
  %\bar "|"
  d''4    d''8[    e'']    d''[    c''    a'8    g'] |
}


voicedefault =  {
  %\set Score.measureBarType = ""
  \global

  %\unfoldRepeats
  \repeat volta 2 {
    %\bar ".|:"
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



voice_bass =  {
  %\set Score.measureBarType = ""
  \global { \tempo 4=125 }
  \clef bass
  %\unfoldRepeats
  \repeat volta 2 {
    %\bar ".|:"
    a1 | a | f | e
    \break
    a1 | a | f | e
    %\break
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


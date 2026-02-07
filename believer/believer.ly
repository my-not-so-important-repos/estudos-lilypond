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
  #(set-paper-size "a5" 'landscape )
}


voicedefault =  {
  %\set Score.measureBarType = ""

  \time 4/4
  \repeat volta 2 {
    a'4[    e''    d'']    d''8[    c'']
    \bar "|" 
    d''4    d''8[    e'']    d''[    c''    a'8    g'8]
  }
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

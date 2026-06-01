\version "2.24.3"
\include "../header.ly"

\header {
  
  title = "Sleepwalkers"
  subtitle = "Draconian"
  arranger = "apianothatplays + HAJ"
  enteredby = "HeitorJr"
}

voice_intro_bass = {
  c,4 c aes g
  aes,4  c g f
  f,2 c(
  c1)
}


voicedefault = {
  %\set Score.measureBarType = ""
  \global { \key ees \major }
  %\key "Em"

  

  %\unfoldRepeats
  \repeat volta 2 {
    r1 r r r
  }
  <g c' ees'>1(
  <g c' ees'>1)
  %\break
  r1
  r4.
  g8 g aes4.(
  aes2) r
  r1  r  r
  r2. c'4
  g'1
  d'4
  ees'2.(
  ees'2)  r
  
  d'4
  ees'2.
  
  d'4
  ees'2.
  
  r2 d'4  c'8 d'(
  d'4)  c'2.
  
  r2.  c'4
  <c' g'>1
  <f d'>4
  <f ees'>2.(
  <f ees'>2)
  r4.
  ees'8
  
  %\break
}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global {
    \tempo 4=110
    \key ees \major
  }
  \clef bass
  %\unfoldRepeats
  \repeat volta 2 {
    \voice_intro_bass
    \break
  }
  
  \unfoldRepeats
  \repeat volta 5 {
    \voice_intro_bass
    \break
  }
  
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


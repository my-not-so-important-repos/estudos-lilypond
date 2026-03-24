\version "2.24.3"
\include "../header.ly"

\header {
  subtitle = "Ostinato - Window"
}

\paper {
  #(set-paper-size "a5landscape" )
}

voicedefault =  {
  %\set Score.measureBarType = ""
  \global {
    %\key g \minor
  }
  <c'' c'''>  <c'' c'''>  <c'' c'''> |
  <c'' c'''>2. |
  <a' a''>2 (  <a' a''>8. )
  a''16
  |
  b''16  g''  f'' e''  d''  c''  d''  e''( e''4 ) (
  e'' 4 )
  <a' a''>
  <a' a''>
  <a' a''>2.
  \bar "||"
  
}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global  {
    %\tempo 4=125
    \time 3/4
    %\key d \major
  }
  \clef bass
  %\unfoldRepeats
  %\repeat volta 2 {
  %}
  s2.
  a,8 ( e e' a' e' c' )
  a,8 ( e e' a' e' c' )
  f8 ( g c' f' d' g )
  a,8 ( e e' a' e' c' )
  a,8 ( e e' a' e' c' )
  \bar "||"
  \break
  e,8 g,  e g c'
  %\bar "|."
  s1 s1 s1
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


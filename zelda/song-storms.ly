\version "2.24.3"
\include "../header.ly"
\language "english"

#(set-global-staff-size 37)
\header {
  title = "Song of Storms"
  subsubtitle = "Zelda OoT"

  composer = "c: Koji Kondo"
  arranger = "a: Shinobu Amayake"
  enteredby = "HeitorJr"
}

voicedefault = {
  %\set Score.measureBarType = ""
  \global {
    \time 3/4
    \tempo 4=160
  }

  r4
  <f' a'>4-.-2-4
  <f' a'>4-.
  |
  r8
  e'-1
  <g' b'>2-3-5
  |
  r4
  <a' c''>-.-3-5
  <a' c''>-.
  |
  r8
  e'-1
  <g' b'>2-3-5
  |
  r4
  <f' a'>-.
  <f' a'>-.
  |
  \break

  r8
  e'
  <g' b'>2
  |  
  r4
  <a' c''>-.
  <a' c''>-.

  r8
  e'
  <g' b'>2

  \mark \markup { \musicglyph #"scripts.segno" }
  %\mark \segno

  %\unfoldRepeats
  \repeat volta 2 {
    %\bar ".|:"
    d'8-1 f'-2  d''2-5
    d'8   f'8    d''2



    e''4-4
    r4
    \tuplet 3/2 {
      f''8 e''8 f''8
    }

    e''8-4
    c''8-2
    a'2-1

    a'4-5
    d'-1
    f'8
    g'




    % 1 ----------

    a'2.

    a'4
    d'
    f'8 g'




    <cs' e'>2.
  }

  <cs' a'>2-1-5
  a'4

  d'2.
  r r
  \break
  r r r r r
}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global {
    \time 3/4
    \tempo 4=160
  }
  \clef bass
  d2.-5
  e f e d
  \break

  e2.-5
  f e
  |



  %\unfoldRepeats
  \repeat volta 2 {
    %d2.
    %r4
    d4
    <f a>-.-3-1
    <f a>-.

    e4
    <g b>2-3-1
    %<g b>
    \break

    f4
    <a c'>-.-2-1
    <a c'>-.

    e4
    <g b>2-3-1

    bs,4
    <d f>-.-3-1
    <d f>-.

    f,4
    c2-1

    bs,4
    <d f>-.-3-1
    <d f>-.
    \break

    a,4->-5
    e2-1
  }  



  a,4-5 e2-1
  
  d4-5
  <f a>4-.-3-1
  <f a>4-.
  
  
  e4-5 <g b>2-1
  
  f4-4
  <a c'>4-.-2-1
  <a c'>4-.
  
  \break
  
  e4-5  < g b> 2-3-1
  
  d4
  <f a>-.-3-1
  <f a>-.-3-1
  
  e4 <g b>2-3-1
  
  f4
  <a c'>-.-2-1
  <a c'>-.

  e4

  <g b>2-3-1

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


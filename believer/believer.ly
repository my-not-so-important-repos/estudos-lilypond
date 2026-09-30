\version "2.24.3"

% \include "../header.ly"



\layout {
  indent = 0
}

\header {
  subtitle = "Believer - Imagine Dragons"
  enteredby = "HeitorJr"
  %crossRefNumber = "1"
  %footnotes = ""
  tagline = ##f
}

#(set-global-staff-size 35)

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

% --------------------------------

voice_a_finger = {
  a'4-1  e''  d''
}

voice_a = {
  a'4  e''  d''
}

voicedefault = {
  %\set Score.measureBarType = ""
  \global

  %\unfoldRepeats
  \repeat volta 2 {

    \voice_a_finger

    % descida_finger = {
      d''8[    c'']
      d''4    d''8[    e'']    d''[    c''    a'8-1    g'-2] |
      \break
    % }

    \voice_a

    % descida {
      d''8[    c'']
      d''4    d''8[    e'']    d''[    c''    a'8    g'] |
    % }

    \break

    a'4 c'' a''2-5 | e''4.-5 e''8 d'' c'' a' g' |
    a'4 c'' a''2 |
    gis''1
  }
  a''1
}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global
  \clef bass
  %\unfoldRepeats
  \repeat volta 2 {
    a1 | a | f | e
    \break
    a1 | a | f | e
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

\version "2.24.3"
\language "english"

\header {
  subsubtitle = "Death Come Near Me"
  enteredby = "HeitorJr"
  tagline = ##f
  %{
  crossRefNumber = "1"
  footnotes = ""
  %}
}

#(set-global-staff-size 30)

\paper {
  #(set-paper-size "a5landscape")
  %#(set-paper-size "a5" 'landscape )
}


% ----------------------------------------

global = {
  \key c \major
  \numericTimeSignature
  \time 4/4
  \tempo 4=125
  \easyHeadsOn
}



voicedefault = {
  %\set Score.measureBarType = ""
  \global
  r2.
  d''4 e-flat'' c'' d''2  bf'4
  s2 g'4 a' f'' ef'' d'' c'' d'' ef''
}

voice_bass = {
  %\set Score.measureBarType = ""
  \global
  \clef bass
  r2. <ef, ef>4(
    <ef, ef>4
  )
  r1
  r4   ef,4   <f, f>1
  s4
  <g, g>1
  % \bar "|."
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

\version "2.24.3"
\language "english"


\layout {
  indent = 0
}


#(set-global-staff-size 35)
\header {
  title = "A Thousand Years"
  composer = "Christina Perri"
  enteredby = "HeitorJr"
  tagline = ##f
}


\paper {
  #(set-paper-size "a5landscape")
}


global = {
  \key c \major
  \time 6/8
  %\time 3/4
  \tempo 4.=55
  \easyHeadsOn
}


perc = \drums {
  hihat4 hh bassdrum bd
}


right = {
  \global

  e'4.  e'4.  |
  e'4.  d'4.  |
  e'4.  e'4.  |
  e'4.  d'4.  |
  f'4.  f'4.  |
  f'4.  c'4.  |
  e'4.  e'4.  |
  d'4.  c'8 b8 g8 |
  \break
  c'4. c'4. |
  c'4. e'8 d'8 c'8 |
  c'4. c'4. |
  c'4. g'8 f' e' |
  c'8 a4 g'8 f' e' |
  \break

  % 14
  d'4 e'8 b4 c'8 |
  c'4. c'4. |
  c'4 c'8  e'8 d' c'
  c'4. c'4. |
  c'4. g'8 f' e'
  \break

  % 19
  c'8 a4 g'8 f' e' |
  d'4 e'8 b4 c'8
  a2 r4 |
  a4. b |
  c'2. s8
  b2.
  
  %{
  % 25
  g'8 d' c'4  e'8 g'16 e'8.
  
  e'8 g' e' e' g'16 e'8. 
  e'4.  e'8. |
  e'8 e'8 e'8 e'8 |
  e'16 e'16 e'8 e'8 e'16
  \break
  e'8 g'16 e'8.
  e'8 g'16 e'8. s4

  a'4 g'8 d' c'4 |
  e'8 g'16 e'8. |
  f'4. f'4.  |
  g'2.
  %}
}

left = {
  \global
  \slurNeutral ( c2.   c2.  ) |
  \slurNeutral ( a,2.  a,2. ) |
  \slurNeutral ( f,2.  f,2. ) |
  \slurNeutral ( g,2.  g,4. ) r
  \break
  \slurNeutral (<f, c>2.  <f, c>2.)
  \slurNeutral (c2. c2.)
  f,2.
  \break

  % 14
  g,2. |
  \slurNeutral( <f, c>2. <f, c>2. )
  \slurNeutral( c2. c2. )
  \break

  % 19
  a,2. | g,2. | \slurNeutral( <f, c>2.  <f, c>2. )
  a,2. a,2.
  %\break
  
  %{
  % 25
  \slurNeutral ( c2. c2. ) a2. |
  \slurNeutral ( c2. c2.)
  
  c2. 
  %}
  \bar "|."
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=55
  }
}

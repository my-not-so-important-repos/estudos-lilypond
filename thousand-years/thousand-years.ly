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
  #(set-paper-size "a5" 'landscape)
}


global = {
  \key c \major
  \time 6/8
  \tempo 4.=55
  \easyHeadsOn
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
  c'2.
  b2.
  
  \repeat volta 2 {
    % 25
    e'8 g'16 e'8.  e'8 g'16 e'8.  |
    a'4 g'8 d'8 c'4 |
    e'8 g'16 e'8.  e'8 g'16 e'8.
    \break
  
    % 28
    a'4 g'8   d'8 c'8 c'16 d'16 |
    f'4. e'4. |
    a4 c'8 d'8 c'8 d'8 |
    f'4. e'4.
    g2.
  }
  c'2.
  \bar "|."
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
  \break

  \repeat volta 2 {
     % 25
    \slurNeutral ( c2. | c2. )
    \slurNeutral ( a,2. |
    % 28
    a,2. ) |

    \slurNeutral ( <f, c>2. |  <f, c>2. )
    \slurNeutral ( g,2. g,2. )
  }
  c2.
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

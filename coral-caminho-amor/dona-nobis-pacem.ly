\version "2.24.3"
\layout {
  indent = 0
}
\header {
  title = "Dona Nobis Pacem"
  composer = "W. A. Mozart"
  enteredby = "HeitorJr"
  %crossRefNumber = "1"
  %footnotes = ""
  tagline = ##f
}

#(set-global-staff-size 35)

\paper {
  %#(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

% --------------------

global = {
  \time 3/4
  \key c \minor

  \numericTimeSignature
  \easyHeadsOn
  % \tempo 4=100
}

soprano = {
  \global
  \sectionLabel \markup \box {"A"}
  ees'8
  bes
  g'2

  f'8
  bes
  aes'2

  g'4 f' ees'

  ees' d'2

  c''4
  bes'8 aes'
  g' f'

  \break

  bes'4.
  aes'8
  g'4
  g'8 f' ees'4 d'
  ees'2.

  \sectionLabel \markup \box {"B"}
  bes'2. bes'2.

  \break

  bes'4
  aes' g'

  g'
  f'2

  c''4 c''2

  bes'4 bes'2
  bes'8 aes' g'4 f'
  \break

  ees'2.
  \sectionLabel \markup \box {"C"}
  ees'2.
  d'2.
  ees'4. f'8 g'8 aes'
  bes'4 bes2
  \break

  aes'4 aes'2
  g'4 g'2
  d'8 f' bes'4 bes

  ees'2.
}


verseOne = \lyricmode {
  %\set stanza = "1."
  Do - na
  No - bis
  Pa - cem
  Pa cem
  Do - - na -
  \break
  No - bis
  Pa - - - cem Do na
  no - bis pa cem
  Do na no bis
  pa - - -
  cem

  Do na No bis - - Pa cem

  Do na No bis Pa - - - cem
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      % instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      %\new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
  >>
  \layout { }
  \midi { }
}

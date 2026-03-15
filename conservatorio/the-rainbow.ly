\version "2.24.3"
\language "english"
\include "../header.ly"
\header {
  title = "The Rainbow"
  composer = "Roy G. Biv*"
  % Remove default LilyPond tagline
  tagline = ##f
}

%\paper {   #(set-paper-size "a5landscape") }
#(set-global-staff-size 40)

right = {
  \global {
    \time 3/4
    \tempo "Andante"
  }
  s2 d'4-2 | e' g' e' d' g' d' c'2 f'4 | e'2 d'4 |
  \break
  e'4 g' e' | d'4 g' d' | c'2 f'4 | e'2 d'4 |
  \break
  c'4 c' c' | d'2 d'4 | e'4 e' e' | \fermata g'4 g'  g' |
  \break
  f'4 d'-2 s4 |
  e'4 c' s |
  d'4 s2 |
  r4 |\fermata <e' g'>4
}

left =  {
  \global
  s2 r4 | c'2. | b |  a2. | <g b>2 r4 |
  \break
  c'2. | b2. | a | <g b>2 r4 |
  \break
  r2. b2. <a c'>2. | \fermata <g b>4 r r |
  \break
  s2 af4 | s2 g4 |
  s4 b g |
  \fermata c'2
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
    \tempo 4=100
  }
}

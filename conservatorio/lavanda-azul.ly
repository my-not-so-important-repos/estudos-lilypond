\version "2.24.3"
\include "../header.ly"


\header {
  title = "Lavanda Azul"
  tagline = ##f
}

#(set-global-staff-size 43)

\paper {
  %#(set-paper-size "a4" )
  %#(set-paper-size "a4landscape" )
  %#(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}



global = {
  \key c \major
  \numericTimeSignature
  \time 3/4
  \easyHeadsOn
}

right = {
  \global 

  c'4 g' g'  |   g'4 f'8 e' d' c' |  c'4 a' a'  |  a'2. | 
  \break
  c'4 g' g'  |   g'4 f'8 e' d' c' |  f'4 g' e'  |  d'2. |
  \break
  c'4 g' g'  |   g'4 f'8 e' d' c' |  c'4 a' a'  |  a'2. | 
  \break
  c'4 g' g'  |   g'4 f'8 e' d' c' |  f'4 e' d'  |  c'2. | 
  \break
  
  %c'4 g' g'  |  
}

left = {
  \global
  <c  g>2. | r2. | f2. | r4 e d |
  \break
  <c  g>2. | r | g2. | r4 e d |
  \break
  <c g>2. | r | f2. | r4 e d |
  \break
  <c g>2. | r | g | <c g>
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
    \tempo 4=80
  }
}

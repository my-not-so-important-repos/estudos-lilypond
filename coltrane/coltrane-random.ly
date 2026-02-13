
\version "2.24.3"

\header {
  title = "Random"
  subsubtitle = "Naive"
  composer = "Coltrane"
  arranger = "erb"
  % Remove default LilyPond tagline
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5" 'landscape)
}

global = {
  \key c \major
  \time 4/4
}

right = {
  \global
  
  dis f b dis g e g a d ais
}

left = {
  \global
  % Music follows here.
  c g c f dis ais fis f c b
  
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

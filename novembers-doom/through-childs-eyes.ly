\version "2.24.3"
\include "../header.ly"
\include "string-tunings-init.ly"
\language "english"

custom-tuning = \stringTuning <c f, as d g c'>
\header {
  title = "Through Childs Eyes"
  composer = "Novembers Doom"
}

#(set-global-staff-size 30)

upper= {
  \global
  \numericTimeSignature
  \time 4/4
  \tempo 4=120
  %\key e \major
  \set Staff.midiInstrument = "acoustic guitar (nylon)"
  
  as,
  < f a c'>

  %\unfoldRepeats
  \repeat volta 2 {
    a,
  }
  \break
  
  \bar "|."
}


\score {
  \new StaffGroup  <<

    \new Staff = "guitar" <<
      \context Voice = "acoustic guitar" {
        \clef "G_8"
        \voiceOne \upper
      }
    >>

    \new TabStaff = "tab" <<
      \set TabStaff.stringTunings = #custom-tuning
      \context TabVoice = "upper tab" {
        \clef "moderntab"
        \voiceOne \upper
      }
    >>
  >>
%{
  \layout {
    \context {
      \Staff
     % \hide StringNumber
    }
    \context {
      \TabStaff
      \revert Arpeggio.stencil
    }
  }
%}

  \midi { }
}

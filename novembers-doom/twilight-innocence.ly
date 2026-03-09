\version "2.24.3"
\include "../header.ly"

\header {
  title = "Twilight Innocence"
  composer = "Novembers Doom"
}

#(set-global-staff-size 30)

upper= {
  \global
  \numericTimeSignature
  \time 4/4
  \tempo 4=120
  %\key e \major
  \set Staff.midiInstrument = "acoustic guitar (steel)"

  %\unfoldRepeats
  \repeat volta 2 {
    a,8 e  a  c' e  b  a  e  |
    a,8 e  a  d' e  c' a  e  |
    a,8 e  a  c' e  b  e  d' |
    e8  e' e  c' e  b  a  e  |
  }
  \break
  
  f8 a  f  c' f  b  a  f |
  f8 a  f  d' f  c' a  f |
  f8 a  f  c' f  b  f d' |
  f8 e' f  c' f  b  a  f |
  \break
  
  \bar "|."
}


\score {
  \new StaffGroup  <<
    \new Staff = "guitar" <<
      \context Voice = "upper guitar" {
        \clef "G_8" \voiceOne
        %\clef treble \voiceOne

        \upper
      }
    >>
    \new TabStaff = "tab" <<
      \context TabVoice = "upper tab" { \clef "moderntab" \voiceOne \upper }
    >>
  >>

  \layout {
    \context {
      \Staff
      \hide StringNumber
    }
    \context {
      \TabStaff
      \revert Arpeggio.stencil
    }
  }

  \midi { }
}

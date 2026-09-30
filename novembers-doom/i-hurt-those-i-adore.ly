\version "2.24.3"
\include "../header.ly"

% https://lilypond.org/doc/v2.23/Documentation/notation/common-notation-for-fretted-strings

custom-tuning = \stringTuning <e,,  a,, d,, g, b, e'>
%custom-tuning = \stringTuning <c, f, aes, des, g, c>

%#(define standard-c-tuning (string-tuning '(c f bes ees g c)))

\header {
  title = "I hurt those I adore"
  composer = "Novembers Doom"
}

\paper {
  %#(set-paper-size "a5" 'landscape)
  #(set-paper-size "a5landscape")
}

#(set-global-staff-size 30)

upper= {
  \global
  \numericTimeSignature
  \time 4/4
  \tempo 4=185
  %\key e \major
  \set Staff.midiInstrument = "acoustic guitar (nylon)"

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
      \set TabStaff.stringTunings = #custom-tuning
      %\set TabStaff.stringTunings =  standard-c-tuning
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

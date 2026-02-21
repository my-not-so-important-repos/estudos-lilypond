\version "2.24.3"

\layout {
  indent = 0
}

\header {
  title = "Twilight Innocence"
  tagline = ##f
  %composer = "Novembers Doom"
  arranger = "Novembers Doom | HeitorJr"
}

#(set-global-staff-size 30)
\paper {
  indent = 0
  #(set-paper-size "a5landscape")
  %#(set-paper-size "a5" 'landscape)
}

global = {
  \easyHeadsOn
  %\key g \minor
}



upper= {
  \global
  \time 4/4
  \tempo 4=120
  %\key e \major
  \set Staff.midiInstrument = "acoustic guitar (steel)"

  a,8 e  a  c' e  b  a  e  |
  a,8 e  a  d' e  c' a  e  |
  a,8 e  a  c' e  b  e  d' |
  e8  e' e  c' e  b  a  e  |
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
  %{
  \layout {
    indent = 0
  %}

}

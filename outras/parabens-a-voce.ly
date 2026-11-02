\version "2.24.3"
\language "english"
\layout {
  indent = 0
}

\header {
  title = "Parabéns a você"
  composer = ""
  arranger = "HeitorJr"
  tagline = ##f
  % tagline = "github.com/my-not-so-important-repos/estudos-lilypond"
}

#(set-global-staff-size 35)

\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

global = {
  \time 6/4
  \numericTimeSignature
  \key c \major
  \tempo 4=126
  \easyHeadsOn
}

chordNames = \chordmode {
  \global
  c4 s s f e2
  c4 s s g f2
  s4 a8 s s e d2.
  as4 s s g f2

}

melody = {
  \global
  c'4 \grace c'8 d'4 c' f' e'2 |
  c'4 \grace c'8 d'4 c' g' f'2 |
  \break
  c'4 \grace c'8 a' f' f' e' d'2. |
  a'4 \grace as'8 a'4 f' g' f'2
}

words = \lyricmode {
  la la la

}

\score {
  <<
    \new ChordNames \chordNames
    % \new FretBoards \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}

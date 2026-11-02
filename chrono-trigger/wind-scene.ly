\version "2.24.3"
\language "english"

\layout {
  indent = 0
}

\header {
  title = "Wind Scene"
  subtitle = "Chrono Trigger"
  composer = ""
  enteredby = "HeitorJr"
  tagline = ##f
  % tagline = "github.com/my-not-so-important-repos/estudos-lilypond"
}

#(set-global-staff-size 35)

\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

global = {
  \time 4/4
  \numericTimeSignature
  \key d \minor
  \tempo 4=85
  \easyHeadsOn
}

chordNames = \chordmode {
  \global
  s1
  d4:min
  s
  bf
  s
  a4:min
  c
  f4
  c%/e
  d2:min c4 g:7

  c:4 c d:min bf

}

melodia = {
  \global
  r2
  d''4-3 e''

  \sectionLabel \markup \box {"A"}
  \repeat volta 2 {
    f''8 e'' c'' a' d''4
    r8 d''-5
    c''8 a' f' g' a'4 g'4-1
    e'8-2 f'-1 a' c'' <g' c'' e''>4 f''

    \break
    <f' g' c''>2. e''4-4
    f''8 e'' c'' a' d''4
    r8 d''-5
    c''8
    a' f' g' a'4 g'-1
    e'8 f' a' c'' <g' c'' e''>8 d'' <e' a' c''> d''
    \break

    <f' g' c''>2. e''4
    f''8 e'' c'' a' d''4-5
  }
  \break

  %do'4 re' mi' fa'
}

baixo = {
  \global
  \clef bass
  r1
  d8-5   a-2   e'4-1
  bf,8-5  f-3   c'4-1
  a,8 e c c'  f4  e
  d8 a e'4    g,8 d r g
  % d8 a e'4 g, a,

  \break
  c8-5 g d' f' <c' e'>4-5-3 r
  d8 a e'4 bf,8 f c'4
  a,8 e c c' f4 e
  d8 a e'4 g, a,
}

letra = \lyricmode {
  la la la

}

\score {
  <<
    \new ChordNames \chordNames
    % \new FretBoards \chordNames
    \new Staff { \melodia }
    \new Staff { \baixo }
    % \addlyrics { \letra }
  >>
  \layout { }
  \midi { }
}

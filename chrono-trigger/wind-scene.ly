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

#(set-global-staff-size 26)

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
  s1                                |
  d2:min            bf2             |
  a4:min    c       f4     c/e      |
  d2:min            c4/g   g:7      |

  c2.:sus4          c4              |
  d2:min            bf              |
  a4:min    c       f4     c/e      |
  d2:min            c4/g   a:min    |

  d2:sus4           d2              |
  d2:min            bf2             |
  a4:min7  c:7sus4  f4     a:7/e    |
  d2:min7           g2:7            |

  c1:sus4  |
  d2:min  bf  |
  a4:min7  c4:7sus4  f4  a:7/e |
  d2:min7  a4:min7/g  a:min |
  d:sus4  d

}

melodia = {
  \global
  r2  d''4-3  e''4 |

  \sectionLabel \markup \box {"A"}
  \repeat volta 2 {
    f''8  e''  c''  a'   d''4          r8   d''-5
    c''8  a'   f'   g'   a'4           g'4-1
    e'8-2 f'-1 a'   c''  <g' c'' e''>4 f''
    \break
    <f'   g'   c''>2.    e''4-4
    f''8  e''  c''  a'   d''4    r8      d''-5
    c''8  a'   f'   g'   a'4     g'-1
    e'8   f'   a'   c''  <g' c'' e''>8   d''  <e' a' c''> d''
    \break

    <g' a' d''>2         d''4-3   e''4   |
    \bar "||"
    \sectionLabel \markup \box {"A'"}
    f''8  e''  c''  a'   d''4.   d''8-5  |
    c''8  a'   f'   g'   a'4       g'4-1 |
    e'8   f'   a'   c''  e''4      f''   |
    \break

    c''2.                e''4-4          |
    f''8  e''  c''  a'   d''4.  d''8-5   |
    c''8  a'   f'   g'   a'4    g'-1     |
    e'8-2  f'-1  a'  c'' e''  d''  c''  d''  |
    d''2.  r8  a''8-5 |
    \bar "||"

  }
  \break
}

baixo = {
  \global
  \clef bass
  r1
  \repeat volta 2 {
    d8-5  a8-2  e'4-1      bf,8-5   f8-3  c'4-1  |
    a,8   e8    c8-5  c'8  f4           e4       |
    d8    a8    e'4        g,8  d8  r8   g8      |
   %d8    a8    e'4        g,4      a,4

    \break
     c8-5  g-2  d'-1  f'-2  <c' e'>4-5-3 r |
    d8    a8    e'4   bf,8  f8   c'4       |
    a,8   e8    c8    c'8   f4   e4        |
    d8    a8    e'4         g4,  a4,       |

    d8 a e' g' <d' fs'>2
    \clef treble
    <d' f'>2   <bf f'>2  |
    <a e' g'>4  <c' f' bf'>  <f' a'>  <e' a' cs''>  |
    <d' a' c''>2  <g f'>2  |
    \break
    <c' f'>2  e'2      |
    <d' f'>2  <bf f'>2 |


    r4 r r r

  }
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

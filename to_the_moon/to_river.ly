\version "2.24.3"
\include "../header.ly"

#(set-global-staff-size 30)
\header {
  subtitle = "To River"
  composer = "Johnny H. Wyles"
  enteredby = "HeitorJr"
}

boring_part = {
  d''8 e''
  d'' e''
  d'' e''
  d'' e''
}

not_so_boring_part = {
  d''8 e''
  d'' c''
  d'' e''
  f'' e''\!
}

boring_part_begin_crescendo = {
  d''8\< e''
  d'' e''
  d'' e''
  d'' e''
}

boring_part_begin_diminuendo = {
  d''8\> e''
  d'' e''
  d'' e''
  d'' e''
}

boring_part_end_whatever = {
  d''8 e''
  d'' e''
  d'' e''
  d'' e''\!
}

super_cool_part = {
  c4 g c' g
  a, e c' e
  f, c c' c
  g, d c' b
}

voicedefault =  {
  %\set Score.measureBarType = ""
  \global
  r2 r
  \boring_part
  \boring_part
  \boring_part_begin_crescendo
  \boring_part_end_whatever
  \break
  \boring_part_begin_diminuendo
  \not_so_boring_part
  \boring_part
  \boring_part_begin_crescendo
  \boring_part_end_whatever
  \break
  \not_so_boring_part
  \boring_part
  \boring_part
  \boring_part
  \not_so_boring_part
}

voice_bass =  {
  %\set Score.measureBarType = ""
  \global { \tempo 4=120 }
  \clef bass
  r1 r r
  \super_cool_part
  \super_cool_part
  \super_cool_part
  \bar "|."
}

\score{
  <<
    \context Staff="default" {
      \voicedefault
    }
    \context Staff="bass" {
      \voice_bass
    }
  >>

  \layout {}
  \midi {}
}

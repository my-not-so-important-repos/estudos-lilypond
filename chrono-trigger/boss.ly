\version "2.24.3"
\include "../header.ly"
% Chrono Trigger - Boss Battle
% Arranger: HeitorJr

\header {
  title = "Boss Battle"
  subtitle = "Chrono Trigger"
}

{
  \global {
    \key g \minor
  }
  \tempo 4=180

  \tuplet 3/2 { ges''8-5  des''-3  aes'-2 }
  \tuplet 3/2 { g'-1      c''      f''-5  }
  \tuplet 3/2 { e''-4     b'       ges'-1 }
  \tuplet 3/2 { f'-2      bes'-3   ees''-5  }
  < g' d'' >1-1-4
  < g' d'' >1
  
  %\repeat {
    r4 \tuplet 3/2 { g r8 g } d'
  %}
}

{
  \global {
    \key g \minor
  }

  \clef bass
  r1 |
  g,8 g, g, g, g, g, g, g, |
  g,8 g, g, g, g, g, g, g, |
  
}

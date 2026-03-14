\version "2.24.3"
\language "english"
\include "../header.ly"


\header {
  subtitle = "Chrono Trigger :: Frog‘s Theme"
  %composer = "Square Enix"
  enteredby = "HeitorJr"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5" 'landscape)
  %#(set-paper-size "a5landscape")
}


right = {
  \global {
    \tempo 4=126
  }
  % Music follows here.
  \tuplet 3/2 { a'8-3 g' a'} e'4 a'4    \tuplet 3/2 {  b'4  c''8 }   |
  \tuplet 3/2 { b'8 a' b' } g'2 d'4 |
  \tuplet 3/2 { a'8 g' a' } e'4-1 a'-2 \tuplet 3/2 { b'4 c''8 } |
  \break

  \tuplet 3/2 {b'8 c'' d''} b'2. |
  \tuplet 3/2 {a'8 g' a'} e'4 a' \tuplet 3/2 {b'4 c''8} |
  \tuplet 3/2 {b'8 a' b'} g'2 d'4
  \break

  \tuplet 3/2 {a'8 g' a'} b'4 c'' b'
  \tuplet 3/2 {a'8 g' a' }
  \tuplet 3/2 {a'8 g' a' } a'4  r
  \bar "||"

  \tuplet 3/2 {e''4-3 e''8 } \tuplet 3/2 {e''8 c'' d''} e''4 a''

  g''2 e''4. c''8-1 |
  a'2.-2 r4 |
  \tuplet 3/2 {a'8-1 b' c''}  \tuplet 3/2 {b'8 c'' d''}
  \tuplet 3/2 {c''-1 d'' e''} \tuplet 3/2 {d'' e'' g''}
  \break

  \tuplet 3/2 {e''4-3 e''8} \tuplet 3/2 {e''8    c''  d''}  e''4-1 a'' |
  b''4    (  \tuplet 3/2 {b''8 )  c''' b''}  a''4   g'' |
  a''1 |
  \break

  a''2 b''
  \bar "||"
  \tuplet 3/2 { c'''4-5 c'''8 } \tuplet 3/2 {c'''8 b'' a''} g''4 e'' |
  \tuplet 3/2 {a''4-4 a''8} \tuplet 3/2 {a'' g'' f''} e''2
  \break

  \tuplet 3/2 {c'''4-5 c'''8} \tuplet 3/2 {c'''8 b'' a''} g''4 e'' |
  a''2 b'' |
  \tuplet 3/2 {c'''4 c'''8}  \tuplet 3/2 {c''' b'' a''} g''4 e'' |
  \break
  
  \tuplet 3/2 {a''4-4 a''8} \tuplet 3/2 {a'' g'' f''} e''2
  \tuplet 3/2 {c'''4-4 c'''8} \tuplet 3/2 {c''' b'' c'''} d'''4 b''
  
  b''2  a''4 r
  \bar ":|."
}

left = {
  \global {
    \tempo 4=126
  }
  % Music follows here.
  <a c'>4-3-1 <a c'>  <a c'>  <a c'> |
  <g b>4-4-2  <g b>   <g b>   <g b> |
  <f a>4-5-3  <f a>   <f a>   <f a> |
  \break
  <g b>4  <g b>   <g b>   <g b> |
  <a c'>4 <a c'>  <a c'>  <a c'> |
  <g b>4  <g b>   <g b>   <g b> 
  \break
  
  <f a>4  <f a>   <f a>   <f a> |
  <a c'> <a c'> <a c'> r |
  \bar "||"
  <a c' e'>4 <a c' e'>4 <a c' e'>4 <a c' e'>4
  \break
  
  <e g c'>4 <e g c'> <e g c'> <e g c'> |
  <f a c'>4 <f a c'> <f a c'> <f a c'> |
  <g b d'>4 <g b d'> <g b d'> <g b d'> |
  \break
  
  <a c' e'>4 <a c' e'> <a c' e'> <a c' e'>
  <g b d'>4 <g b d'> <g b d'> <g b d'> |
  <f a c'>4 <f a c'> <f a c'> <f a c'>
  \break
  
  <e a b>4 <e a b> <e gs b> <e gs b>
  \bar "||"
  f4 <f a c'> g <g b d'> |
  f4 <f a c'> a <a b e'>
  \break
  
  
  f4 <f a c'> g <g b d'>
  <d fs a>4 \tuplet 3/2 { <d fs a>8 <d fs a> <d fs a> } <e gs b>4 \tuplet 3/2 {<e gs b>8 <e gs b> <e gs b>}
  f4 <f a c'> g <g b d'>
  \break
  
  f4 <f a c'> a <a b e'>
  f4 <f a c'> f <g b d'> |
  <a c' e'>4 \tuplet 3/2 {<a c' e'>8  <a c' e'>  <a c' e'>}  <a c' e'>4
  r
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
  \midi { }
}

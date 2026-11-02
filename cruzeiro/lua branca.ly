\version "2.24.3"

\header {
  title = "01 - Lua Branca"
  subtitle = "Cruzeiro"
  enteredby = "HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape")
}

\layout { indent = 0 }

global = {
  \easyHeadsOn
  \key c \major
  \time 3/4
  \tempo 4=100
}

primeira_tentativa = {
  r4
  c'2
  e'4
  g'2
  a'4
  a'2
  g'4
  b2(
  b4)
  g4 b d' f'2
}

captura_midi = {
  c'' c'' e'' g'' a'' a'' g'' b'2 g'4 b' d'' f''2 a''4 a''2 g''4 c''1
  c'' e'' g'' g'' a'' c''' b''2 a'' b''4 a'' g'' d'' f'' b' d''2 \grace d''4 c''2

  <f' a' c''> <c' e'> <c' e' g'> <f' a' c''>
}

{
  \global
  %\clef bass
  %tempo = 80 bpm
  %\primeira_tentativa
  \captura_midi
}



\version "2.24.3"

\layout {
  indent = 0
}

\header {
  title = "Lost Woods"
  subsubtitle = "Zelda OoT"
  composer = "Koji Kondo"
  arranger = "Shinobu Amayake"
  enteredby = "HeitorJr"
  % Remove default LilyPond tagline
  tagline = ##f
}

#(set-global-staff-size 24)

\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \key c \major
  \numericTimeSignature
  \time 2/4
  \tempo 4=120
  
  \easyHeadsOn
}

rightOne = {
  \global

  f'8\staccato-1
  a'\staccato-2
  b'4-3
  
  f'8\staccato
  a'\staccato
  b'4
  
  f'8-([
  a'-.)
  b'-.
  e''-.]
  
  d''4(
  b'8-.)
  c''-.-5
  
  b'8(
  g'-.)
  e'4(
  
  e'4)
  r8
  d'-.-2
  \break
  
  e'8(
  g'-.)
  e'4(
  
  e'2)
  
  f'8(
  a'-.)
  b'4
  
  f'8(
  a'-.)
  b'4
  
  f'8([
  a'-.)
  b'-.
  e''-.]
  
  d''4(
  b'8-.)
  c''-.
  
  e''8-5(
  b'-.-2)
  g'4-1(
  
  g'4)
  r8
  b'-.-5
  
  g'8-3(
  d'-.-1)
  e'4-2(
  
  e'2)
  
  s2
  s
}

rightTwo = {
  \global
  % Music follows here.
  
}

left = {
  \global
  % Music follows here.
  f8-.-4[
  <a c'>-.-2-1
  <a c'>-.
  <a c'>-.]
  
  f8-.[
  <a c'>-.
  <a c'>-.
  <a c'>-.]

  f8-.[
  <a c'>-.
  <a c'>-.
  <a c'>-.]

  f8-.[
  <a c'>-.
  <a c'>-.
  <a c'>-.]

  c8-.-5[
  <e g>-.-3-1
  <e g>-.
  <e g>-.]


  c8-.[
  <e g>-.
  <e g>-.
  <e g>-.]
  \break

  c8-.[
  <e g>-.
  <e g>-.
  <e g>-.]

  c8-.[
  <e g>-.
  <e g>-.
  c-.]

  f8-.-4[
  <a c'>-.-2-1
  <a c'>-.
  <a c'>-.]

  f8-.[
  <a c'>-.
  <a c'>-.
  <a c'>-.]

  f8-.[
  <a c'>-.
  <a c'>-.
  <a c'>-.]

  f8-.[
  <a c'>-.
  <a c'>-.
  <a c'>-.]
  \break
  
  c8-.-5[
  <e g>-.-3-1
  <e g>-.
  <e g>-.]
  
  c8-.[
  <e g>-.
  <e g>-.
  c-.]
  
  
  c8-.[
  <e g>-.
  <e g>-.
  <e g>-.]
  
  c8-.[
  <e g>-.
  <e g>-.
  e-.-3]
  
  s2
  s
  
  \bar "|."
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "ocarina"
    } << \rightOne \\ \rightTwo >>
    \new Staff = "left" \with {
      midiInstrument = "ocarina"
    } { \clef bass \left }
  >>
  \layout { }
  \midi { }
}

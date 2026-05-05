\version "2.24.3"
\language "english"
\layout {
  indent = 0
}

\header {
  title = "Lost Woods"
  subtitle = "Zelda OoT"
  composer = "Koji Kondo"
  arranger = "Shinobu Amayake"
  enteredby = "HeitorJr"
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
  \bar "||"

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
  \bar "||"

  d'8-2(
  e'-.-3)
  f'4-1

  g'8(
  a'-.)
  b'4
\break

  c''8(
  b'8-.)
  e'4(  
  e'2)

  <d' f'>8-1-3(
  <e' g'>-.-2-4)
  <f' a'>4-3-5

  <g' b'>8-1-3(
  <a' c''>-.-2-4)
  <b' d''>4-3-5

  <c'' e''>8-1-3(
  <d'' f''>-.-2-4)
  <e'' g''>4-3-5(

  <e''  g''>2)
  \break

  d'8-2(
  e'-.-3)
  f'4-1

  g'8(
  a'-.)
  b'4

  c''8(
  b'-.)
  e'4(
  
  e'2)
  
  <d' f'>8-2-4\<(
  <c' e'>8-.-1-3)
  <e' g'>8-2-4(
  <d' f'>8-1-3)
  
  <g' b'>8-2-4
  <f' a'>8-1-3
  <a' c''>8-2-4
  <g' b'>8-1-3\!
  
  
  
  
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
  
  d8-.-4[
  a8-.-1
  d8-.
  a8-.]

  g,8-.-5[
  d8-.-1
  g,8-.
  d8-.]

  c8-.-3[
  g8-.-1
  c8-.
  g8-.]

  a,8-.-5[
  e8-.-1
  a,8-.
  e8-.]

  c8-.[
  g8-.
  c8-.
  g8-.]

  a,8-.[
  e8-.
  a,8-.
  e8-.]

    c8-.[
  g8-.
  c8-.
  g8-.]

  a,8-.[
  e8-.
  a,8-.
  e8-.]
  \break

  \bar "||"
  d8-.[
  a8-.
  d8-.
  a8-.]

  g,8-.[
  d8-.
  g,8-.
  d8-.]

  c8-.[
  g8-.
  c8-.
  g8-.]

  a,8-.[
  e8-.
  a,8-.
  e8-.]

  d8[-.-4
  <a c'>8-.-2-1
  <a c'>8-.]
  r8

  d8[-.
  <a c'>8-.
  <a c'>8-.]
  r8
  \break
  
  c-.-5[
  <g b>-.-2-1
  <g b>-.]
  r8

  c-.[
  <g b>-.
  <g b>-.]
  r8
  
  e8-.-5[
  <a b>-.-2-1
  r8
  <a b>-.]

  e8-.[
  <a b>-.
  r8
  <a b>-.]

  e8-.-5[
  <gs b>8-.-3-1
  <gs b>8-.
  <gs b>8-.]
  
  <gs b>4-.
  e-.
  \bar "|."
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } << \rightOne \\ \rightTwo >>
    \new Staff = "left" \with {
      midiInstrument = "celesta"
    } { \clef bass \left }
  >>
  \layout { }
  \midi { }
}

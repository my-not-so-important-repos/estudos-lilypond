\version "2.24.3"

% #(system "ls")

\paper {
  indent = 0
}

\header {
  title = "Aquarela"
  composer = "Toquinho"
  enteredby = "HeitorJr"
}

right = {
  r4  g8  g  c'  c'4  b8  |
  a4  g8  g  c'  c'4  b8  |
  a4  g8  g  a4    a      |
  a1  |
}

left = {
  < c g >1 | r | f
}

acordes = \chordmode {
  c1  | e:m | f | g |  \break
  c1  | e:m | f | g |  \break
  e:m | g   | f | g |  \break
  c   | e:m | f | g |  \break
}

{
  %\score
  { \right }
  %\score
  { \acordes }
}


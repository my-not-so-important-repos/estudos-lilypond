\version "2.24.2"

\header {
  title = "Transcription"
  composer = "from uploaded score"
  tagline = ##f
}

% Global settings
global = {
  \key a \major
  \time 6/8
  \tempo 4.= 115  % quarter dotted = 115 approximates the feel; adjust if needed
  \clef treble
}

% Single-voice melody (relative to middle C)
melody = {
  \global

  % Measure 1: low F# pickup and ascending figure (eighths / dotted rhythm)
  % Starting on F#3 (written an octave higher in treble clef with relative)
  % The notation below follows 6/8 grouping and includes dotted and 16th figures.
  % Adjust octaves if you prefer sounding an octave lower (guitar/voice transposition).
  <
  fis,  % low F# (pickup)
  f' a c
  >8
  gisis16 a16 b8  % ascending sixteenth pair into an eighth
  cis8 d8 e8

  % Measure 2: ascending figure with dotted rhythm and sixteenth runs
  fis4. gis16 a16 b8
  cis8 d8 e8

  % Measure 3: another ascending figure starting from a lower note
  a8 b16 cis16 d8
  e4. fis16 gis16

  % Measure 4: closing phrase of the excerpt (dotted + sixteenth)
  a8 b8 cis8
  d4. cis16 b16

  % Repeat or continue as needed to match the full page; this block represents the full
  % melodic passage visible in the uploaded image. If the original contains more bars,
  % append them following the same notation style.
}

% Layout and score
\score {
  \new Staff <<
    \new Voice = "mel" { \melody }
  >>
  \layout {
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
  }
  \midi { }
}

\version "2.24.2"

% Through A Child's Eyes - transcription template
% Two guitars (Vito guitar, Larry guitar) with standard staff + tablature
% Tempo: quarter = 115, piece begins in free time (use \time 0/4 for free time if desired)

\header {
  title = "Through A Child's Eyes (transcription template)"
  composer = "Novembers Doom (arr. transcription)"
  tagline = ##f
}

% --- Global settings ---
global = {
  \tempo 4 = 115
  % If the piece begins in free time, you can use \time 0/4 at the start of the first voice
  % Example: \time 0/4
}

% --- TUNING ---
% Replace the pitches below with the exact string tunings for Drop A#.
% Example standard tuning (for reference): e' a' d' g' b' e'
% For Drop A# you will need to set the actual pitches; below are placeholders.
% To set string tunings for TabStaff, use TabStaff.stringTunings.
% Example: 
\set TabStaff.stringTunings = #`( (string-tuning 'e')
                                   ,(string-tuning 'a')
                                   ,(string-tuning 'd')
                                   ,(string-tuning 'g')
                                   ,(string-tuning 'b')
                                   ,(string-tuning 'e'))
% Simpler: use pitch names directly in the TabStaff block as shown later.

% --- Guitar 1 (Vito) ---
vitoVoice = \relative c' {
  \global
  % If the opening is free time:
  % \time 0/4
  % --- Enter standard notation for Vito guitar here ---
  % Example placeholder measure:
  % c4 d e f | g a b c
  % Replace the following with the actual notes from the score:
  s1 % silent placeholder; replace with actual music
}

vitoTab = \relative c {
  % --- Enter tablature for Vito guitar here ---
  % Use fret numbers on string positions. Example:
  % <e a d g b e>4  % chord placeholder
  % Replace the following with actual tab:
  s1
}

% --- Guitar 2 (Larry) ---
larryVoice = \relative c' {
  \global
  % \time 0/4
  % --- Enter standard notation for Larry guitar here ---
  s1
}

larryTab = \relative c {
  % --- Enter tablature for Larry guitar here ---
  s1
}

% --- Score layout ---
\score {
  <<
    % Vito: staff + tab
    \new StaffGroup <<
      \new Staff = "VitoStaff" <<
        \clef "treble_8" % adjust clef/octave if needed
        \new Voice = "VitoVoice" { \vitoVoice }
      >>
      \new TabStaff = "VitoTab" <<
        % Set string tunings here if you know the exact pitches.
        % Example (standard tuning): \set TabStaff.stringTunings = #`( (string-tuning 'e') (string-tuning 'a') (string-tuning 'd') (string-tuning 'g') (string-tuning 'b') (string-tuning 'e') )
        % Replace with Drop A# tunings as needed.
        \new TabVoice = "VitoTabVoice" { \vitoTab }
      >>
    >>

    % Larry: staff + tab
    \new StaffGroup <<
      \new Staff = "LarryStaff" <<
        \clef "treble_8"
        \new Voice = "LarryVoice" { \larryVoice }
      >>
      \new TabStaff = "LarryTab" <<
        % Set string tunings for Larry here (same or different)
        \new TabVoice = "LarryTabVoice" { \larryTab }
      >>
    >>
  >>
  \layout {
    \context {
      \Score
      % Reduce system spacing if you want more compact engraving
      % \override NonMusicalPaperColumn #'line-break-permission = ##f
    }
  }
  \midi { } % remove or keep if you want MIDI output
}


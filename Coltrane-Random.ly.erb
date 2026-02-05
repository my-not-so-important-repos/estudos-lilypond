<%
require 'coltrane'

num_notes = 10

def random_note
  base_note = Coltrane::Theory::Note['A']
  some_random_note = base_note + (rand * 12).to_i
  normalized = some_random_note.pitch_class
  text = normalized.name.downcase.gsub('#', 'is')
end

some_notes = Array.new(4) { random_note }
%>
\version "2.24.3"

\header {
  title = "Random"
  subsubtitle = "Naive"
  composer = "Coltrane"
  arranger = "erb"
  % Remove default LilyPond tagline
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5" 'landscape)
}

global = {
  \key c \major
  \time 4/4
}

right = {
  \global
  <%#= some_notes.join(' ') %>
  <%= Array.new(num_notes) { random_note }.join(' ') %>
}

left = {
  \global
  % Music follows here.
  <%= Array.new(num_notes) { random_note }.join(' ') %>
  
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
  \midi {
    \tempo 4=100
  }
}

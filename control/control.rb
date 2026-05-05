#! ruby
# Creates a midi with instructions.
require 'midilib'

#require 'midilib/sequence'
#require 'midilib/io/seqreader'
#require 'midilib/io/seqwriter'

# Load existing MIDI file
seq = MIDI::Sequence.new
File.open('input.mid', 'rb') do |file|
  MIDI::IO::SeqReader.new(seq).read(file)
end

# Pick the first track (you can choose another if needed)
track = seq.tracks[0]

# Insert Program Change at tick 0 (channel 0, program 10)
track.events.insert(0, MIDI::ProgramChange.new(0, 10, 0))

# Insert Control Change (Filter Cutoff CC74, value 64) at tick 120
track.events << MIDI::Controller.new(0, 74, 64, 120)

# Save modified file
File.open('output.mid', 'wb') do |file|
  MIDI::IO::SeqWriter.new(seq).write(file)
end


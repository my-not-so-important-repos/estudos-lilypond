# MIDI Workflow Guide

This document describes the complete MIDI workflow in the estudos-lilypond repository, from hardware recording to LilyPond transcription and playback.

## Overview

The MIDI workflow consists of three main phases:

1. **Record** - Capture performances from hardware keyboards via MIDI
2. **Transcribe** - Convert MIDI to LilyPond notation for editing and refinement
3. **Synthesize** - Playback MIDI through connected hardware or software synthesizers

## Repository Tooling

| Tool | Role in this repository | Installation |
| --- | --- | --- |
| LilyPond (`lilypond`, `midi2ly`, `abc2ly`) | Typesets `.ly` scores, exports MIDI, and converts ABC or MIDI into LilyPond source. | `sudo apt install lilypond` |
| ABCMIDI (`midi2abc`) | Converts recorded Standard MIDI files to ABC as an alternative intermediate notation format. | `sudo apt install abcmidi` |
| ALSA utilities (`arecordmidi`, `aplaymidi`, `amidi`, `aseqdump`, `arecord`) | Records and plays MIDI, inspects ALSA devices, and records audio. The Rake tasks call `aplaymidi`. | `sudo apt install alsa-utils` |
| Ruby and Rake | Runs `Rakefile` tasks and the MIDI-editing example in `control/control.rb`. | `sudo apt install ruby rake` |
| `midilib` Ruby gem | Reads, edits, and writes MIDI in `control/control.rb`; the example inserts program and controller events. | `gem install midilib` |
| Coltrane Ruby gem | Generates notes for the proof of concept in `coltrane/`. | `gem install coltrane` |
| Rouge Ruby gem | Provides the local LilyPond syntax lexer in `lib/lilypond.rb`. | `gem install rouge` |
| Frescobaldi | Optional GUI LilyPond editor used for score editing. | `sudo apt install frescobaldi` |
| PianoBooster | Optional MIDI learning/playback application installed by `setup.sh`. | `sudo apt install pianobooster` |
| SoX (`sox`, `rec`, `play`) | Records audio, creates spectrograms, and supports phase-inverted noise cancellation. | `sudo apt install sox` |
| FFmpeg | Records ALSA audio and creates spectrogram images. | `sudo apt install ffmpeg` |

`setup.sh` installs LilyPond, PianoBooster, Frescobaldi, ALSA utilities, SoX, Ruby, Coltrane, and Rouge. Install `abcmidi`, `midilib`, or FFmpeg separately when using the workflows that require them.

## Hardware Setup

### Connected Devices

The repository is configured for use with:
- **Recording Input**: MIDI keyboard (port 20:0 in examples)
- **Playback Output**: MicroKorg2 synthesizer (port 20)

Your setup may vary; use the device enumeration commands below to identify your ports.

### Device Discovery

#### List MIDI Input Devices

```bash
arecordmidi -l
```

Output shows available MIDI input ports in the format `<card>:<port>`.

Example output:
```
Port    Client name                      Port name
20:0    IAC Driver                       IAC Driver (write)
24:0    Midi Through                     Midi Through Port-0
```

#### List MIDI Output Devices

```bash
aplaymidi --port list
```

Or via `amidi`:

```bash
amidi -l
```

#### List All Audio/MIDI Devices (Comprehensive)

```bash
# ALSA audio devices
arecord -l

# ALSA MIDI devices
amidi -l

# PulseAudio sources (if using PulseAudio)
pactl list sources
```

## Recording MIDI

### Basic Recording

Record MIDI from a hardware keyboard until you press `Ctrl+C`:

```bash
arecordmidi -p 20:0 output.mid
```

**Parameters:**
- `-p 20:0` - MIDI input port (adjust to your device)
- `output.mid` - Output filename

### Record with Tempo and Time Signature

Specify BPM and time signature during recording:

```bash
arecordmidi --bpm=120 --timesig=4:4 -p 20:0 recording.mid
```

**Parameters:**
- `--bpm=120` - Tempo in beats per minute
- `--timesig=4:4` - Time signature (numerator:denominator)

### Record with Custom BPM and Compound Meter

Example: recording in 6/8 time at 55 BPM:

```bash
arecordmidi --bpm=55 --timesig=6:8 -p 20:0 thousand.mid
```

### Stop Recording

Press `Ctrl+C` to stop the recording session.

## Playing Back MIDI

### Play to Default Device

```bash
aplaymidi filename.mid
```

### Play to Specific Hardware Synthesizer

Send MIDI to a connected synthesizer on a specific port:

```bash
aplaymidi --port 20 filename.mid
```

**Parameters:**
- `--port 20` - MIDI output port (adjust to your device)

### Rake Task: Synthesize

The repository includes a Rake task to send MIDI files to the MicroKorg2:

```bash
rake synth
```

This task:
1. Finds all `.midi` files in the current directory
2. Sends each file to the MicroKorg2 synthesizer (port 20)

The underlying function is defined in `lib/task_lib.rb`:

```ruby
def send_to_my_microkorg2(midi)
  system("aplaymidi --port 20 #{midi}")
end
```

## Converting MIDI to LilyPond

### Direct conversion with `midi2ly`

`midi2ly` is installed with LilyPond and creates a LilyPond source file directly from a Standard MIDI file:

```bash
midi2ly --output=output.ly input.mid
```

Treat its output as a starting point: review durations, quantization, voices, key and time signatures, and formatting before rendering.

### MIDI-to-ABC-to-LilyPond conversion

Use ABCMIDI's `midi2abc` when ABC is a more convenient intermediate format. This route matches the repository's existing `rake abc` task, which converts every `.abc` file in the current directory with `abc2ly`.

```bash
# Install the MIDI-to-ABC converter once
sudo apt install abcmidi

# Convert MIDI to ABC; midi2abc writes ABC to standard output
midi2abc input.mid > output.abc

# Convert ABC to LilyPond
abc2ly output.abc

# Render the generated output.ly
lilypond --png --pdf output.ly
```

From a directory containing only the intended ABC input, the repository task can perform the second and third steps:

```bash
rake abc
rake ly
```

`midi2abc` infers notation from performance timing, so manually refine the generated ABC or LilyPond source. Keep the original `.mid` alongside the derived files.

### Inspecting a MIDI file with `midicsv`

`midicsv` is optional and useful when diagnosing tracks, tempo events, or controller data:

```bash
# Install
sudo apt install midicsv

# Convert MIDI to CSV
midicsv input.mid output.csv

# View the CSV
less output.csv

# Convert CSV back to MIDI
csvmidi output.csv reconstructed.mid
```

### Editing with Frescobaldi

Use Frescobaldi as a GUI editor for the generated LilyPond source:

```bash
sudo apt install frescobaldi
frescobaldi
```

Steps:
1. Open Frescobaldi
2. Open the generated `.ly` file
3. Refine notation and compile through LilyPond

### Manual Transcription Workflow

For best results with complex pieces:

1. **Record MIDI** from keyboard with tempo and time signature metadata
2. **Use `midi2ly` or `midi2abc`** to generate initial notation, then open the `.ly` output in Frescobaldi if desired
3. **Refine in LilyPond**:
   - Correct note pitches and durations
   - Add expression markings (dynamics, articulation)
   - Organize into multiple staves if needed
   - Apply consistent formatting using `header.ly`

4. **Render and verify**:
   ```bash
   lilypond --png your-piece.ly
   ```

5. **Export as MIDI for playback verification**:
   ```bash
   lilypond --midi your-piece.ly
   ```

## Complete Workflow Example

### Step 1: Record a Performance

Record a new piece at 100 BPM in 4/4 time:

```bash
arecordmidi --bpm=100 --timesig=4:4 -p 20:0 new-piece.mid
# Play your piece on the keyboard
# Press Ctrl+C when done
```

### Step 2: Playback for Verification

Listen to the recording to ensure it captured correctly:

```bash
aplaymidi new-piece.mid
```

Or send to your synthesizer:

```bash
aplaymidi --port 20 new-piece.mid
```

### Step 3: Generate Initial LilyPond File

Use `midi2ly` to create a starting point:

```bash
midi2ly --output=new-piece.ly new-piece.mid
```

Or inspect the MIDI structure first:

```bash
midicsv new-piece.mid new-piece.csv
cat new-piece.csv
```

### Step 4: Manual Refinement in LilyPond

Edit `new-piece.ly`:

```lilypond
\version "2.24.3"
\include "../header.ly"

\header {
  title = "New Piece"
  composer = "Your Name"
}

global = {
  \key c \major
  \time 4/4
  \tempo 4=100
}

right = \relative c' {
  \global
  % Add your refined notation here
  c4 d e f | g2 g2 | \bar "|."
}

\score {
  \new Staff \with { \RemoveEmptyStaves } \right
  \layout { }
  \midi { }
}
```

### Step 5: Render to PDF and Images

Generate visual notation:

```bash
lilypond --png --pdf new-piece.ly
```

Outputs:
- `new-piece.pdf` - High-quality printable score
- `new-piece.png` - Raster image for web/documentation

### Step 6: Export as MIDI for Playback Verification

Generate a MIDI file from your refined LilyPond notation:

```bash
lilypond --midi new-piece.ly
```

This creates `new-piece.midi`, which you can then:
- Play back to verify correctness
- Send to synthesizer for performance

## Audio Recording (Complementary)

Sometimes you want to record the audio output, not just MIDI data.

### Record Audio from Hardware Synthesizer

#### Using `arecord` (ALSA)

```bash
arecord -f cd -t wav output.wav
```

List recording devices:

```bash
arecord -l
```

Record from specific device:

```bash
arecord -D hw:1,0 -f cd -t wav output.wav
```

#### Using `ffmpeg`

```bash
ffmpeg -f alsa -i hw:1,0 -acodec pcm_s16le -ar 44100 output.wav
```

#### Using `sox` (Sound eXchange)

```bash
rec -r 44100 -b 16 -c 2 output.wav
```

Record with timeout (30 seconds):

```bash
timeout 30 arecord -f cd -t wav recording.wav
```

### Noise Cancellation

If you need to remove background noise, use SoX:

```bash
# Invert the noise signal and mix to create cancellation
sox -m input.wav -v -1 noise.wav diff.wav
```

### Spectral Analysis

View frequency content of audio recordings:

```bash
# Using ffmpeg
ffmpeg -i input.wav -lavfi showspectrumpic=s=1024x1024 output.png

# Using SoX
sox input.wav -n spectrogram -o output.png -t "Spectrogram" -z 120
```

## Troubleshooting

### No MIDI Input Detected

**Problem**: `arecordmidi` reports no devices or fails to connect.

**Solutions:**

1. **Check device availability:**
   ```bash
   amidi -l
   arecordmidi -l
   ```

2. **Verify permissions:**
   ```bash
   sudo usermod -a -G audio $USER
   newgrp audio
   ```
   Then log out and back in.

3. **Check ALSA configuration:**
   ```bash
   alsamixer
   ```
   Use arrow keys to adjust input levels; press F6 to select device.

4. **Use PulseAudio alternative** (if available):
   ```bash
   parecord --device=<device_name> output.wav
   ```

### MIDI Playback Not Working

**Problem**: `aplaymidi` runs but produces no sound.

**Solutions:**

1. **Verify output port:**
   ```bash
   aplaymidi --port list
   ```

2. **Check synthesizer is on and receiving MIDI** on the specified port.

3. **Test with a MIDI monitor:**
   ```bash
   # Use aseqdump to see MIDI events in real-time
   aseqdump -p 20
   ```
   Then play MIDI to see if events appear.

4. **Check volume levels:**
   ```bash
   alsamixer
   ```

### MIDI Recording Has Timing Issues

**Problem**: Recorded MIDI tempo or time signature is incorrect.

**Solutions:**

1. **Always specify BPM during recording:**
   ```bash
   arecordmidi --bpm=<tempo> --timesig=<sig> -p <port> output.mid
   ```

2. **Verify tempo was recorded:**
   ```bash
   midicsv output.mid output.csv | grep -i tempo
   ```

3. **Recreate with explicit tempo in LilyPond:**
   ```lilypond
   \tempo 4=120  % Explicitly set tempo
   ```

### Frescobaldi Won't Open Files

**Problem**: Frescobaldi crashes or won't load MIDI files.

**Solutions:**

1. **Update Frescobaldi:**
   ```bash
   sudo apt update
   sudo apt install --upgrade frescobaldi
   ```

2. **Use command-line conversion** instead:
   ```bash
   midi2ly --output=notation.ly your-midi.mid
   ```

3. **Import as ABC** if available, then convert to LilyPond.

## Best Practices

1. **Record with metadata**: Always specify `--bpm` and `--timesig` when recording; it's essential for accurate transcription.

2. **Verify immediately**: Always playback recordings right after capturing to catch issues early.

3. **Archive originals**: Keep the MIDI recording separate from refined notation.

4. **Use version numbers**: If creating multiple takes, use suffixes:
   ```
   piece-v1.mid  # First recording
   piece-v2.mid  # Refined version
   piece.ly      # Final transcription
   ```

5. **Test rendering**: Frequently run `lilypond --png` while editing to catch syntax errors.

6. **Hardware synchronization**: When sending to synthesizers, verify the patch/program is correct for your music.

7. **Backup recordings**: MIDI files are small; keep backups of raw recordings before manual editing.

## Related Documentation

- **LilyPond notation conventions**: See `.github/copilot-instructions.md`
- **Audio recording details**: See `comandos.md`
- **Build and Rake tasks**: See `Rakefile` and `lib/task_lib.rb`

## Resources

- **LilyPond Manual**: https://lilypond.org/doc/
- **ALSA Audio System**: https://www.alsa-project.org/
- **Frescobaldi**: https://www.frescobaldi.org/
- **MIDI Specification**: https://www.midi.org/

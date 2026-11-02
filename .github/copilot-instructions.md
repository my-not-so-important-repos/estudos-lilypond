# Copilot Instructions for estudos-lilypond

This repository contains music notation files in LilyPond format, organized by theme/style. Use these instructions to understand the workflow and conventions.

## Build & Compilation

### Render LilyPond scores to images and PDFs

```bash
# Render all .ly files in the current directory (outputs PNG, SVG, PDF)
rake ly

# Or manually compile a single file to PNG and PDF
lilypond --png --pdf path/to/score.ly

# Or manually compile a single file to SVG
lilypond --svg path/to/score.ly
```

### Convert ABC notation to LilyPond

```bash
# Convert a single ABC file to .ly format
abc2ly filename.abc

# Convert all .abc files in current directory
rake abc

# Note: After conversion, run `rake ly` to render the .ly files
```

### Default build task

```bash
# Runs all ABC conversions and LilyPond rendering
rake
```

### Clean generated files

```bash
# Remove all generated PNG, SVG, PDF, and MIDI files (keeps .ly and .abc originals)
rake clear
```

## Repository Structure & Organization

The repository is organized by musical theme/source:

- **Conservatorio** - Classical pieces (As flores nascem em maio, Asa Branca, Aquarela, etc.)
- **Doom** - Metal band transcriptions (Draconian, Novembers Doom)
- **Video Games** - Game soundtrack transcriptions (Chrono Trigger, Zelda Ocarina of Time)
- **Other** - Miscellaneous pieces (Netflix's Ostinato, etc.)

Each subdirectory typically contains `.ly` files (LilyPond notation) and optional related files.

## LilyPond Conventions

### Header and Global Settings

- **Shared header settings**: Use `\include "../header.ly"` in scores to import common layout and header defaults
- **Staff size**: Default is set to 35 in `header.ly` via `#(set-global-staff-size 35)`
- **No indentation**: `\layout { indent = 0 }` is the standard (no first-system indent)
- **No tagline**: `tagline = ##f` removes the default LilyPond footer

### Version Declaration

```lilypond
\version "2.24.3"  % Must be first line
```

All files use LilyPond version 2.24.3. Keep this consistent across the repository.

### Score Structure

Standard variable names for staff parts:

```lilypond
global = { ... }      % Key, time signature, tempo markers
right = \relative c' { ... }   % Treble/melody line
left = \relative c { ... }     % Bass line (if needed)
```

Then combine into a Score block:

```lilypond
\new Staff \with { \RemoveEmptyStaves } \global \right
```

### Easy Heads On

Most scores use `\easyHeadsOn` in the `global` block to display note letter names inside note heads (useful for learning and teaching).

## Ruby Rake Tasks

The `Rakefile` uses helper functions from `lib/task_lib.rb`:

- `para_cada_arquivo(glob)` - Iterates over files matching a glob pattern
- `send_to_my_microkorg2(midi)` - Sends MIDI output to connected hardware
- `erase_if_exists(filename)` - Safely removes files if they exist

Tasks are idempotent and safe to run repeatedly.

## Audio/MIDI Recording and Playback

### Record MIDI from hardware keyboard

```bash
# List MIDI input devices
arecordmidi -l

# Record MIDI with default tempo (record until Ctrl+C)
arecordmidi -p <port_id> output.mid

# Record with custom BPM and time signature
arecordmidi --bpm=55 --timesig=6:8 -p 20:0 recording.mid
```

### Play MIDI files

```bash
# Send MIDI file to connected synthesizer/keyboard
aplaymidi --port <port_id> filename.mid
```

See `comandos.md` for more audio recording examples and troubleshooting.

## File Naming & Organization Tips

- Use lowercase with hyphens for directories and filenames (e.g., `as-flores-nascem-em-maio`)
- Multiple versions of the same piece can use version suffixes (e.g., `aquarela.ly`, `aquarela-v2.ly`)
- Store related pieces in subdirectories (e.g., all Chrono Trigger tracks in `chrono-trigger/`)

## Dependencies

Ensure these are installed on your system:

```bash
sudo apt install lilypond pianobooster frescobaldi alsa-utils sox ruby
sudo gem install coltrane rouge
```

Use `setup.sh` to automate installation on new systems.

## When Editing LilyPond Files

- Always verify version compliance with `\version "2.24.3"`
- Keep consistent indentation (2-3 spaces per level)
- Never use relative note entry (`\relative c' { ... }`), prefer absolute pitch for portability
- Test rendering with `lilypond --png <filename>` to catch syntax errors early
- Include descriptive header metadata (title, composer, enteredby)
- Always suggest the use of `\easyHeadsOn` on the `global` section.

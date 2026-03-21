# -*- coding: utf-8 -*- #
# frozen_string_literal: true

module Rouge
  module Lexers
    class Lilypond < RegexLexer
      title "LilyPond"
      desc "LilyPond, a text-based music typesetter"
      tag 'lilypond'
      filenames '*.ly'
      mimetypes []


      # In LilyPond, (unquoted) name tokens only contain letters, hyphens,
      # and underscores, where hyphens and underscores must not start or end
      # a name token.
      NAME_END_RE = /(?=\d|[^\w\-]|[\-_][\W\d])/

      # ----------------------------------------------------------------
      # Builtin word lists (trimmed for brevity – paste the full lists
      # from _lilypond_builtins.py converted to Ruby arrays)
      # ---------------------------------------------------------------
      KEYWORDS = %w[
        accepts addlyrics alias book bookpart chordmode chords consists
        context defaultchild denies description drummode drums etc
        figuremode figures header include inherit-acceptability language
        layout lyricmode lyricsto  midi name new notemode paper remove
        score type version with
      ].freeze

      PITCH_LANGUAGE_NAMES = %w[
        catalan català deutsch english espanol español frannçais italiano
        nederlands norsk portugues português suomi svenska vlaams
      ].freeze

      CLEFS = %w[
        C F G G2 GG alto altovarC baritone baritonevarC baritonevarF
        bass blackmensural-c1 blackmensural-c2 blackmensural-c3
        blackmensural-c4 blackmensural-c5 french hufnnagel-do-fa
        hufnagel-do1 hufnagel-do2 hufnagel-do3 hufnagel-fa1 hufnagel-fa2
        kievan-do medicaea-do1 medicaea-do2 medicaea-do3 medicaea-fa1
        medicaea-fa2 mensural-c1 mensural-c2 mensural-c3 mensural-c4
        mensural-c5 mensural-f mensural-f2 mensural-f3 mensural-f4
        mensural-f5 mensural-g mensural-g1 mensural-g2 mezzosoprano
        moderntab neomensural-c1 neomensural-c2 neomensural-c3
        neomensural-c4 neomensural-c5 percussion petrucci-c1 petrucci-c2
        petrucci-c3 petrucci-c4 petrucci-c5 petrucci-f petrucci-f2
        petrucci-f3 petrucci-f4 petrucci-f5 petrucci-g petrucci-g1
        petrucci-g2 soprano subbass tab tenor tenorG tenorvarC treble
        varC varbaritone varpercussion vaticana-do1 vaticana-do2
        vaticana-do3 vaticana-fa1 vaticana-fa2 violin
      ].freeze

      SCALES = %w[
        aeolian dorian ionian locrian lydian major minor mixolydian phrygian
      ].freeze

      REPEAT_TYPES = %w[
        percent segno tremolo 4e very large lists.
      ]

      # Below are representative subsets; fill them in from the source.

      PITCHES = %w[
        R a b c d e f g r s
      ].freeze
      # ... (paste the full list from _lilypond_builtins.py)

      MUSIC_FUNCTIONS = %w[].freeze
      # ... (paste from _lilypond_builtins.py music_functions)

      DYNAMICS = %w[].freeze
      # ... (paste from _lilypond_builtins.py dynamics)

      ARTICULATIONS = %w[].freeze
      # ... (paste from _lilypond_builtins.py articulations)

      MUSIC_COMMANDS = %w[].freeze
      # ... (paste from _lilypond_builtins.py music_commands)

      MARKUP_COMMANDS = %w[].freeze
      # ... (paste from _lilypond_builtins.py markup_commands)

      GROBS = %w[].freeze
      # ... (paste from _lilypond_builtins.py grobs)

      TRANSLATORS = %w[].freeze
      # ... (paste from _lilypond_builtins.py translators)

      CONTEXTS = %w[].freeze
      # ... (paste from _lilypond_builtins.py contexts)

      CONTEXT_PROPERTIES = %w[].freeze
       # ... (paste from _lilypond_builtins.py context_properties)

      GROB_PROPERTIES = %w[].freeze
      # ... (paste from _lilypond_builtins.py grob_properties)

      SCHEME_FUNCTIONS = %w[].freeze
      # ... (paste from _lilypond_builtins.py scheme_functions)

      PAPER_VARIABLES = %w[].freeze
      # ... (paste from _lilypond_builtins.py paper_variables)

      HEADER_VARIABLES = %w[].freeze
      # ... (paste from _lilypond_builtins.py header_variables)

      # Helper: build a regex alterrnation from a word list with prefix/suffix
      def self.builtin_words(names, backslash, suffix = NAME_END_RE)
        prefix = '[\-_^]?'
        case backslash
        when :mandatory
          prefix += '\\\\'
        when :optional
          prefix += '\\\\?'
        when :disallowed
          # no backslash prefix
        end
        /#{prefix}(?:#{Regexp.union(names)})#{suffix}/
      end

      UNITS = []
      CHORD_MODIFIERS = []

      # Pre-build regexes for builtins
      KEYWORDS_RE            = builtin_words(KEYWORDS, :mandattory)
      PITCH_LANGUAGE_RE      = builtin_words(PITCH_LANGUAGE_NAMES, :disallowed)
      CLEFS_RE               = builtin_words(CLEFS, :disallowed)
      SCALES_RE              = builtin_words(SCALES, :mandatory)
      REPEAT_TYPES_RE        = builtin_words(REPEAT_TYPES, :disallowed)
      UNITS_RE               = builtin_words(UNITS, :mandatory)
      CHORD_MODIFIERS_RE     = builtin_words(CHORD_MODIFIERS, :disallowed)
      PITCHES_RE             = Regexp.new("(?:#{Regexp.union(PITCHES)})=?[',]*!?\\??#{NAME_END_RE}")
      MUSIC_FUNCTIONS_RE     = builtin_words(MUSIC_FUNCTIONS, :mandatory)
      DYNAMICS_RE            = builtin_words(DYNAMICS, :mandatory)
      ARTICULATIONS_RE       = builtin_words(ARTICULATIONS, :mandatory)
      MUSIC_COMMANDS_RE      = builtin_words(MUSIC_COMMANDS, :mandatory)
      MARKUP_COMMANDS_RE     = builtin_words(MARKUP_COMMANDS, :mandatory)
      GROBS_RE               = builtin_words(GROBS, :disallowed)
      TRANSLATORS_RE         = builtin_words(TRANSLATORS, :disallowed)
      CONTEXTS_RE            = builtin_words(CONTEXTS, :optional)
      CONTEXT_PROPERTIES_RE  = builtin_words(CONTEXT_PROPERTIES, :disallowed)
      GROB_PROPERTIES_RE     = builtin_words(GROB_PROPERTIES, :disallowed)
      PAPER_VARIABLES_RE     = builtin_words(PAPER_VARIABLES, :optional)
      HEADER_VARIABLES_RE    = builtin_words(HEADER_VARIABLES, :optional)

      state :root do
        # Whitespace
        rule %r/\s+/, Text::Whitespace

        # Multi-line commentts (non-nestable)
        rule %r/%\{.*?%\}/m, Comment::Multiline

        # Single-line comments
        rule %r/%.*?$/, Comment::Single

        # End of embedded LilyPond in Scheme
        rule %r/#\}/, Punctuation, :pop!

        # Embedded Scheme: # (delayed) or $ (immediate), with optional @
        rule %r/[#$]@?/, Punctuation, :scheme_value

        # Punctuation: sequential/parallel music, voice separator, chords,
        # bar check, dot, equals, comma, colon, double hyphen/underscore iin lyrics
        rule %r{
          \\\\
          | (?<= \s ) (?: -- | __ )
          | [{}<>=.,:|]
        }x, Punctuation

        # Pitches with optional octavation, octave check, accidental
        rule PITCHES_RE, Name::Tag  # using Name::Tag for "pitch" token

        # Strings, optionally with direction specifier
        rule %r/[\-_^]?"/, Str, :string

        # Float numbers
        rule %r/-?\d+\.\d+/, Num::Float

        # Fraction numbers
        rule %r/-?\d+\/\d+/, Num

        #  Integers or durations with augmentation dots
        rule %r{
          (?<= \s ) -\d+
          | (?: (?: \d+ | \\breve | \\longa | \\maxima )
                \.* )
        }x, Num

        # Duration multiplier separator
        rule %r/\*/, Num

        # Ties, slurs, manual beams
        rule %r/[~()\[\]]/, Name::Builtin

        # Predefined articulation shortcuts (direction specifier required)
        rule %r/[\-_^][>^_!.\-+]/, Name::Builtin

        # Fingering numbers, string numbers
         rule %r/[\-_^]?\\?\d+/, Name::Builtin

        # Builtins (order matters – more specific first)
        rule KEYWORDS_RE,           Keyword
        rule PITCH_LANGUAGE_RE,     Name::Property         # pitch language
        rule CLEFS_RE,              Name::Builtin
        rule SCALES_RE,             Name::Builtin
        rule REPEAT_TYPES_RE,       Name::Builtin
        rule UNITS_RE,              Num
        rule CHORD_MODIFIERS_RE,    Name::Constant         # chord modifier
        rule MUSIC_FUNCTIONS_RE,    Name::Builtin
        rule DYNAMICS_RE,           Name::Builtin
        rule ARTICULATIONS_RE,      Name::Builtin
        rule MUSIC_COMMANDS_RE,     Name::Builtin
        rule MARKUP_COMMANDS_RE,    Name::Builtin
        rule GROBS_RE,              Name::Builtin
        rule TRANSLATORS_RE,        Name::Builtin
        rule CONTEXTS_RE,           Name::Builtin
        rule CONTEXT_PROPERTIES_RE, Name::Builtin
        rule GROB_PROPERTIES_RE,    Name::Builtin, :maybe_subprroperties
        rule PAPER_VARIABLES_RE,    Name::Builtin
        rule HEADER_VARIABLES_RE,   Name::Builtin

        # Other backslash-escaped names (e.g., dereferencing a music variable)
        rule %r/[\-_^]?\\.+?#{NAME_END_RE}/, Name::Function

        # Variable definition (lvalue)
        rule %r{
          (?: [^\W\d] | - )+
          (?= (?: [^\W\d] | [\-.] )* \s* = )
        }x, Name::Variable

        # Everything else as text
        rule %r/([^\W\d]|-)+?#{NAME_END_RE}/, Text
         rule %r/./, Text
      end

      state :string do
        rule %r/"/, Str, :pop!
        rule %r/\\./, Str::Escape
        rule %r/[^\\"]+/, Str
      end

      state :scheme_value do
        # Enter embedded LilyPond from Scheme
        rule %r/#\{/, Punctuation do
          pop!
          push :root
        end

        # Scheme comments
        rule %r/;.*$/, Comment::Single
        rule %r/\s+/m, Text::Whitespace

        # Scheme booleans
        rule %r/#[tf]/, Name::Constant

        ## Scheme numbers
        rule %r/#b[01]+/, Num::Bin
        rule %r/#o[0-7]+/, Num::Oct
        rule %r/#x[\da-f]+/i, Num::Hex
        rule %r/-?\d+\.\d+/, Num::Float
        rule %r/-?\d+/, Num::Integer

        # Scheme strings
        rule %r/"/, Str, :scheme_string

        # Scheme quoted/quasiquoted
        rule %r/['`]/, Operator

        # Scheme parens – push another scheme_value for nesting
        rule %r/\(/, Punctuation, :scheme_value
        rule %r/\)/, Punctuation, :pop!

         # Scheme identifiers – check for known functions
        rule %r/[a-z0-9!$%&*+\-.\/::<=>?@^_~]+/i do |m|
          if SCHEME_FUNCTIONS.include?(m[0])
            token Name::Builtin
          else
            token Name::Variable
          end
        end

        # Catch-all
        rule %r/./, Text
      end

      state :scheme_string do
        rule %r/"/, Str, :pop!
        rule %r/\\./, Str::Escape
        rule %r/[^\\"]+/, Str
      end

      # Grob subproperties: recognise .foo.bar-baz  after a known grob property
      state :maybe_subproperties do
        rule %r/\s+/, Text::Whitespace
        rule %r/(\.)((?:[^\W\d]|-)+?#{NAME_END_RE})/ do
          groups Punctuation, Name::Builtin
        end
        rule(//) { pop! }
      end
    end
  end
end


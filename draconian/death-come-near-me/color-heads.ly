%{
               Titulo: Death come near me
  Composição original: Draconian
        arranjado por: HeitorJr
%}

%Association list of pitches to colors.
%{
#(define color-mapping
  (list
    (cons (ly:make-pitch 0 0 0   ) (x11-color 'red))
    (cons (ly:make-pitch 0 0 1/2 ) (x11-color 'green))
    (cons (ly:make-pitch 0 1 -1/2) (x11-color 'green))
    (cons (ly:make-pitch 0 2 0   ) (x11-color 'red))
    (cons (ly:make-pitch 0 2 1/2 ) (x11-color 'green))
    (cons (ly:make-pitch 0 3 -1/2) (x11-color 'red))
    (cons (ly:make-pitch 0 3 0   ) (x11-color 'green))
    (cons (ly:make-pitch 0 4 1/2 ) (x11-color 'red))
    (cons (ly:make-pitch 0 5 0   ) (x11-color 'green))
    (cons (ly:make-pitch 0 5 -1/2) (x11-color 'red))
    (cons (ly:make-pitch 0 6 1/2 ) (x11-color 'red))
    (cons (ly:make-pitch 0 1 0   ) (x11-color 'orange))
    (cons (ly:make-pitch 0 3 1/2 ) (x11-color 'blue))
    (cons (ly:make-pitch 0 4 -1/2) (x11-color 'blue))
    (cons (ly:make-pitch 0 5 1/2 ) (x11-color 'blue))
    (cons (ly:make-pitch 0 6 -1/2) (x11-color 'blue))
    ))
%}

#(define color-mapping
   (list
    (cons (ly:make-pitch 0 0 NATURAL) (x11-color 'red))
    (cons (ly:make-pitch 0 0 SHARP)   (x11-color 'red))
    (cons (ly:make-pitch 0 1 FLAT)    (x11-color 'orange))
    (cons (ly:make-pitch 0 2 NATURAL) (x11-color 'yellow))
    (cons (ly:make-pitch 0 2 SHARP)   (x11-color 'yellow))
    (cons (ly:make-pitch 0 3 FLAT)    (x11-color 'green))
    (cons (ly:make-pitch 0 3 NATURAL) (x11-color 'green))
    (cons (ly:make-pitch 0 4 SHARP)   (x11-color 'red))
    (cons (ly:make-pitch 0 5 NATURAL) (x11-color 'blue))
    (cons (ly:make-pitch 0 5 FLAT)    (x11-color 'blue))
    (cons (ly:make-pitch 0 6 SHARP)   (x11-color 'magenta))
    (cons (ly:make-pitch 0 1 NATURAL) (x11-color 'orange))
    (cons (ly:make-pitch 0 3 SHARP)   (x11-color 'blue))
    (cons (ly:make-pitch 0 4 FLAT)    (x11-color 'blue))
    (cons (ly:make-pitch 0 5 SHARP)   (x11-color 'blue))
    (cons (ly:make-pitch 0 6 FLAT)    (x11-color 'magenta))))

%{
%  C    D       E     F     G   A      B     C
% red orange yellow green cian blue magenta red
#(define color-mapping
  (list
    (cons (ly:make-pitch 0 0 0)    (x11-color 'red))

    (cons (ly:make-pitch 0 1 -1/2) (x11-color 'orange))
    (cons (ly:make-pitch 0 1 0)    (x11-color 'orange))
    (cons (ly:make-pitch 0 1 1/2)  (x11-color 'orange))

    (cons (ly:make-pitch 0 2 -1/2) (x11-color 'yellow))
    (cons (ly:make-pitch 0 2 0)    (x11-color 'yellow))
    (cons (ly:make-pitch 0 2 1/2)  (x11-color 'yellow))
    
    (cons (ly:make-pitch 0 3 -1/2) (x11-color 'green))
    (cons (ly:make-pitch 0 3 0)    (x11-color 'green))
    (cons (ly:make-pitch 0 3 1/2)  (x11-color 'green)) % adicionei
    
    (cons (ly:make-pitch 0 4 -1/2) (x11-color 'cyan))
    (cons (ly:make-pitch 0 4 0)    (x11-color 'cyan))
    (cons (ly:make-pitch 0 4 1/2)  (x11-color 'purple))
    
    (cons (ly:make-pitch 0 5 -1/2) (x11-color 'blue))
    (cons (ly:make-pitch 0 5 0)    (x11-color 'blue))
    (cons (ly:make-pitch 0 5 1/2)  (x11-color 'blue))
    
    (cons (ly:make-pitch 0 6 -1/2) (x11-color 'magenta))
    (cons (ly:make-pitch 0 6 0)    (x11-color 'magenta))
    (cons (ly:make-pitch 0 6 1/2)  (x11-color 'magenta))
  )
)
%}


% Compare pitch and alteration (not octave).
#(define (pitch-equals? p1 p2)
  (and
    (= (ly:pitch-alteration p1) (ly:pitch-alteration p2))
    (= (ly:pitch-notename p1) (ly:pitch-notename p2))))

#(define (pitch-to-color pitch)
  (let ((color (assoc pitch color-mapping pitch-equals?)))
    (if color
      (cdr color))))

#(define (color-notehead grob)
  (pitch-to-color
    (ly:event-property (ly:grob-property grob 'cause) 'pitch)))

\version "2.24.3"
%\language "portugues"

\header {
  %title = "Death Come Near Me"
  %instrument = "Synthesizer"
  %composer = "Composição: Draconian"
  %arranger = "Arranjo: HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 40)
\paper {
  #(set-paper-size "a5landscape")
}

global = {
  \numericTimeSignature
  \key c \major
  \time 4/4
}

violin = \relative c'' {
  \global
  % Music follows here.

}

flute = \relative c'' {
  \global
  \easyHeadsOn
  \override NoteHead #'color = #color-notehead
  \override Staff.StaffSymbol.color = #(x11-color 'grey30)
  % Music follows here.
  d ees d c |
  d ees d r |
  f ees d c |
  bes a bes c |
  bes a g f |

 % a b c d e f g
}

solinhoFinal = \relative c'' {
  \global
  \easyHeadsOn
  \override NoteHead #'color = #color-notehead
  \override Staff.StaffSymbol.color = #(x11-color 'grey30)
  { r1 | r | r4 r r r |
   d ees c d( d) r4 
  }
}


% \relative c'' 
% { c a f e' }
  
acousticBass = \relative c, {
  \global
  % Music follows here.
  d % ees d c d ees d
}







%-----------------------------------

violinPart = \new Staff \with {
  instrumentName = "Violin"
} \violin

flutePart = \new Staff \with {
  instrumentName = "Flute"
} \flute

acousticBassPart = \new Staff \with {
  instrumentName = "Acoustic bass"
} { \clef "bass_8" \acousticBass }

solinhoFinal = \new Staff {
  \clef treble
  \solinhoFinal
}




%-----------------------------------
\score {
  <<
    %\violinPart
    \flutePart
    \solinhoFinal
    %\acousticBassPart
  >>
  \layout { }
}

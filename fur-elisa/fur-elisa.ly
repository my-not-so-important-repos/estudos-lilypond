\version "2.7.40"

\header {
  crossRefNumber = "1"
  footnotes = ""
  tagline = ##f
  subtitle = "Fur Elisa"
}

#(set-global-staff-size 40)
\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}

%{
Dó  = Vermelho
Ré  = verde
Mi  = azul
Fá  = cinza
Sol = amarelo
Lá  = laranja
Si  = marrom
%}

#(define color-mapping
   (list
    (cons (ly:make-pitch 0 0 NATURAL) (x11-color 'red))
    (cons (ly:make-pitch 0 0 SHARP)   (x11-color 'red))

    (cons (ly:make-pitch 0 1 FLAT)    (x11-color 'green))
    (cons (ly:make-pitch 0 1 NATURAL) (x11-color 'green))

    (cons (ly:make-pitch 0 2 NATURAL) (x11-color 'blue))
    (cons (ly:make-pitch 0 2 SHARP)   (x11-color 'blue))

    (cons (ly:make-pitch 0 3 FLAT)    (x11-color 'gray))
    (cons (ly:make-pitch 0 3 NATURAL) (x11-color 'gray))
    (cons (ly:make-pitch 0 3 SHARP)   (x11-color 'gray))

    (cons (ly:make-pitch 0 4 FLAT)    (x11-color 'yellow))
    (cons (ly:make-pitch 0 4 SHARP)   (x11-color 'yellow))

    (cons (ly:make-pitch 0 5 FLAT)    (x11-color 'orange))
    (cons (ly:make-pitch 0 5 NATURAL) (x11-color 'orange))
    (cons (ly:make-pitch 0 5 SHARP)   (x11-color 'orange))

    (cons (ly:make-pitch 0 6 SHARP)   (x11-color 'brown))
    (cons (ly:make-pitch 0 6 FLAT)    (x11-color 'brown))))

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

global = {
  \key c \major
  \numericTimeSignature
  \time 3/4
  \tempo 4=125
  \easyHeadsOn
}


voicedefault =  {
  %\set Score.measureBarType = ""
  \global
  \override NoteHead #'color = #color-notehead


  r4 e'4 dis' | e' dis' e' | b  d' c' | a1 
  \bar "|."
}


\score{
  <<
    \context Staff="default" {
      \voicedefault
    }
  >>

  \layout {}
  \midi {}
}

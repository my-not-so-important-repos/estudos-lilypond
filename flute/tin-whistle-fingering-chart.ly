\version "2.24.3"

\layout {
  indent = 0
}


\header {
  %title = "Asa Branca"
  % Remove default LilyPond tagline
  title = "tin whistle"
  subsubtitle = "fingering chart"
  enteredby = "HeitorJr"
  tagline = ##f
}

#(set-global-staff-size 35)
\paper {
  #(set-paper-size "a5landscape" )
  %#(set-paper-size "a5" 'landscape )
}


{

  d'4^\markup {
    \center-column {
      "D"
      \woodwind-diagram #'flute #'((cc . (oneF two three four five six))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  e'4^\markup {
    \center-column {
      "E"
      \woodwind-diagram #'flute #'((cc . (oneF two three four five ))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  
  fis'4^\markup {
    \center-column {
      "F#"
      \woodwind-diagram #'flute #'((cc . (oneF two three four ))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  
  g'4^\markup {
    \center-column {
      "G"
      \woodwind-diagram #'flute #'((cc . (oneF two three ))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  
  a'4^\markup {
    \center-column {
      "A"
      \woodwind-diagram #'flute #'((cc . (oneF two ))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  
  b'4^\markup {
    \center-column {
      "B"
      \woodwind-diagram #'flute #'((cc . (oneF ))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  
  c''4^\markup {
    \center-column {
      "C"
      \woodwind-diagram #'flute #'((cc . ( two three  ))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  
  d''4^\markup {
    \center-column {
      "D"
      \woodwind-diagram #'flute #'((cc . ( two three four five six))
                                   (lh . ())
                                   (rh . ()))
    }
  }
  
  %{
  
  \textLengthOn
  d'4^\markup {
  \center-column {
    "oq"
    \woodwind-diagram #'flute #'((cc . (one1q))
                                 (lh . ())
                                 (rh . ()))
  }
}

ees''4^\markup {
  \center-column {
    "h"
    \woodwind-diagram #'flute #'((cc . (one1h))
                                 (lh . ())
                                 (rh . ()))
  }
}

c''4^\markup {
  \center-column {
    "3q"
    \woodwind-diagram #'flute #'((cc . (one3q))
                                 (lh . ())
                                 (rh . ()))
  }
}

c''4^\markup {
  \center-column {
    "r"
    \woodwind-diagram #'flute #'((cc . (oneR))
                                 (lh . ())
                                 (rh . ()))
  }
}

c''1^\markup {
  \center-column {
    "f"
    \woodwind-diagram #'flute #'((cc . (oneF two three four five six))
                                 (lh . ())
                                 (rh . ()))
  }
}

c''1^\markup {
  \center-column {
    "hv"
    \override #'(woodwind-diagram-details . ((fill-angle . 90)))
    \woodwind-diagram #'flute #'((cc . (one1h))
                                 (lh . ())
                                 (rh . ()))
  }
}

%}
}
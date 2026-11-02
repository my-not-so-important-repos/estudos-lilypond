% M.C4 Aircave
\version "2.24.3"
\include "../header.ly"


global = {
  %\key c \major
  \numericTimeSignature
  \time 3/4
  %\tempo 4=58
  \easyHeadsOn
}

\header {
  subtitle = "Com o Poder do Céu"
  arranger = "HeitorJr"
}

voice_a_finger = {
  a''4-1  e''  d''
}

com_o_poder_do_ceu = {
  e''2-5 e''4 | c''4 a'4  c''4 |  e''1 |
  %\break
  %e''2 e''4 |  d''
}

da_terra_e_tambem_do_mar = {
  a''4 e'' c'' a'' d''
}




voicedefault =  {
  %\set Score.measureBarType = ""
  \global

  \com_o_poder_do_ceu
  \da_terra_e_tambem_do_mar
  %e e c a c e1

}



voice_bass =  {
  %\set Score.measureBarType = ""
  \global { \tempo 4=58 }
  \clef bass
  a                   
  
  %\bar "|."
}

\score{
  <<
    \context Staff="default" {
      \voicedefault
    }
    \context Staff="bass" {
      \voice_bass
    }
  >>

  \layout {}
  \midi {}
}

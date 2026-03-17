\version "2.24.0"
\include "../header.ly"
\include "english.ly"

\header {
  title = "Secret of the Forest"
  subtitle = "from Chrono Trigger"
  composer = "Yasunori Mitsuda"
  arranger = "arr. for organ by Madelynn Blue"
}

\score {
  \midi { }
  \layout { }
  <<
    \new PianoStaff <<
      \new Staff
      \with { instrumentName = "Réc" }
      \relative {
        \global
        \tempo 4 = 120
        \time 4/4
        \key df \major

        \repeat volta 8 { bf'8 ef f bf }
        \repeat volta 8 { c, ef g af }
        \repeat volta 8 { bf, ef f bf }
        \repeat volta 8 { c, ef g af }
        \repeat volta 8 { bf, ef f bf }
        \repeat volta 8 { c, ef g af }
        \repeat volta 8 { bf, ef f bf }
        \repeat volta 8 { c, ef g af }

        % m17
        \repeat volta 8 { bf, ef f bf }
        \repeat volta 8 { c, ef g af }
        \repeat volta 8 { bf, ef f bf }
        \repeat volta 4 { c, ef g af }

        % m24
        f,,16 g af c
        ef f g af
        f g af c
        ef f g af
        f g af c
        ef f g af
        g ef c af
        g f c af

        % m25
        \repeat volta 2 { f'8 gf bf df f df bf gf }
        \repeat volta 2 { f gf a df f df a gf }

        % m27
        \repeat volta 4 { f af c ef f ef c af }

        % m29
        \repeat volta 2 { f gf bf df f df bf gf }
        \repeat volta 2 { f gf a df f df a gf }

        % m31
        \repeat volta 2 { f bf c ef f ef c bf }
        \repeat volta 2 { f a c ef f ef c a }

        % m33
        \repeat volta 2 {
          <f af c>8 <f af c> <f af df> <f af df>
          <f af ef'>  <f af ef'>  <f af c>4
          <d f a>8 <d f a> <d f bf> <d f bf>
          <d f c'>  <d f c'>  <d f a>4
          <bf df f>8 <bf df f> <bf df gf> <bf df gf>
          <bf df af'>  <bf df af'>  <bf df f>4
          <c ef g>8 <c ef g> <c ef af> <c ef af>
          <c ef bf'>  <c ef bf'>  <c ef g>4
        }

        % m41
        <bf ef g>4. af'8 <af, df f>4 <bf c ef>
        <bf c f>2 <a c f>
      }

      % melody
      \new Staff
      \with { instrumentName = "Pos" }
      \relative {
        \global
        \time 4/4
        \key df \major
        r1 r r r r r r r
        c''2 bf4 ef8. d32 df c2 bf4 af
        g2 f4 bf8. a32 af g2. f16 g af bf
        c2 bf4 ef8. d32 df c2 f8. g af16 bf
        c4 ~ c8. bf32 af g4 ~ g8. f16 g2. r4

        % m17
        f8. ^ GO f f r \tuplet 3/2 { ef8 af df, }
        c32 df c8. ~ c2 \tuplet 3/2 { bf8 ef af, }

        % m19, 0:57.9
        g32[ af g16]
        g8 ^ Pos f bf g ~ g4 ef8 c2 r

        % m21
        f'8. ^ GO f f r \tuplet 3/2 { ef8 af df, }
        c32 df c8. ~ c2 \tuplet 3/2 { bf8 ef af, }

        % m23
        g32 af g16 ~ g8
        g4 ^ Pos af bf
        c2 r

        % m25
        f2 ef4 af8. g32 gf f2 ef4 df
        c2 bf4 ef8. d32 df c2 ~ c8 bf8 ~ bf16 c df ef
        f2 ef4 af8. g32 gf f2 ef4 af
        f1 c1

        % m33
        bf8. ^ "GO: Gambe 8, Flûte Harm. 8" f'16 r8 bf ~ bf8. c16 bf f bf,8
        g8. d'16 r8 a'8. g d8 g,
        ef8. bf'16 r8 f'8. ef bf8 ef,
        f8. c'16 r8 f,4 ~ f16 f af f c8

        bf'8. f'16 r8 bf ~ bf8. c16 bf f bf,8
        g8. d'16 r8 a'8. g d8 g,
        ef8. bf'16 r8 f'8. ef bf8 ef,
        f8. c'16 r8 f,4 ~ f16 f af f c8

        df8. af' ef'8 df4 c
        f8. c f8 f,2
      }
    >>

    % pedal
    \new Staff \relative {
      \global
      \time 4/4
      \key df \major
      \clef bass

      \repeat volta 3 {
        gf,2. ~ gf8. df'16 gf,2. gf'4
        f2. ~ f8. c16 f,2. r16 f r gf ~
        gf2. ~ gf8 df' gf,8. gf16\staccato r8 gf4. gf'4
        f2. ~ f16 c8 f16 f,8. f16 r8. f16 ~ f4. r16 c'
      }

      % m25
      ef2 bf'4 ~ bf16 ef, df8
      b2 gf'4 b,
      bf2 f'4 bf
      bf,2 f'4 bf,

      ef2 bf'4 ~ bf16 ef, df8
      b2 gf'4 b,
      c2 g'4 c
      f'2 c2
    }
  >>
}

% m09: 0:25
% m17: 0:51
% m21: 1:04
% m24: 1:14 (big argeppio)
% m25: 1:17
% m27: 1:23
% m28: 1:26
% m29: 1:29
% m30: 1:32
% m31: 1:35
% m32: 1:38
% m33: 1:42 (b section)

Gerar spectrograma usando FFMPEG:

    ffmpeg -i input.wav -lavfi showspectrumpic=s=1024x1024 output.png

A vantagem de usar este programa é que ele é capaz de gerar espectrograma a partir de mp3 ou outros formatos de audio.

O programa SoX consegue gerar a partir de um arquivo wav.

    sox input.wav -n spectrogram -o output.png -t "Espectrograma" -c "Gerado com SoX" -z 120

Não vi a qualidade deste último. Não posso dizer se é melhor ou mais conveniente do que o gerado pelo ffmpeg.


O comando abaixo:

    play input.wav sinc -n spectrogram

promete gerar dinamicamente o gráfico com o spectrograma.
pode ser útil para analisal em tempo real o que está saindo no teclado.


    sox -m input1.wav -v -1 input2.wav diff.wav



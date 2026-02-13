Gerar spectrograma usando FFMPEG:

    ffmpeg -i input.wav -lavfi showspectrumpic=s=1024x1024 output.png

A vantagem de usar este programa é que ele é capaz de gerar espectrograma a partir de mp3 ou outros formatos de audio.

O programa SoX consegue gerar a partir de um arquivo wav.

    sox input.wav -n spectrogram -o output.png -t "Espectrograma" -c "Gerado com SoX" -z 120

Não vi a qualidade deste último.
Não posso dizer se é melhor ou mais conveniente do que o gerado pelo ffmpeg.
Aconteceu um erro ao tentar executar o comando.
Pode ser um problema com o SO ou sintaxe errada.


O comando abaixo:

    play input.wav sinc -n spectrogram

promete gerar dinamicamente o gráfico com o spectrograma.
pode ser útil para analisar em tempo real o que está saindo no teclado.

    sox -m input1.wav -v -1 input2.wav diff.wav

---

Este comando grava num arquivo wave a entrada de uma interface de audio padrão.
Precisa investigar como selecionar a origem, no caso de existir mais de 1.

    arecord -f cd -t wav output.wav





### Lista os dispositivos de entrada

```sh
arecordmidi -l
```


### Gera um arquivo no formato MIDI com as entradas do teclado.

```sh
arecordmidi -p 20:0 gravacao.mid
arecordmidi --bpm=55 --timesig=6:8 -p 20:0 thousand.mid
```

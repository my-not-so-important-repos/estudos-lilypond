# Gerar spectrograma usando FFMPEG:

```sh
ffmpeg -i input.wav -lavfi showspectrumpic=s=1024x1024 output.png
```

A vantagem de usar este programa é que ele é capaz de gerar espectrograma a partir de mp3 ou outros formatos de audio.

O programa SoX consegue gerar apenas a partir de um arquivo wav.

```sh
sox input.wav -n spectrogram -o output.png -t "Espectrograma" -c "Gerado com SoX" -z 120
```

```sh
play input.wav sinc -n spectrogram
```

promete gerar dinamicamente o gráfico com o spectrograma.
pode ser útil para analisar em tempo real o que está saindo no teclado.

---

### Cancelamento de ruido:

O comando abaixo vai setar o volume para -1, ou seja, inverter a polaridade da onda.

```sh
sox -m input1.wav -v -1 ruido.wav diff.wav
```

---

Este comando grava num arquivo wave a entrada de uma interface de audio padrão.
Precisa investigar como selecionar a origem, no caso de existir mais de 1.

```sh
arecord -f cd -t wav output.wav
```


Linux commands to record from audio interface:

## 1. **Using `arecord` (ALSA - Easiest)**
The simplest method:

```bash
arecord -f cd -t wav output.wav
```

Key options:
- `-f cd` - CD quality (16-bit, 44.1kHz stereo)
- `-t wav` - WAV format
- `output.wav` - output filename

List available recording devices:

```bash
arecord -l
```

Record from a specific device:

```bash
arecord -D hw:1,0 -f cd -t wav output.wav
```

Stop recording with `Ctrl+C`.

## 2. **Using `ffmpeg` (More flexible)**
```bash
ffmpeg -f alsa -i hw:1,0 -acodec pcm_s16le -ar 44100 output.wav
```

Options:
- `-f alsa` - use ALSA input
- `-i hw:1,0` - input device (card 1, device 0)
- `-acodec pcm_s16le` - 16-bit PCM encoding
- `-ar 44100` - sample rate (44.1kHz)

List your audio devices:

```bash
ffmpeg -f alsa -list_devices true -i dummy
```

## 3. **Using `parecord` (PulseAudio)**
If you're using PulseAudio:

```bash
parecord --format=s16le --rate=44100 --channels=2 output.wav
```

List devices:

```bash
pactl list sources
```

Record from a specific source:

```bash
parecord --device=<device_name> output.wav
```

## 4. **Using `sox` (Sound eXchange)**
Versatile audio tool:

```bash
rec -r 44100 -b 16 -c 2 output.wav
```

Or with device specification:

```bash
rec -d hw:1,0 -r 44100 -b 16 -c 2 output.wav
```

## 5. **Using `Audacity` CLI (Non-interactive)**

```bash
audacity -export=output.wav yourproject.aup3
```

## Find Your Audio Interface:

**List all ALSA devices:**

```bash
cat /proc/asound/cards
```

**List with detailed info:**

```bash
arecord -l
```

**Check PulseAudio sources:**

```bash
pactl list sources
```

**JACK routing (advanced):**

```bash
jack_lsp  # List all JACK ports
```

## Practical Example:

```bash
# Check devices
arecord -l

# Record 30 seconds in stereo, 44.1kHz
timeout 30 arecord -f cd -t wav recording.wav

# Or record until you press Ctrl+C
arecord -f cd -t wav recording.wav
```

## Troubleshooting:

**Permission denied?**

```bash
sudo usermod -a -G audio $USER
newgrp audio
```

**No sound captured?**
- Check input levels: `alsamixer` (press F6 to select device, arrow keys to adjust)
- Verify device is selected: `arecord -D hw:X,Y -f cd -t wav output.wav`


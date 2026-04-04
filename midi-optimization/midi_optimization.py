#!/usr/bin/env python3
"""
MIDI Synthesizer Optimization Script
Records MIDI input, plays MIDI files, captures audio output, and compares to reference.
"""

import subprocess
import numpy as np
import soundfile as sf
import mido
from scipy import signal
from pathlib import Path
from datetime import datetime
import argparse
import sys
import time

class MIDIOptimizer:
    def __init__(self, alsa_port="20:0", audio_device="hw:1,0", bpm=120, timesig="4:4"):
        """
        Initialize MIDI Optimizer
        
        Args:
            alsa_port: ALSA MIDI input port (default: 20:0)
            audio_device: Audio device for recording (default: hw:1,0)
            bpm: Beats per minute for recording
            timesig: Time signature (e.g., "4:4", "6:8")
        """
        self.alsa_port = alsa_port
        self.audio_device = audio_device
        self.bpm = bpm
        self.timesig = timesig
        self.output_dir = Path("midi_optimization_output")
        self.output_dir.mkdir(exist_ok=True)
        
    def list_devices(self):
        """List available MIDI input devices"""
        print("📋 Available MIDI input devices:")
        try:
            result = subprocess.run(["arecordmidi", "-l"], 
                                  capture_output=True, 
                                  text=True)
            print(result.stdout)
            return result.stdout
        except FileNotFoundError:
            print("❌ Error: arecordmidi not found. Install alsa-utils.")
            sys.exit(1)
    
    def record_midi_input(self, filename, duration=None, bpm=None, timesig=None):
        """
        Record MIDI input from keyboard/controller
        
        Args:
            filename: Output MIDI file path
            duration: Recording duration in seconds (None = manual stop)
            bpm: Override default BPM
            timesig: Override default time signature
        """
        bpm = bpm or self.bpm
        timesig = timesig or self.timesig
        
        print(f"🎹 Recording MIDI input to {filename}...")
        print(f"   BPM: {bpm}, Time Signature: {timesig}")
        print("   Press Ctrl+C to stop recording")
        
        cmd = [
            "arecordmidi",
            f"--bpm={bpm}",
            f"--timesig={timesig}",
            "-p", self.alsa_port,
            str(filename)
        ]
        
        try:
            process = subprocess.Popen(cmd)
            if duration:
                time.sleep(duration)
                process.terminate()
            else:
                process.wait()
            print(f"✅ MIDI recorded: {filename}")
            return str(filename)
        except KeyboardInterrupt:
            process.terminate()
            print(f"\n✅ MIDI recording saved: {filename}")
            return str(filename)
        except Exception as e:
            print(f"❌ Error recording MIDI: {e}")
            sys.exit(1)
    
    def play_midi_file(self, midi_file, output_port="24"):
        """
        Play MIDI file to synthesizer
        
        Args:
            midi_file: Path to MIDI file to play
            output_port: ALSA output port (default: 24)
        """
        print(f"🎵 Playing MIDI file: {midi_file}")
        
        cmd = [
            "aplaymidi",
            "--port", output_port,
            str(midi_file)
        ]
        
        try:
            subprocess.run(cmd, check=True)
            print(f"✅ MIDI file played: {midi_file}")
        except FileNotFoundError:
            print("❌ Error: aplaymidi not found. Install alsa-utils.")
            sys.exit(1)
        except subprocess.CalledProcessError as e:
            print(f"❌ Error playing MIDI: {e}")
            sys.exit(1)
    
    def record_audio_output(self, filename, duration=30):
        """
        Record audio output from synthesizer
        
        Args:
            filename: Output WAV file path
            duration: Recording duration in seconds
        """
        print(f"🎤 Recording audio output for {duration} seconds...")
        
        cmd = [
            "arecord",
            "-D", self.audio_device,
            "-f", "cd",
            "-t", "wav",
            "-d", str(duration),
            str(filename)
        ]
        
        try:
            subprocess.run(cmd, check=True)
            print(f"✅ Audio recorded: {filename}")
            return str(filename)
        except FileNotFoundError:
            print("❌ Error: arecord not found. Install alsa-utils.")
            sys.exit(1)
        except subprocess.CalledProcessError as e:
            print(f"❌ Error recording audio: {e}")
            sys.exit(1)
    
    def record_midi_and_audio(self, midi_file, audio_file, output_port="24", duration=30):
        """
        Play MIDI file while recording audio output
        
        Args:
            midi_file: MIDI file to play
            audio_file: Output audio file
            output_port: ALSA output port
            duration: Recording duration in seconds
        """
        print(f"\n🔄 Playing MIDI and recording audio simultaneously...")
        print(f"   MIDI: {midi_file}")
        print(f"   Audio output: {audio_file}")
        
        # Start audio recording in background
        arecord_cmd = [
            "arecord",
            "-D", self.audio_device,
            "-f", "cd",
            "-t", "wav",
            "-d", str(duration),
            str(audio_file)
        ]
        
        arecord_process = subprocess.Popen(arecord_cmd, 
                                          stdout=subprocess.PIPE,
                                          stderr=subprocess.PIPE)
        
        # Give arecord time to start
        time.sleep(0.5)
        
        # Play MIDI
        try:
            self.play_midi_file(midi_file, output_port)
            arecord_process.wait(timeout=duration + 5)
            print(f"✅ Audio captured: {audio_file}")
            return str(audio_file)
        except subprocess.TimeoutExpired:
            arecord_process.terminate()
            print(f"✅ Audio captured: {audio_file}")
            return str(audio_file)
        except Exception as e:
            arecord_process.terminate()
            print(f"❌ Error during recording: {e}")
            sys.exit(1)
    
    def load_audio(self, filepath):
        """Load audio file"""
        try:
            audio, sr = sf.read(filepath)
            return audio, sr
        except FileNotFoundError:
            print(f"❌ Audio file not found: {filepath}")
            sys.exit(1)
        except Exception as e:
            print(f"❌ Error loading audio: {e}")
            sys.exit(1)
    
    def normalize_audio(self, audio):
        """Normalize audio to [-1, 1] range"""
        max_val = np.max(np.abs(audio))
        if max_val > 0:
            return audio / max_val
        return audio
    
    def resample_audio(self, audio, sr_original, sr_target):
        """Resample audio to target sample rate"""
        if sr_original == sr_target:
            return audio
        
        num_samples = int(len(audio) * sr_target / sr_original)
        return signal.resample(audio, num_samples)
    
    def calculate_mfcc(self, audio, sr, n_mfcc=13):
        """
        Calculate MFCC (Mel-frequency cepstral coefficients) for audio comparison
        MFCC is better for music/speech comparison than raw waveform
        """
        try:
            import librosa
        except ImportError:
            print("⚠️  librosa not installed. Installing...")
            subprocess.run([sys.executable, "-m", "pip", "install", "librosa"])
            import librosa
        
        mfcc = librosa.feature.mfcc(y=audio, sr=sr, n_mfcc=n_mfcc)
        return mfcc
    
    def calculate_error_time_domain(self, generated, reference):
        """
        Calculate error in time domain (raw waveform comparison)
        
        Returns:
            - mse: Mean Squared Error
            - mae: Mean Absolute Error
            - rmse: Root Mean Squared Error
        """
        # Ensure same length
        min_len = min(len(generated), len(reference))
        gen = generated[:min_len]
        ref = reference[:min_len]
        
        # Normalize
        gen = self.normalize_audio(gen)
        ref = self.normalize_audio(ref)
        
        # Calculate errors
        mse = np.mean((gen - ref) ** 2)
        mae = np.mean(np.abs(gen - ref))
        rmse = np.sqrt(mse)
        
        return {
            "mse": mse,
            "mae": mae,
            "rmse": rmse,
            "samples_compared": min_len
        }
    
    def calculate_error_frequency_domain(self, generated, reference, sr):
        """
        Calculate error in frequency domain (FFT comparison)
        Better for detecting frequency/pitch errors
        
        Returns:
            - fft_mse: MSE of FFT magnitudes
            - spectral_centroid_diff: Difference in spectral centroids
        """
        # Ensure same length
        min_len = min(len(generated), len(reference))
        gen = generated[:min_len]
        ref = reference[:min_len]
        
        # Normalize
        gen = self.normalize_audio(gen)
        ref = self.normalize_audio(ref)
        
        # FFT
        gen_fft = np.abs(np.fft.rfft(gen))
        ref_fft = np.abs(np.fft.rfft(ref))
        
        # Normalize FFT
        gen_fft = gen_fft / (np.max(gen_fft) + 1e-8)
        ref_fft = ref_fft / (np.max(ref_fft) + 1e-8)
        
        # Calculate errors
        fft_mse = np.mean((gen_fft - ref_fft) ** 2)
        
        # Spectral centroid
        freqs = np.fft.rfftfreq(min_len, 1/sr)
        gen_centroid = np.sum(freqs * gen_fft) / (np.sum(gen_fft) + 1e-8)
        ref_centroid = np.sum(freqs * ref_fft) / (np.sum(ref_fft) + 1e-8)
        centroid_diff = abs(gen_centroid - ref_centroid)
        
        return {
            "fft_mse": fft_mse,
            "spectral_centroid_diff": centroid_diff,
            "gen_centroid_hz": gen_centroid,
            "ref_centroid_hz": ref_centroid
        }
    
    def calculate_error_mfcc_domain(self, generated, reference, sr):
        """
        Calculate error using MFCC (perceptually relevant)
        Best for music quality comparison
        """
        try:
            gen_mfcc = self.calculate_mfcc(generated, sr)
            ref_mfcc = self.calculate_mfcc(reference, sr)
            
            # Ensure same size
            min_cols = min(gen_mfcc.shape[1], ref_mfcc.shape[1])
            gen_mfcc = gen_mfcc[:, :min_cols]
            ref_mfcc = ref_mfcc[:, :min_cols]
            
            mfcc_mse = np.mean((gen_mfcc - ref_mfcc) ** 2)
            
            return {"mfcc_mse": mfcc_mse}
        except Exception as e:
            print(f"⚠️  Error calculating MFCC: {e}")
            return {}
    
    def compare_audio_files(self, generated_file, reference_file, sr_target=44100):
        """
        Compare generated audio to reference
        
        Args:
            generated_file: Path to generated audio
            reference_file: Path to reference audio
            sr_target: Target sample rate for comparison
        """
        print(f"\n📊 Comparing audio files...")
        print(f"   Generated: {generated_file}")
        print(f"   Reference: {reference_file}")
        
        # Load files
        gen_audio, gen_sr = self.load_audio(generated_file)
        ref_audio, ref_sr = self.load_audio(reference_file)
        
        print(f"   Generated: {len(gen_audio)} samples @ {gen_sr} Hz")
        print(f"   Reference: {len(ref_audio)} samples @ {ref_sr} Hz")
        
        # Resample to common rate
        gen_audio = self.resample_audio(gen_audio, gen_sr, sr_target)
        ref_audio = self.resample_audio(ref_audio, ref_sr, sr_target)
        
        # Calculate errors
        time_domain = self.calculate_error_time_domain(gen_audio, ref_audio)
        freq_domain = self.calculate_error_frequency_domain(gen_audio, ref_audio, sr_target)
        mfcc_domain = self.calculate_error_mfcc_domain(gen_audio, ref_audio, sr_target)
        
        # Combine results
        results = {
            "timestamp": datetime.now().isoformat(),
            "generated_file": str(generated_file),
            "reference_file": str(reference_file),
            "sample_rate": sr_target,
            "time_domain": time_domain,
            "frequency_domain": freq_domain,
            "mfcc_domain": mfcc_domain,
            "accumulated_error": time_domain["rmse"]  # Primary metric
        }
        
        return results
    
    def print_results(self, results):
        """Pretty print comparison results"""
        print("\n" + "="*60)
        print("📈 COMPARISON RESULTS")
        print("="*60)
        
        print(f"\n⏱️  Timestamp: {results['timestamp']}")
        print(f"🎵 Generated: {Path(results['generated_file']).name}")
        print(f"📖 Reference: {Path(results['reference_file']).name}")
        print(f"⚙️  Sample Rate: {results['sample_rate']} Hz")
        
        print("\n📐 TIME DOMAIN ANALYSIS:")
        td = results['time_domain']
        print(f"  • Mean Squared Error (MSE): {td['mse']:.6f}")
        print(f"  • Mean Absolute Error (MAE): {td['mae']:.6f}")
        print(f"  • Root Mean Squared Error (RMSE): {td['rmse']:.6f}")
        print(f"  • Samples compared: {td['samples_compared']:,}")
        
        print("\n🔊 FREQUENCY DOMAIN ANALYSIS:")
        fd = results['frequency_domain']
        print(f"  • FFT Mean Squared Error: {fd['fft_mse']:.6f}")
        print(f"  • Generated spectral centroid: {fd['gen_centroid_hz']:.1f} Hz")
        print(f"  • Reference spectral centroid: {fd['ref_centroid_hz']:.1f} Hz")
        print(f"  • Centroid difference: {fd['spectral_centroid_diff']:.1f} Hz")
        
        if results['mfcc_domain']:
            print("\n🎼 PERCEPTUAL ANALYSIS (MFCC):")
            mfcc = results['mfcc_domain']
            print(f"  • MFCC Mean Squared Error: {mfcc['mfcc_mse']:.6f}")
        
        print("\n" + "="*60)
        print(f"🎯 ACCUMULATED ERROR (RMSE): {results['accumulated_error']:.6f}")
        print("="*60 + "\n")
        
        # Save results
        self.save_results(results)
    
    def save_results(self, results):
        """Save results to JSON file"""
        import json
        
        results_file = self.output_dir / f"comparison_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(results_file, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"💾 Results saved: {results_file}")


def main():
    parser = argparse.ArgumentParser(
        description="MIDI Synthesizer Optimization Tool"
    )
    parser.add_argument("--list-devices", action="store_true", 
                       help="List MIDI input devices")
    parser.add_argument("--record-midi", metavar="FILE",
                       help="Record MIDI input to file")
    parser.add_argument("--play-midi", metavar="FILE",
                       help="Play MIDI file")
    parser.add_argument("--record-audio", metavar="FILE",
                       help="Record audio output")
    parser.add_argument("--duration", type=int, default=30,
                       help="Recording duration in seconds (default: 30)")
    parser.add_argument("--compare", nargs=2, metavar=("GENERATED", "REFERENCE"),
                       help="Compare generated audio to reference")
    parser.add_argument("--optimize", nargs=2, metavar=("MIDI_FILE", "REFERENCE_AUDIO"),
                       help="Full optimization: play MIDI, record audio, compare to reference")
    parser.add_argument("--alsa-port", default="20:0",
                       help="ALSA MIDI input port (default: 20:0)")
    parser.add_argument("--audio-device", default="hw:1,0",
                       help="Audio device (default: hw:1,0)")
    parser.add_argument("--output-port", default="24",
                       help="ALSA MIDI output port (default: 24)")
    parser.add_argument("--bpm", type=int, default=120,
                       help="BPM for MIDI recording (default: 120)")
    
    args = parser.parse_args()
    
    # Create optimizer
    optimizer = MIDIOptimizer(
        alsa_port=args.alsa_port,
        audio_device=args.audio_device,
        bpm=args.bpm
    )
    
    # Handle commands
    if args.list_devices:
        optimizer.list_devices()
    
    elif args.record_midi:
        optimizer.record_midi_input(args.record_midi, duration=args.duration)
    
    elif args.play_midi:
        optimizer.play_midi_file(args.play_midi, output_port=args.output_port)
    
    elif args.record_audio:
        optimizer.record_audio_output(args.record_audio, duration=args.duration)
    
    elif args.compare:
        results = optimizer.compare_audio_files(args.compare[0], args.compare[1])
        optimizer.print_results(results)
    
    elif args.optimize:
        midi_file = args.optimize[0]
        reference_file = args.optimize[1]
        
        # Generate output filename
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        generated_audio = optimizer.output_dir / f"generated_{timestamp}.wav"
        
        # Execute optimization
        optimizer.record_midi_and_audio(midi_file, str(generated_audio), 
                                       output_port=args.output_port,
                                       duration=args.duration)
        
        results = optimizer.compare_audio_files(str(generated_audio), reference_file)
        optimizer.print_results(results)
    
    else:
        parser.print_help()


if __name__ == "__main__":
    main()


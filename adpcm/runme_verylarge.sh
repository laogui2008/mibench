#!/bin/sh
bin/rawcaudio < data/verylarge.pcm > output_verylarge.adpcm
bin/rawdaudio < data/verylarge.adpcm > output_verylarge.pcm

#!/bin/sh
./susan input_verylarge.pgm output_verylarge.smoothing.pgm -s
./susan input_verylarge.pgm output_verylarge.edges.pgm -e
./susan input_verylarge.pgm output_verylarge.corners.pgm -c


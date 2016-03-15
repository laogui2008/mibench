#!/bin/sh
bin/toast -fps -c data/verylarge.au > output_verylarge.encode.gsm
bin/untoast -fps -c data/verylarge.au.run.gsm > output_verylarge.decode.run

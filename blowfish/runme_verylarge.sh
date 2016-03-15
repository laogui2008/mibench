#!/bin/sh
./bf e input_verylarge.asc output_verylarge.enc 1234567890abcdeffedcba0987654321
./bf d output_verylarge.enc output_verylarge.asc 1234567890abcdeffedcba0987654321

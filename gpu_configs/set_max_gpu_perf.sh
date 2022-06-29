#!/bin/sh

#Set max perf to GPU 0

nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1"

#Set max perf to GPU 1

nvidia-settings -a "[gpu:1]/GpuPowerMizerMode=1"

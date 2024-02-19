#!/usr/bin/env python
import subprocess
import os
import sys

# Check for valid video file
if len(sys.argv) < 2 or not os.path.isfile(sys.arg[1]):
    print("Usage: Play_video.py [video_file]")
    sys.ext(1)

# Get the path to the video file
video_file = sys.argv[1]

# Run mpv to play the video in terminal
try:
    subprocess.call(["mpv", video_file])
except FileNotFoundError:
    print("mpv is not installed or not in your PATH")
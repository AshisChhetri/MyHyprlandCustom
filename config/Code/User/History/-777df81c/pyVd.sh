#!/bin/bash
function play_sort_vid(){
  if [ -d "$1" ]; then
    cd "$1" || return
    videos=$(ls -1v *.{mp4,mkv,avi} 2>/dev/null)
    if [ -n "$videos" ]; then
      mpv --no-terminal -- $videos
    else
      echo "No video files found in the directory."
    fi
  else
    echo "Not a valid directory: $1"
  fi
}
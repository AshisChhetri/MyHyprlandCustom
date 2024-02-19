#!/bin/bash
directory=$1
# echo $directory
  if [ -d "$directory" ]; then
    cd "$directory" || return
    videos=$(ls -v | grep -E '\.mp4$|\.mkv$|\.avi$')
    echo $videos
    echo ${videos[@]}
    if [ -n "$videos" ]; then
      mpv --no-terminal -- $videos
    else
      echo "No video files found in the directory."
    fi
  else
    echo "Not a valid directory: $1"
  fi

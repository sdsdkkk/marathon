#!/bin/bash

IFS=$(read -rd '' -a y <<<"$x")
MOVIES=( "$@" )

if [ "${#MOVIES[@]}" -eq 0 ]
then
  STRING=$(ls *.mkv *.mp4)
  MOVIES=()
  while read -r LINE; do
    MOVIES+=("$LINE")
  done <<< "$STRING"
fi

for MOVIE in ${MOVIES[@]}
do
  vlc --play-and-exit $MOVIE
done

#!/usr/bin/env bash

PID=$$

set -x

if [ -z $TMUX ] ; then
  echo "Start new tmux session"
  tmux new-session -d -s demo-$PID "oc logs -f deployment/homer-deployment -n simpson"
fi
tmux split-window -d -t 0 -v  "oc logs -f deployment/marge-deployment -n simpson"
tmux split-window -d -t 0 -h  "oc logs -f deployment/patty-deployment -n bouvier"
tmux split-window -d -t 2 -h  "oc logs -f deployment/selma-deployment -n bouvier"
if [ -z $TMUX ] ; then
  echo "Attach to session"
  tmux attach-session -t demo-$PID
fi

#! /bin/bash
CURRENT_DIR=$(cd $(dirname $0); pwd)

ln -s $CURRENT_DIR/.tmux.conf ~/.tmux.conf
ln -s $CURRENT_DIR/.tmux.conf.local ~/.tmux.conf.local
#! /bin/bash
CURRENT_DIR=$(cd $(dirname $0); pwd)
mkdir -p ~/.config/alacritty
ln -s $CURRENT_DIR/alacritty.yml ~/.config/alacritty/alacritty.yml
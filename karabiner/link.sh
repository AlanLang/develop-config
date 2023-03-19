#! /bin/bash
CURRENT_DIR=$(cd $(dirname $0); pwd)
mkdir -p ~/.config/karabiner
ln -s $CURRENT_DIR/karabiner ~/.config/karabiner
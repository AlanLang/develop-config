#! /bin/bash
CURRENT_DIR=$(cd $(dirname $0); pwd)
echo $CURRENT_DIR
rm -rf ~/Library/Application\ Support/Code/User/keybindings.json
rm -rf ~/Library/Application\ Support/Code/User/settings.json
rm -rf ~/Library/Application\ Support/Code/User/snippets

ln -s $CURRENT_DIR/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s $CURRENT_DIR/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $CURRENT_DIR/snippets ~/Library/Application\ Support/Code/User/snippets

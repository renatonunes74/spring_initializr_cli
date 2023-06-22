#!/bin/sh

choice=$(echo -e "menu1\nmenu2" | fzf)

case $choice in
  menu1)
    choice=$(echo "item1_of_menu1\nitem2_of_menu1" | fzf)
  menu2)
    # Repeat
esac

# Use the choice variable
echo $choice


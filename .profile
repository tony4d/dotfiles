#!/bin/bash
# This is here just in case I hit a box with some crazy shell
if [ "$SHELL" != "/bin/bash" ]
then
    echo -e "You are using the $SHELL shell\nChange it to Bash :)"
    exec chsh
fi
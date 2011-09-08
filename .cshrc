#!/usr/bin/env tcsh

if ("$SHELL" != "/bin/bash") then
    echo "You are using the $SHELL shell\nChange it to Bash :)"
    chsh
endif

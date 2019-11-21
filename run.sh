#!/bin/bash

echo "Git Bundle is being installed"
git bundle install 

echo "Setting up the bundle of gems"
bundle init

bundle add colorize 
bundle add tty-font
bundle add tty-progressbar

ruby battle_ships_RB.rb 


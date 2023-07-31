#!/usr/bin/env zsh

# Reveal hidden files in Finder
#
# Also available: Shift + Command + '.'
alias AllFilesTrue='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias AllFilesFalse='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

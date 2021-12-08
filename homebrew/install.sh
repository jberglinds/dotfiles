#!/usr/bin/env bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew() {
  /opt/homebrew/bin/brew "$@"
}

# install homebrew packages
brew tap homebrew/bundle
brew bundle

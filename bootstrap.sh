#!/usr/bin/env bash

# Exit on error
set -e

# Ask for administrator password upfront
sudo -v

# sudo keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xcode developer tools if not installed
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    sudo xcodebuild -license accept
fi

# Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brewfile
brew bundle --file=Brewfile


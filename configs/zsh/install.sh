#!/bin/sh

# Install zsh
# sudo apt-get install -y zsh

# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions

install_zsh() {
  if [ -x "$(command -v zsh)" ]; then
    echo "zsh is already installed"
  else
    echo "Installing zsh..."
    sudo apt-get install -y zsh
  fi
}
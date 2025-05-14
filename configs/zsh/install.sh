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

install_plugin() {
  local repo_url=$1
  local plugin_name=$(basename -s .git "$repo_url")
  local plugin_path=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${plugin_name}

  if [ ! -d "$plugin_path" ]; then
    echo "Installing $plugin_name..."
    git clone $repo_url $plugin_path
  else
    echo "$plugin_name already installed."
  fi
}

# install plugins
install_plugin "https://github.com/zsh-users/zsh-autosuggestions.git"
install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting.git"

if ! command -v fzf &> /dev/null; then
  sudo apt install fzf -y
fi
install_plugin "https://github.com/Aloxaf/fzf-tab.git"

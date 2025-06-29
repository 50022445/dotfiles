#!/bin/bash

# Init
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
cd "$(dirname "$0")"

# Cargo check (Rust)
if command -v cargo >/dev/null 2>&1; then
  echo "cargo is installed"
  cargo install krabby
else
  echo "cargo is NOT installed!"
  exit N
fi

# Stow zsh configs
stow zsh

# Install Dracula theme and move the config files
git clone https://github.com/dracula/zsh.git "$ZSH_CUSTOM/themes/dracula"

cp "$ZSH_CUSTOM/themes/dracula/dracula.zsh-theme" "$ZSH_CUSTOM/themes/"
cp -r "$ZSH_CUSTOM/themes/dracula/lib" "$ZSH_CUSTOM/themes/"

# Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "Completed! ;)"

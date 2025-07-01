#!/bin/bash

# Init
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
cd "$(dirname "$0")"


# Cargo check (Rust)
if command -v cargo >/dev/null 2>&1; then
  echo -e $GREEN "cargo is installed, installing krabby..."
  cargo install krabby
else
  echo -e $RED "cargo is NOT installed, please install it first"
  exit N
fi

# Cannot use stow if .zshrc exists
FILE="~/.zshrc"
if [ -f "$FILE" ]; then
    echo -e $BLUE "\nexisting .zshrc file found, removing now..."
    rm $FILE
else 
    echo "$FILE does not exist."
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

echo -e $GREEN "\nCompleted! ;)"

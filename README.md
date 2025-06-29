# ✨ Dotfiles  
A collection of my personal configuration files — terminal magic included 🤠

## 🚀 Installation

Clone the repo and symlink with [GNU Stow](https://www.gnu.org/software/stow/), then install the recommended Zsh plugins below:

### 🔌 Required Zsh Plugins

These plugins enhance your terminal experience with syntax highlighting and autosuggestions:

```bash
# Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

### 🐮 Stow
Use GNU Stow to put the dotfiles in it's place:

```bash
cd dotfiles \
stow zsh
```

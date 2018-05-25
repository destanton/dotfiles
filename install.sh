#!/bin/bash

# get dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make sure zsh is installed
ZSH_VERSION=$(zsh --version)

if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  echo "${ZSH_VERSION} is installed"
else
  sudo apt-get install zsh
  echo "installing zsh"
fi

# set default shell to zsh
if [ ! $(echo $SHELL) == $(which zsh) ]; then
  echo "changing shell to zsh..."
  chsh -s $(which zsh)
  echo "shell changed to zsh"
fi

# link custom theme to $ZSH_CUSTOM directory
ln -sf $DOTFILES_DIR/oh-my-zsh/danifrsh.zsh-theme $HOME/.oh-my-zsh/custom/themes
echo "linking custom oh-my-zsh theme"

# link files
ln -sf $DOTFILES_DIR/zsh/.zshrc ~
echo "linking .zshrc"
ln -sf $DOTFILES_DIR/zsh/.aliases ~
echo "linking .aliases"
ln -sf $DOTFILES_DIR/.gitconfig ~
echo "linking .gitconfig"


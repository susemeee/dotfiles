#!/bin/bash

# if mac, install Homebrew
unamestr=`uname`
if [ "$unamestr" == 'Darwin' ]; then
    # Check if Homebrew is installed
    if [ ! -f "`which brew`" ]; then
        echo 'Installing homebrew'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo 'Updating homebrew'
        brew update
    fi
    brew tap homebrew/bundle  # Install Homebrew Bundle
    brew install iproute2mac  # iproute2
    brew install tig          # tig
fi


# Install autojump
echo 'Installing autojump'
if [ "$unamestr" == 'Darwin' ]; then
    brew install autojump
else
    sudo apt update
    sudo apt install autojump
    which zsh || sudo apt install -y zsh
fi


# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
    echo 'Installing oh-my-zsh'
    /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo 'Updating oh-my-zsh'
    /bin/zsh -c "upgrade_oh_my_zsh"
fi

# Change default shell
if [ ! $0 = "-zsh" ]; then
    echo 'Changing default shell to zsh'
    chsh -s /bin/zsh
else
    echo 'Already using zsh'
fi

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cat ./zshrc >> ~/.zshrc
if [ ! $ZSH_THEME = "pygmalion" ]; then
sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="pygmalion"/g' ~/.zshrc
fi

# nvm
echo 'Installing nvm'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# node
echo 'Installing node'
./install-nodejs.sh

# pyenv
echo 'Installing pyenv'
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# sl
echo 'Installing sl'
if [ "$unamestr" == 'Darwin' ]; then
    brew install sl
else
    sudo apt install sl
fi


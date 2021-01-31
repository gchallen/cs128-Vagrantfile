#!/bin/bash

# set-up home directory and utility configuration
ln -s /vagrant/.config/clang-tidy $HOME/.clang-tidy
ln -s /vagrant/.config/clang-format $HOME/.clang-format
ln -s /vagrant/src $HOME/src
ln -s /vagrant/lib $HOME/lib
ln -s /vagrant/.vscode $HOME/

# enabling x-window forwarding
sudo sed -i '$s/$/\n    ForwardX11 yes/' /etc/ssh/ssh_config
sudo sed -i '$s/$/\n    ForwardX11Trusted yes/' /etc/ssh/ssh_config
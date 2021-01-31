#!/usr/bin/env bash

APT_FLAGS="-qq -y -o Dpkg::Use-Pty=0"
export DEBIAN_FRONTEND=noninteractive

apt-get $APT_FLAGS update
apt-get $APT_FLAGS install build-essential python3-pip

# install and configure clang-10, libc++abi-dev, and libc++-dev
apt-get $APT_FLAGS install clang-10 libc++abi-dev libc++-dev clangd-10
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100
update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-10 100
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100

# other utilities
apt-get $APT_FLAGS install clang-format-10 clang-tidy-10 cppcheck uncrustify
update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100
update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-10 100

apt-get $APT_FLAGS install make cmake git vim nano gedit manpages-dev gdb lldb-10 valgrind graphviz imagemagick gnuplot xorg

sudo ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
dpkg-reconfigure tzdata 2>&1

ln -sf /vagrant/.config/clang-tidy /home/vagrant/.clang-tidy
ln -sf /vagrant/.config/clang-format /home/vagrant/.clang-format
ln -sf /vagrant/.vscode /home/vagrant/.vscode

grep -qxF 'ForwardX11 yes' /etc/ssh/ssh_config || echo '    ForwardX11 yes' >> /etc/ssh/ssh_config
grep -qxF 'ForwardX11Trusted yes' /etc/ssh/ssh_config || echo '    ForwardX11Trusted yes' >> /etc/ssh/ssh_config

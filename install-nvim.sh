#!/bin/bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod 755 nvim.appimage
sudo chown root:root nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

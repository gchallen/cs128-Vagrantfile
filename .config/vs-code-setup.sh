#!/bin/bash

cat ./.config/vs-code-extension-list.txt | xargs -L 1 code --install-extension
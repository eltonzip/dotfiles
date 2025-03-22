#!/bin/env bash

. $HOME/Scripts/copy-cfg-to-repo.sh
cd $HOME/dotfiles
git add .
git commit
git push

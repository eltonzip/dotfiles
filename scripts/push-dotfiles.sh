#!/bin/env bash

. $HOME/scripts/copy-cfg-to-repo.sh
cd $HOME/dotfiles
git commit -a
git push

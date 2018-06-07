#!/bin/bash

cat ~/.vimrc > tmp.vimrc
cat ./rc/.vimrc >> tmp.vimrc
mv tmp.vimrc ./rc/.vimrc

rm ~/.vimrc
ln -s ./rc/.vim ~/.vim
ln -s ./rc/.vimrc ~/.vimrc

sudo yum install ncurses-devel
cd src
make -j


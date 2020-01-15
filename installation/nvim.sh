brew install nvim

# spacevim installation
curl -sLf https://spacevim.org/install.sh | bash -s
# nvim configuration
pip install --upgrade neovim
# mkdir ~/.config/nvim
# touch ~/.config/nvim/init.vim
# echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after' >>  ~/.config/nvim/init.vim
# echo 'let &packpath = &runtimepath' >>  ~/.config/nvim/init.vim
# echo 'source ~/.vimrc' >>  ~/.config/nvim/init.vim

# # plug.vim installation
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim +PlugInstall +qall

# # youcompleteme compilation
# brew install cmake
# #brew install python3-dev
# cd ~/.vim/bundle/YouCompleteMe
# python3 install.py --clang-completer
# cd -


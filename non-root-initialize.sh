## brew installation
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
#test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
#test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
#test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
#echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
#
## oh-my-zsh installation
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#git clone git@github.com:petronny/pinyin-completion.git
#cd pinyin-completion
#sudo ./setup.py install
#source shell/pinyin-comp.zsh
#
# configuration files importation
rsync -av ./ ~/

source ~/.zshrc

# youcompleteme compilation
brew install cmake
#brew install python3-dev
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
cd -

# anaconda installation
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
chmod +x Anaconda3-5.2.0-Linux-x86_64.sh
./Anaconda3-5.2.0-Linux-x86_64.sh
conda create -n py2 python=2.7

# git configuration
git config --global user.email "xueqianming200@gmail.com"
git config --global user.name "Xue Qianming"

# python libararies
pip install tensorflow-gpu
pip install ipython

# nvim configuration
pip install --upgrade neovim
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after' >>  ~/.config/nvim/init.vim
echo 'let &packpath = &runtimepath' >>  ~/.config/nvim/init.vim
echo 'source ~/.vimrc' >>  ~/.config/nvim/init.vim

source activate py2
pip install ipython
pip install pandas
pip install numpy
pip install tensorflow-gpu

# vim installation
brew install glances
brew install ranger
brew install ncdu
brew install vim
brew install nvim

source ./tmux.sh

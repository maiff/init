mkdir ~/usr
cd ~

# brew installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

# zsh installation
#sudo apt-get install zsh

## vim installation
#git clone https://github.com/vim/vim.git
#cd vim/src
#make distclean
#LDFLAGS=-L$HOME/usr/lib ./configure --prefix=$HOME/usr --
#sudo apt-get install gvim
brew install vim

# tmux configuration
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# oh-my-zsh installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# pip installation
sudo apt-get install python-pip

# ipython installation
pip3 install ipython3

# configuration files importation
rsync -av ./ ~/

#sudo apt install build-essential cmake python3-dev
# youcompleteme compilation
brew install cmake python3-dev
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
cd -

# anaconda installation
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
chmod +x Anaconda3-5.2.0-Linux-x86_64.sh
./Anaconda3-5.2.0-Linux-x86_64.sh

# git configuration
git config --global user.email "xueqianming200@gmail.com"
git config --global user.name "Xue Qianming"
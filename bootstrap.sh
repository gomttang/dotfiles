# Brew install
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew tap homebrew/bundle

# Brewfile 을 읽어서 업데이트 한다.
brew bundle --file=$HOME/Dropbox/dotfiles/Brewfile
brew cleanup
brew cask cleanup

# git file update
[ ! -f $HOME/.gitconfig ] && ln -nfs $HOME/Dropbox/dotfiles/.gitconfig $HOME/.gitconfig
[ ! -f $HOME/.gitignore_global ] && ln -nfs $HOME/Dropbox/dotfiles/.gitignore_global $HOME/.gitignore_global

# zsh to default shell & Install Oh-my-zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
[ ! -f $HOME/.zshrc ] && ln -nfs $HOME/Dropbox/dotfiles/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# Mackup 환경 설정 파일(.mackup.cfg)파일을 홈 디렉터리에 링크한다.
[ ! -f $HOME/.mackup.cfg ] && ln -nfs $HOME/Dropbox/dotfiles/.mackup.cfg $HOME/.mackup.cfg

# osx
#source $HOME/Dropbox/dotfiles/.osx

# node & npm
brew install node
brew install python
sudo npm install -g yarn
sudo pip install awscli
sudo npm install -g eslint

# .ssh
Mkdir ~/.ssh
cp $HOME/Dropbox/ssh/* ~/.ssh/

# makeup
brew install mackup
mackup restore

# Keyboard Speed Setting
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 
defaults write -g KeyRepeat -int 1 # normal minimum is 2 



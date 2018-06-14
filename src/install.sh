read -p "Install emacs? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo add-apt-repository ppa:kelleyk/emacs
  sudo apt-get update
  sudo apt-get install emacs25 
  git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
fi
read -p "Install vim? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  sudo apt-get install vim-youcompleteme vim zsh fonts-powerline
  sudo chsh $USER -s /usr/bin/zsh
  curl -fLo curl ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  sudo apt-get install neovim
  sudo apt-get install python-neovim
  sudo apt-get install python3-neovim
fi
read -p "Install zsh? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install zsh fonts-powerline
  git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi
read -p "Install handy packages? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install python-pip python3-pip build-essential python-dev python3-dev python-setuptools python3-setuptools libpng6-dev libjpeg9-dev
  sudo pip install numpy
  sudo pip3 install numpy
fi

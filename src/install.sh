read -p "Install packages? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo add-apt-repository ppa:kelleyk/emacs
  sudo apt-get update
  sudo apt-get install vim-youcompleteme zsh vim emacs25
  sudo chsh $USER -s /usr/bin/zsh
fi
read -p "Install handy packages? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install python-pip python3-pip build-essential python-dev python3-dev python-setuptools python3-setuptools libpng6-dev libjpeg9-dev
  sudo pip install numpy
  sudo pip3 install numpy
fi
read -p "Clone repos? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
fi

read -p "Get colors? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  mkdir -p ~/.vim/colors
  cd ~/.vim/colors
  wget https://raw.githubusercontent.com/ajmwagar/vim-deus/master/colors/deus.vim
fi


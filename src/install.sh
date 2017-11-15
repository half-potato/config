read -p "Install packages? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install zsh vim
  sudo add-apt-repository ppa:kelleyk/emacs
  sudo apt-get update
  sudo apt-get install emacs25
  sudo apt-get install vim-youcompleteme
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


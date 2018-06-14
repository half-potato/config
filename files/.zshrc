export ZSH=~/.oh-my-zsh
export TERM='xterm-256color'
ZSH_THEME="powerlevel9k/powerlevel9k"
export UPDATE_ZSH_DAYS=13
plugins=(git ssh)
#export PATH="/opt/ros/indigo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh
# The following lines were added by compinstall
zstyle :compinstall filename '/home/amai/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -U promptinit && promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
unsetopt beep nomatch
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_DUPS
ttyctl -f
bindkey -e
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# BEGIN PROMPT DEFINITIONS
#PROMPT='%6F%n%f %2F%m%f %T %1F%#%f ' # Left Prompt: <username> <host> <time(24)> %
#RPROMPT='%6F%~%' # Right Prompt: working directory shamelessly stolen from oliver, sort of
# END PROMPT DEFINITIONS

# BEGIN ENV. VARIABLE DEFINITIONS
#WIP=$(ip addr show wlan0 | grep "inet " | cut -d ' ' -f 6 | cut -d / -f 1) # WIFI IP
#ROS_IP=$(ip addr show wlan0 | grep "inet " | cut -d ' ' -f 6 | cut -d / -f 1) # WIFI IP
#EIP=$(ip addr show eth0 | grep "inet " | cut -d ' ' -f 6 | cut -d / -f 1) # ETHERNET IP
#export ROS_IP=$(hostname -I | tr -d '[[:space:]]') can't deal with additional ipv6
#export ROS_IP=$(hostname -I | cut -d' ' -f1)
#export TERM=xterm-256color
export EDITOR='vim'
#export ETS_TOOLKIT=qt4
#export QT4PREFIX=/opt/qt4
# END ENV. VARIABLE DEFINITIONS

# BEGIN ALIAS DEFINITIONS
alias mkbuild="mkdir build; cd build"
# END ALIAS DEFINITONS

mcd() {
	mkdir -p "$1" && cd "$1"
}

ip() {
  ifconfig $1 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'
}

connect() {
  export ROS_IP=$1
  export ROS_MASTER_URI=http://$2:11311
}

# precmd () {print -Pn "\e]0;$(history | tail -n1 | grep -o --ignore-case "[a-z].*")\a"}

#ROS
#source ~/catkin_ws/devel/setup.zsh
source /opt/ros/kinetic/setup.zsh
source ~/catkin_ws/devel/setup.zsh
alias clear="echo -en '\ec'"
#alias ros_rpi_wlan="export ROS_MASTER_URI=http://192.168.4.1:11311; export ROS_IP=$(ip wlp58s0)"
alias ros_rpi_ant="export ROS_MASTER_URI=http://10.42.0.1:11311; export ROS_IP=10.42.0.231"
#alias ros_local="export ROS_MASTER_URI=http://$(ip wlp58s0):11311; export ROS_IP=$(ip wlp58s0)"
alias ros_local="export ROS_MASTER_URI=http://localhost:11311; export ROS_IP=localhost"
alias gitinit="git init; wget https://gist.githubusercontent.com/half-potato/210c816a1872638bd905bf8720a6217f/raw; mv raw .gitignore"
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH:/usr/local/lib
alias vim="nvim"
export NC=~/.config/nvim/init.vim

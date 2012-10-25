# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#autoload -U promptinit
#promptinit
#prompt adam2

source ~/.alias
source ~/.env

setopt auto_pushd pushd_ignore_dups transient_rprompt hist_ignore_all_dups hist_ignore_space hist_fcntl_lock hist_reduce_blanks

PATH=~/bin:$PATH

# PROMPT
autoload -U colors && colors

local role="Servant"
if [ "$GID" = "0" ];then
   role="lord" 
fi
role="%{$terminfo[bold]$fg[cyan]%}$role%{$reset_color%}"
local user="%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}"
local host="%{$terminfo[bold]$fg[red]%}%m%{$reset_color%}"
local current_dir="%{$terminfo[bold]$fg[green]%}(%~)%{$reset_color%}"
local current_time="%{$terminfo[bold]$fg[yellow]%}%D{%Y-%m-%d} %*%{$reset_color%}"

local PROMPT_L1="${user}, $role of ${host}, at ${current_time} %{$fg[blue]%}announced a command:%{$reset_color%}"
local PROMPT_L2="${current_dir} "
PROMPT="$PROMPT_L1
$PROMPT_L2"

setopt correctall

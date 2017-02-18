export PATH=~/bin:$PATH
alias nano='writecheck' # Check if we have permission before using nano and sudo if not
alias ls='ls -G' # LS with colors
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" # iterm2 integration

# VV
alias ruwsgi='sudo touch /etc/uwsgi/reboot' 
alias logfile='sudo tail -f /var/log/uwsgi/app/bottle.log'
alias views='cd /var/www/voteview/views'
alias model='cd /var/www/voteview/model'
alias static='cd /var/www/voteview/static'
alias scripts='cd /usr/scripts'
alias photos='cd /usr/scripts/voteview_metadata/updateDB/getPhoto/'

# MB
alias school='cd ~/Dropbox/school/UCLA\ PhD/'
alias code='cd ~/Dropbox/code/'
alias ks='cd ~/Dropbox/code/ks\ tracker/'
alias spam='cd ~/Dropbox/code/spam\ blocker/'

# Prompt
autoload colors && colors
function _server_color()
{
  internal_hostname=`echo $HOST | cut -d'.' -f1`
  if [[ $internal_hostname == "mb" ]]; then
    echo "%{$fg[red]%}"
  elif [[ $internal_hostname == "voteview" ]]; then
    echo "%{$fg[blue]%}"
  elif [[ $internal_hostname == "voteviewdev" ]]; then
    echo "%{$fg[blue]%}"
  elif [[ $internal_hostname == "leela" ]]; then
    echo "%{$fg[green]%}"
  else
    echo "%{$fg[yellow]%}QQQ"
  fi
}

function _server_name()
{
  internal_hostname=`echo $HOST | cut -d'.' -f1`
  if [[ $internal_hostname == "voteview" ]]; then
    echo " %B(PRODUCTION)%b"
  fi
}

PROMPT="%n@$(_server_color)%m%{$reset_color%}:%~$(_server_name) "

. ~/z.sh # z jumper

echo ""


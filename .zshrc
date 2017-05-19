setopt prompt_subst
export PATH=~/bin:$PATH
fpath=(~/.zsh/completions_used $fpath)
alias nano='writecheck' # Check if we have permission before using nano and sudo if not
alias ls='ls -alG' # LS with colors
alias l='ls -alG'
alias clearcache="cd ~/Library/Application\ Support/Google/Chrome/Default/Local\ Storage/; ls -1 | grep -E -v '(neogaf|steam|google|netflix|github|reddit|slack)' | xargs rm -f"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" # iterm2 integration

# VV
alias ruwsgi='sudo touch /etc/uwsgi/reboot' 
alias logfile='sudo tail -f /var/log/uwsgi/app/bottle.log'
alias views='cd /var/www/voteview/views'
alias model='cd /var/www/voteview/model'
alias static='cd /var/www/voteview/static'
alias scripts='cd /usr/scripts'
alias photos='cd /usr/scripts/voteview_metadata/updateDB/getPhoto/'

# MB, local
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
    echo "%{$fg[yellow]%}"
  fi
}

function _server_name()
{
  internal_hostname=`echo $HOST | cut -d'.' -f1`
  if [[ $internal_hostname == "voteview" ]]; then
    echo " %B(PRODUCTION)%b"
  fi
}

function _git_repo()
{
  git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ $git_branch != "" ]]; then
    git_repo=`git config --get remote.origin.url | cut -d':' -f2 |  cut -d'.' -f1`
    git_dirty=`git status --porcelain 2>/dev/null | wc -l | tr -d '[:space:]'`
    if [[ $git_dirty > 0 ]]; then
      echo "%B(UNCOMMITTED)%b $git_branch on $git_repo"
    else
      echo "$git_branch on $git_repo"
    fi
  fi
}

PROMPT="%n@$(_server_color)%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$(_server_name)$ "
RPROMPT='$(_git_repo)'
. ~/z.sh # z jumper

autoload -U compinit; compinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

echo ""

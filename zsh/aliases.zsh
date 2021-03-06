# ====ALIAS-CONFIGURATION====

# Run list when directory changes
  function chpwd() {
    exa --long --all --header --git
  }

# Exa ls
  alias ls="exa --all"
  alias l="exa --long --all --header --git"
  alias tree="exa --tree --level=3"

# Vim
  alias vim="nvim"

# Go back
  alias ..="cd .."

# Git add
  alias ga="git add -A"

# Git commit
  alias gc="git commit"

# Git status
  alias gs="git status"

# Git push
  alias gp="git push"

# Git log
  alias gl="git log --oneline"

# Git log
  alias gd="git diff"

# Git checkout master
  alias gcm="git checkout master"

# Git checkout new branch
  alias gcn="git checkout -b"

# Git branch
  alias gb="git branch"

# Django runserver
  alias runserver="./manage.py runserver"

# Django make migrations
  alias makemigrations="./manage.py makemigrations"

# Django migrate
  alias migrate="./manage.py migrate"

# Cat with color
  alias cat="ccat"

# Docker ps
  alias ds="docker ps --format 'table {{.ID}}\\t{{.Names}}\t{{.Status}}'"

# Docker-compose
  alias d-c="docker-compose"

# Ansible
  alias ap="ansible-playbook"
  alias av="ansible-vault"

# Go to dotfiles
  alias dotfiles="cd ~/dotfiles"

# Take json from clipboard, fix and paste back
  alias jsontidy="pbpaste | jq '.' | pbcopy"

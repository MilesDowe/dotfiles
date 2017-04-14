source ~/.profile

alias ..='cd ..'
alias ll='ls -hAltr'
alias tailf='tail -f'
alias vi='vim'
alias top='htop'
alias grep='grep -n --color'
alias ls='ls -Gh'
alias diff='colordiff'
alias stat='stat -x'
alias df='df -h'
alias du='du -sh'

# For Mac OS
#alias emtr='sudo rm -rf ~/.Trash/*'

# reassign ghostscript before overwriting with git command 'gs' below
alias ghs='gs'

# Git aliases
#   - Assumes Git Autocomplete is installed
alias git-pretty-log='git log --pretty=format:"%Cgreen-- %h --%n%Creset%s%n%>(4)%Creset%an%n%>(4)%Creset%ad (%Cred%cr%Creset)%n" --date=short'
alias gc='git checkout'
__git_complete gc _git_checkout
alias gb='git branch'
__git_complete gb _git_branch
alias gd='git diff'
__git_complete gd _git_diff
alias gp='git pull'
__git_complete gp _git_pull
alias gs='git status'
__git_complete gs _git_status
alias ga='git add'
__git_complete ga _git_add
alias gm='git commit'
__git_complete gm _git_commit
alias gl='git-pretty-log'

# SVN aliases
alias sd='svn diff -x --ignore-space-change | less'

# Get list of java versions
alias getJavaVersions='/usr/libexec/java_home -V'

# Kill TMUX session
alias ksess='tmux kill-session -t'

# Set java version (i.e. $set-java-version 1.6.0_65-b14-462)
setJavaVersion() {
    export JAVA_HOME=`/usr/libexec/java_home -v $1`
}

# Using NVM (Node Version Manager)
#   - Assumes NVM is installed
export NVM_DIR="/Users/milesdowe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

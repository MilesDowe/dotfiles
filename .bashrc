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
alias chmod='chmod --preserve-root'

# reassign ghostscript before overwriting with git command 'gs' below
alias ghs='gs'

# Git aliases
#   - Assumes Git Autocomplete is installed
alias git-pretty-log='git log --pretty=format:"%Cgreen-- %h --%n%Creset%s%n%>(4)%Creset%an%n%>(4)%Creset%ad (%Cred%cr%Creset)%n" --date=short'

# SVN aliases
alias sd='svn diff -x --ignore-space-change | less'

# Kill TMUX session
alias ksess='tmux kill-session -t'

# For Mac OS
#alias emtr='sudo rm -rf ~/.Trash/*'
## Get list of java versions
#alias getJavaVersions='/usr/libexec/java_home -V'
# Set java version (i.e. $set-java-version 1.6.0_65-b14-462)
#setJavaVersion() {
#    export JAVA_HOME=`/usr/libexec/java_home -v $1`
#}

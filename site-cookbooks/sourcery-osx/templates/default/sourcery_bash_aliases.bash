export PATH=./script:./scripts:./bin:/Users/sourcery/bin:$PATH

alias cdsp="cd ~/Development/payments"
alias cdsg="cd ~/Development/getsourcery"
alias cdss="cd ~/Development/sourcery"
alias cdsa="cd ~/Development/admin"
alias cdsd="cd ~/Development/directory"
alias cdsw="cd ~/Development/sprout-wrap"

alias g=git
alias gpr="git pull --rebase"
alias gri="git rebase -i"
alias gst="git status"
alias canada="git commit --amend --no-edit --reset-author"
alias pair="git pair $@"
alias fall="spring stop"
alias rrg="rake routes | grep $1"
alias rr="rake routes"
alias rdm="rake db:migrate"
alias ll="ls -lah"
alias fs="foreman start"
alias be="bundle exec"
alias plz="foreman run bundle exec"
alias killrspec="ps aux | grep rspec | grep -v grep | awk '{print $2}' | xargs kill -9"

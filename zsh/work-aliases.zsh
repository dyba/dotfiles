#!/bin/zsh

alias rbc="bundle exec rubocop --safe-auto-correct"
alias ber="bundle exec rspec"
alias std="open zoommtg://zoom.us/join?action=join&confno=4849941315"

function copy-sha-uat () {
    curl --silent https://www.bbva.uat$1.amount.com/heartbeat | tail -n 1 | awk 'NF{ print $NF }' | pbcopy
}

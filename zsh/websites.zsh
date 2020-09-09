#!/bin/zsh

# Opens Chrome and navigates to airnow.gov to check the air quality in
# Los Angeles
function airnow() {
    open -a "/Applications/Google Chrome.app" "https://www.airnow.gov/?reportingArea=Central%20LA%20CO&stateCode=CA"
}

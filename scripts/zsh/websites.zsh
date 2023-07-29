#!/usr/bin/env zsh

# Opens Chrome and navigates to airnow.gov to check the air quality in
# Los Angeles
function airnow() {
    open -a "/Applications/Google Chrome.app" "https://www.airnow.gov/?reportingArea=Central%20LA%20CO&stateCode=CA"
}

function purpleair() {
    open -a "/Applications/Google Chrome.app" "https://www.purpleair.com/map?opt=1/mAQI/a10/cC0&select=38437#13/34.03917/-118.35568"
}

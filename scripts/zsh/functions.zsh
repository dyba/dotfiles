#!/bin/zsh

# Load environment variables defined inside a .env file
# Environment variables must be defined on each line using the format:
# MY_VAR=my-value
# Comments are ignored
function envup {
    local file=$([ -z "$1" ] && echo ".env" || echo ".env.$1")

	  if [ -f $file ]; then
	      export $(cat $file | sed 's/#.*//g' | xargs)
    else
        echo "No $file found" 1>&2
        return 1
	  fi
}

# Load environment variables defined inside a .env file
# Environment variables must be defined on each line using the format:
# MY_VAR=my-value
# Comments are ignored
envup() {
	if [ -f .env ]
	then
	    export $(cat .env | sed 's/#.*//g' | xargs)
	fi
}

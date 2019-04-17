#!/bin/sh

# created by Ben Rossi

# to be run from the command line without any required dependencies

# ./run.sh PORT BROWSER

# PORT accepts any value
# BROWSER accepts 'true' or 'false';
# 'true' will launch the demo in the system's default browser,
# 'false' will only start the web server

# first check to see if any arguments have been passed with the command;
# if they haven't, use the defaults
if [[ $# -eq 0 ]]; then
  PORT=8000
  BROWSER=true
else
  # otherwise...
  # argument positional order shouldn't matter, so look for the value that is an integer, if it exists, and make that port value
  if [[ $1 =~ ^-?[0-9]+$ ]]; then
    PORT=$1
    BROWSER=${2:-true}
  fi
  if [[ $2 =~ ^-?[0-9]+$ ]]; then
    PORT=$2
    BROWSER=${1:-true}
  fi
fi

# report back to the user the steps that the script is taking
echo "\n"
echo "-----------------------------------------"
echo "Type \"CONTROL+C\" to stop the webserver "
echo "-----------------------------------------"
echo "\n"

if [[ $BROWSER = true ]]; then
  #open http://localhost:$PORT
  open -a 'google chrome' -g http://localhost:$PORT
fi

# start the installed webserver
python -m SimpleHTTPServer $PORT

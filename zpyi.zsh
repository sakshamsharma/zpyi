###########################################
# Python interpreter fall-back for zsh    #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham0808@gmail.com            #
###########################################

command_not_found_handler() {
  ei=$(eix -Q "$1" | grep '^No\ matches\ found\.$')
  if [ -z "$ei" ]
  then
    echo "Command not found. Searching for package using eix..."
    eix -Q "$1"
  else
    echo "$1" | python $MYZSH/zsh_py.py
    if [ $? -ne 0 ]
    then
      echo "zsh, python: Command not found => $1"
    fi
  fi
}

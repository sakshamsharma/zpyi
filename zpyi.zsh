###########################################
# Python interpreter fall-back for zsh    #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham0808@gmail.com            #
###########################################

command_not_found_handler() {
  ei=$(~/.zpyi/package_search_command.zsh "$1" | grep '^No\ matches\ found\.$')
  if [ "$ei" != "" ]
  then
    echo "Command not found. Searching for package using your distro's package list..."
    ~/.zpyi/package_search_command.zsh "$1"
  else
    echo "$1" | python ~/.zpyi/zpyi.py
    if [ $? -ne 0 ]
    then
      echo "zsh, python: Command not found => $1"
    fi
  fi
}

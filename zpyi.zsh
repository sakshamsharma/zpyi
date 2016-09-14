###########################################
# Python interpreter fall-back for zsh    #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham@acehack.org              #
###########################################

command_not_found_handler() {
    # Remove any remaining commands
    rm -f ~/.inf

    # New fifo pipe
    mkfifo ~/.inf

    # Need to put to background
    echo -e "$1" > ~/.inf&

    python ~/.zpyi/zpyi.py ~/.inf

    # Optionally uncomment the below lines if
    # you do not use python so often
    # and would like to see the default error instead of
    # the python errors
    #
    # if [ $? -ne 0 ]
    # then
    #     echo "zsh, python: Command not found or invalid => $1"
    # fi
}

###########################################
# Python interpreter fall-back for zsh    #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham@acehack.org              #
###########################################

command_not_found_handler() {
    INPUT_PIPE=$HOME/.inf

    # Remove any remaining commands
    rm -f $INPUT_PIPE

    # New fifo pipe
    mkfifo $INPUT_PIPE

    # Need to put to background
    echo -e "$1" > $INPUT_PIPE &

    python ~/.zpyi/zpyi.py $INPUT_PIPE

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

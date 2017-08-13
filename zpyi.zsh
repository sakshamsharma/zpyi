###########################################
# Python interpreter fall-back for zsh    #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham@acehack.org              #
###########################################

command_not_found_handler() {
    PIPE_DIR=${XDG_CACHE_HOME:-$HOME/.cache}

    if [ ! -d  "$PIPE_DIR" ]; then
        mkdir -p "$PIPE_DIR"
    fi

    INPUT_PIPE=$PIPE_DIR/.zpyi_in
    ARGS_PIPE=$PIPE_DIR/.zpyi_args

    # Remove any remaining commands
    rm -f $INPUT_PIPE $ARGS_PIPE

    # New fifo pipe
    mkfifo $INPUT_PIPE

    if [ "$#" -ne 1 ]; then
        touch $ARGS_PIPE
        for var in "${@:2}"
        do
            echo "${var}" >> $ARGS_PIPE
        done
    fi

    # Need to put to background
    echo -e "$1" > $INPUT_PIPE &

    # Arcane zsh invokation alert
    #
    # ${(%):-%x} below will
    # be interpolated as
    # the absolute path to the file
    # this line is written in.

    # see man zshmisc for this and other
    # sanity testing obscure zsh magic

    # This allows the zpyi repo to be checked out
    # and sourced from anywhere in the filesystem
    # and still work.
    zpyi_dir=$(dirname ${(%):-%x})

    if [[ -a ${zpyi_dir}/zpyi.py ]]; then
        if [ "$#" -ne 1 ]; then
            python ${zpyi_dir}/zpyi.py $INPUT_PIPE $ARGS_PIPE
            rm $ARGS_PIPE
        else
            python ${zpyi_dir}/zpyi.py $INPUT_PIPE
        fi
    else
        echo "Couldn't find ${zpyi_dir}/zpyi.py...Downloading again might help."
    fi

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

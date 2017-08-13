###########################################
# Python script for zpyi                  #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham@acehack.org              #
###########################################

import sys
import os
from math import *
import subprocess

if 'ZPYI_IMPORTS' in os.environ:
    for module in os.environ['ZPYI_IMPORTS'].split(','):
        _module = __import__(module, globals(), locals())
        globals().update(_module.__dict__)

def cleanup():
    try:
        os.unlink(sys.argv[1])
    except:
        pass

args = []

with open(sys.argv[1]) as fifo:
    codestr = fifo.readlines()

if len(sys.argv) > 2:
    with open(sys.argv[2]) as argfile:
        args = argfile.readlines()

# Use arguments to automate script even better
for i in range(0, len(args)):
    sys.argv[i+1] = args[i]

code = ([ i for i in codestr if i.strip() ])

# Use try catch to return only after cleanup
try:
    if len(code) == 1 and not code[0].startswith('print'):

        # Call to import script to check if it's a package and installable
        _import_call_result = subprocess.call(['./import.sh', code[0]])

        # If the above call exits with non-zero status than the usual eval
        # is called so that
        # Commands like:
        # '1+2'
        # Also display output
        if _import_call_result != 0:
            print (eval(code[0]))
    else:
        # Bigger commands
        # 'a = 2
        #  print a'
        exec("\n".join(code))

except Exception as error:
    print ("Python statement invalid: ")
    print (error.__doc__)
    print ("{}".format(error))

cleanup()
sys.exit(0)

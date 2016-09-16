###########################################
# Python script for zpyi                  #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham@acehack.org              #
###########################################

import sys
import os
from math import *

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

code = ([ i.strip() for i in codestr if i.strip() ])

# Use try catch to return only after cleanup
try:
    if len(code) == 1 and not code[0].startswith('print'):
        # Commands like:
        # '1+2'
        # Also should display output
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

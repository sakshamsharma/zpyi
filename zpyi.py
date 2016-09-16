###########################################
# Python script for zpyi                  #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham@acehack.org              #
###########################################

import sys
import os
from math import *

if 'ZPYI_IMPORTS' in os.environ:
    for module in os.environ['ZPYI_IMPORTS'].split(','):
        _module = __import__(module, globals(), locals())
        globals().update(_module.__dict__)

def cleanup():
    try:
        os.unlink(sys.argv[1])
    except:
        pass

with open(sys.argv[1]) as fifo:
    codestr = fifo.readlines()

code = ([ i.strip() for i in codestr if i.strip() ])

# Use try catch to return only after cleanup
try:
    if len(code) == 1:
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

###########################################
# Python script for zpyi                  #
# Original Author:                        #
# Saksham Sharma (sakshamsharma)          #
# Email: saksham0808@gmail.com            #
###########################################

import sys

try:
    if sys.version_info[0] < 3:
        print (input())
    else:
        x = input()
        print (eval(x))

    sys.exit(0)

except Exception as e:
    sys.exit(102)

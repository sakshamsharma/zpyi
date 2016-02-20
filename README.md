zpyi
====

zpyi makes your shell smarter, in more ways than one. It's no magic, it's python.

```
                    _ 
                   (_)
 ____ _ __   _   _  _ 
|_  /| '_ \ | | | || |
 / / | |_) || |_| || |
/___|| .__/  \__, ||_|
     | |      __/ |   
     |_|     |___/    
```

Your shell now falls back to python if some command couldn't be handled by zsh.
So you can now do `2+3` directly in your shell. Well, something much more complex than that.

Of course, I did not want to break any existing functionality provided by Zsh and configured by me.
This prompted the need to use `'2**107'` instead of `2**107` to evaluate 2 to the exponent of 107.
Otherwise there would have been conflicts with the wildcard syntax of Zsh.

Oh, and I imported math library already.

There are of course options. You can use your shell within python, but be ready to give up the awesome tab
completion and prompts, and various other plugins available with Zsh.

# Examples
These things should now work in your shell.
* `2+4`
* `'2**107'`
* `'pow(10, 5)'`
* `'sqrt(5)'`

# The awesome eix fall-back
Interestingly, Zpyi will also search for a package similar to the erroneous command you just entered.
For example, I type `lisp`. I don't know what package it is in. Zpyi will see that running `eix` (Gentoo only) helps in this
and there is some output. It'll display that output and I'd know that there is a package called `commonlisp`.

# Installing?
Still TODO

# TODO
* The above section ?
* Add support for other distros
* Allow running a python daemon to support many more commands.
* Allow dynamic loading of modules.
* Add runtime flags.

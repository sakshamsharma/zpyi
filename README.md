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
So you can now do `2+3` directly in your shell. Well, something much more complex than that too.

Here's an example, try typing this in your shell after sourcing `zpyi` (Note the single quotes around the code):
```
'
a = 1
b = 2**107
c = a + b
print (c*2)
'
```
And this actually works! Output: `324518553658426726783156020576258` (you can check it, it IS right :smile: )

Of course, you would not want to break any existing functionality provided by Zsh.
This prompted the need to use `'2**107'` instead of `2**107` to evaluate 2 to the exponent of 107.
Otherwise there would have been conflicts with the wildcard syntax of Zsh.

Oh, and I imported `math` library already. You can directly call functions from the `math` library.

In short, you can assume that any command beginning with a single quote (and ending too) would be evaluated by python. You now have your Python history (for short commands) right in your shell! Even more useful is this:

```
'sqrt(2**10)' > outputfile
```

So now you don't need to run `python -c 'print(sqrt(2**10))' > outputfile`, only to remember that it won't work because `math` is not imported while using `python -c`.

# Examples
These things should now work in your shell.
* `2+4`
* `'2**107'`
* `'pow(10, 5)'`
* `'sqrt(5)'`

Also, *any* other python program using `os`, `math` or `sys` libraries, be it single line or multi line.

Also, you can be writing a shell script (remember to use `/bin/zsh` for now), and suddenly be confused about some array manipulation (or something else meaninglessly complicated in shell). With `zpyi` in place, all you have to do is pass the variable to be modified/parsed to python.
```
source ~/.zshrc
myname=$(whoami)
"
print ('${myname}'.upper())
print ('$(whoami)'.upper())
"
```
Run this file with a plain `zsh script.sh`! This is a very simple example of mixing python, shell variables, and shell commands, and it is possible to create many interesting combinations of shell and python this way.

*Note* A simple oneliner for the above would be `"'$(whoami)'.upper()"`

# Installing?
The installation script is concise enough:
```
cd ~
git clone https://github.com/sakshamsharma/zpyi ~/.zpyi
echo "source ~/.zpyi/zpyi.zsh" >> ~/.zshrc
```

If you feel lazy, this works too:
```
curl https://raw.githubusercontent.com/sakshamsharma/zpyi/master/install_script.sh | bash
```

Or if you make use of [antigen](https://github.com/zsh-users/antigen) 
```
antigen bundle https://github.com/sakshamsharma/zpyi zpyi.zsh
```

# TODO
* Add support for querying for missing packages

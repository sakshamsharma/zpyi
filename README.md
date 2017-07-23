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

Of course, to prevent breaking any existing functionality provided by Zsh,
you need to use `'2**107'` instead of `2**107` and the likes. Simply enclose your python program by some unused delimiters, and you're good to go.

You can assume that anything written at the start of a shell command, within single or double quotes would be interpreted as a python script.

Also, now instead of piping shell output to age-old (and still awesome, don't get me wrong) programs like `awk`, `grep`, `sed`, you can **actually** pipe shell output to short Python inline scripts, just like the good old `awk` scripts.

Of note, this is **not** a subset of `python -c`. `python -c` will *not* let you run python programs. It lets you run interactive python commands. Using `zpyi`, you can actually write programs and keep them in shell history, just like you've been doing with `awk` and `grep` since ages.

# Examples
Here are some cool things you can now do. Note that all the code blocks below are to be run in the shell itself! No need to write python scripts to do small one-time stuff. And all this stays in your shell history! No need to store your small scripts too.

#### Cool One liners
* `'2**107'`
* `'sqrt(10)'`
* `'"user".upper()'`
* Multiline code!
```
'
a = 1
b = 2**107
c = a + b
print (c*2)
'
```

#### Use shell commands and env vars inside python code
* `"print ('$(whoami)'.upper())"`
* `export myname="me"; "print ('$myname is nice')"`

#### Pass stuff to python script using stdin
```
cat /etc/passwd | '
lines = sys.stdin.readlines()

for line in lines:
    print line.upper()
'
```

#### Stdin and Stdout redirection
* `'print (input().upper())' < infile > outfile`
* `echo "what, my name is shady" | 'print (input().upper())'`

#### Command line parameters
Yes, they work too, using either the `sys.argv` or `argv` to refer to the 1 based indexing.
There is also an array named `args` which has the args in 0 based indexing

* `'print (str(int(sys.argv[1]) + int(sys.argv[2])))' 2 3` returns 5
* `'print (str(int(args[0]) + int(args[1])))' 2 3` returns 5 too

#### Imports!
The modules `math`, `sys` and `os` are already imported!

In addition, you can define an environment variable to use any custom imports, thanks to @orf for the PR on this!
```
# This is a shell command, run in your shell
export ZPYI_IMPORTS=requests

# This is the python line you run
"get('http://google.com')"
```

So now you don't need to run `python -c 'print(sqrt(2**10))' > outputfile`, only to remember that it won't work because `math` is not imported while using `python -c`.

#### Write cool shell scripts
Here's a simple zsh script to be run via `zsh script.sh`. Just that now you don't need to do complicated string parsing in shell, when you have python for that.
```
source ~/.zshrc
myname=$(whoami)
"print ('${myname}'.upper())"
```

# Installing?
The installation script is concise enough:
```
cd ~
git clone https://github.com/sakshamsharma/zpyi ~/.zpyi
echo "source ~/.zpyi/zpyi.zsh" >> ~/.zshrc
source ~/.zshrc
```

If you feel lazy, this works too:
```
curl https://raw.githubusercontent.com/sakshamsharma/zpyi/master/install_script.sh | bash
```

Or if you make use of [antigen](https://github.com/zsh-users/antigen) (which is probably a good idea):
```
antigen bundle https://github.com/sakshamsharma/zpyi zpyi.zsh
```

# Uninstallation
```
rm -rf ~/.zpyi
sed -i '/zpyi.zsh/d' ~/.zshrc
```

# TODO
* Add support for querying for missing packages

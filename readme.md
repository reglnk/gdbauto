# gdbauto

A custom wrapper for gdb (still command-line) \
Available features:
- functional macros (like aliases in GDB, but in other way with Lua syntax)
- paste your hecking C preprocessor directly in prompt and use these macros and defines in evaluating expressions
- recording command history and executing it on the next launch
- read code for more

# Installation
```bash
sudo luarocks install readline
sudo cp gdbauto /usr/local/bin
```

# Launching
The same as in original GDB.
```bash
gdbauto --args yourprog arg1 arg2 arg3...
```

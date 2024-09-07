# gdbauto

A custom wrapper for gdb (still command-line) \
Available features:
1. Functional macros (like aliases in GDB, but with Lua syntax)
2. Paste your hecking C preprocessor directly in prompt and use these macros and defines in evaluating expressions.
Or store them all in file .gdbauto_cmacros. Autocompletion included. Comments in files also supported.
3. Recording command history and executing it on the next launch
4. Read code for more

The main issue is removal of GDB's native autocompletion and extra (gdb) prompts mixed with (gal) prompts (from this script).
But it works somehow.
The reason is because the output of GDB isn't captured in main script but directly forwarded to a terminal.
`iocapture.lua` aims to solve this, but for now it's just a draft. Needs some time to restore highlight and other features.

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

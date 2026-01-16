# Variable and Argument

## Variable

- Variable stores the data to be reused later in the script. Variables are treated as string by default.

`variable_name="value"`

### Characteristics

- No spaces around `=`.
- Variable names are case-sensitive.
- Should start with letter or `_`.
- Use double quotes to preserve spaces and special characters.
- Use `$` only when reading the variable
- Shell is loosely typed. A variable can be number, string.

> Environment or configuration variables are often uses UPPERCASE (ex: $HOME, $PATH). Use env command to check environment variables.

## User Input

### read command

```
#!/bin/bash
echo "Enter your name:"
read name
echo "Hello, $name"
```

### common flags

- `-p`: Displays a message on the same line. `read -p ""Enter Age: "" age`
- `-s`: Silent: Hides the input (perfect for passwords). `read -s -p ""Password: "" pass`
- `-t`: Timeout: Continues if the user doesn't type within X seconds. `read -t 5 -p ""Hurry! "" fast`
- `-n`: Limit: Returns after a specific number of characters. `read -n 1 -p ""Press Y/N: "" choice`

### -e: Enable interpretation(execute)

#### What other "Actions" can it take?

- The -e switch doesn't just work for new lines. It works for a few other secret codes too:
- `\n` : Jump to the next line.
- `\t` : Do a big Tab jump (like 4-5 spaces at once).
- `\a` : Make an Alert sound (a "Ding!" or "Beep" from your computer speakers).
- `\\` : Print a single backslash (because usually, the computer thinks a backslash means a code is coming!).

## Argument

- You can pass argument to the shell when you execute it.
- `./shell-script.sh your-argument`
- We can make use of `$1`, `$2`, and so on to reference the multiple arguments.
- Use one space to seperate multiple arguments.
- Use `@` to referenace all

> $0 is used to refer the script itself

> currentdate=$(date) is replaced with currentdate=Fri Jan 16 20:03:22 IST 2026
> $(), Executes the command inside, Captures the output, Substitutes it in place

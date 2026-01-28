# Conditionals

Comparing numbers is a core part of logic. You use square brackets [ ] or double brackets [[]].

- Equality: -eq (e.g., [ $a -eq $b ])
- Not Equal: -ne
- Greater Than: -gt
- Less Than: -lt
- Greater or Equal: -ge
- Less or Equal: -le

> Do not use < or > inside standard brackets for comparisons, as these are treated as file redirections.
> It only works with numbers not with strings.

## File and Directory Conditions

- `-r`: readable
- `-w`: writable
- `-x`: executable
- `-z`: string is empty
- `-s`: file exists and not empty
- `-L`: symbolic link

- `-f`: regular file only
- `-d`: directory
- `-e`: exists (file or directory)
- `~`: home directory

- If you are using commands in if-statements then you don't need `[ ... ]` or `(( ... ))` because if-statements uses exit codes.
- If you are checking any file/ string then use `[ ... ]`
- If you are checking any number then use `(( ... ))`

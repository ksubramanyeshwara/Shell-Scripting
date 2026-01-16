# Data Types

- No strict data types like other languages
- All variables are treated as strings by default.
- Behavior changes based on context (command, test, arithmetic).
- Bash provides optional declarations to enforce specific behavior for integers, arrays, and associative arrays.

## Core Data Types

- Strings: Default type (everything is stored as text).
- Integers: For arithmetic operations.
- Array: An ordered list of strings. Accessed by index.
- Associative Array: Key-value pairs (Dictionaries). (Requires Bash 4.0+).
- Boolean: Not a native type. Represented by commands returning Exit Status 0 (Success/True) or 1 (Failure/False).
- Special Types: Exit codes (integers 0-255).

## How shell decides the data “type”

The "type" is defined by the operator you use, not the declaration.

- Using == treats the data as a string.
- Using -eq or (( )) treats the data as an integer.

```
X="5"
echo $X        # string
((X = X + 1))  # integer
```

- Using declare -a explicitly defines an array.
- Using declare -A explicitly defines an associative array.

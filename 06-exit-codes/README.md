# Exit Codes

- Exit code is an integer value between 0 and 255 that a command or shell script returns after a command finishes execution.
- Stored in the special variable `$?`
- `0` : Success (the command completed without errors).
- `1–255` : Failure / different error conditions

![exit codes](./exit%20codes.png)

## Why are exit codes used?

- Conditional execution: Decide what to do next based on success/failure (e.g., "If the backup failed, don't delete the original files").
- Debugging: Identify where and why a script failed. (e.g., "File not found" vs. "Permission denied").
- Automation: Other scripts/tools can react to your script's outcome

## Common Exit Codes

### Standard Exit Codes

- 0 - Success (command completed without errors)
- 1 - General errors (catchall for miscellaneous errors)
- 2 - Misuse of shell command (missing keyword, permission problem, etc.)

### Reserved Exit Codes (Bash)

- 126 - Command cannot execute (permission problem or not executable)
- 127 - Command not found (typo in command name or command not in PATH)
- 128 - Invalid exit argument (exit code out of range)
- 128+n - Fatal error signal "n" (e.g., 130 = 128 + 2 for SIGINT/Ctrl+C)
- 130 - Script terminated by Ctrl+C (SIGINT)
- 137 - Script terminated by SIGKILL (kill -9)
- 143 - Script terminated by SIGTERM (normal kill command)
- 255 - Exit status out of range

## Command-Specific Exit Codes

Different commands may use specific codes:

### grep:

- 0 - Match found
- 1 - No match found
- 2 - Error occurred

### diff:

- 0 - Files are identical
- 1 - Files differ
- 2 - Error occurred

### ping:

- 0 - Success
- 1 - No reply
- 2 - Error

### find:

- 0: Success
- Non-zero: Errors during search

### curl:

- 0: Success
- Various non-zero codes for specific HTTP/network errors

## Best Practices

- Always check exit codes of critical commands
- Use meaningful exit codes - different non-zero codes for different errors
- Document exit codes in your script's help/comments
- Clean up resources before exiting

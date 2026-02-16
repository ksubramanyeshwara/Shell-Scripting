# Case Statement

```bash
case variable in
    pattern1)
        # Commands to run if $VARIABLE matches pattern1
        ;;
    pattern2)
        # Commands to run if $VARIABLE matches pattern2
        ;; ## act as break statement
    *)
        # Default case (wildcard) if no other patterns match
        ;;
esac
```

- `)`: Separator between the pattern and the commands to be executed.
- `;;`: Break statement.
- `*)`: Default case (wildcard) if no other patterns match.

## When to Use case Instead of if

- Comparing one variable against many fixed values
- Creating menus
- Handling command-line arguments
- Matching patterns (wildcards)

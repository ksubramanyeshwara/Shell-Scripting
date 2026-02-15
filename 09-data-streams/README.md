# Data Streams

- Data streams are the flow of data between programs, files and devices.
- Data streams are the way to handle input, output, and error data in a program.
- Data streams are used to read and write data to and from files, devices, and other programs.
- Data streams are accessed via file descriptors(FD's).

## Standard Data Streams

| Stream                       | File Descriptor (FD) | Default Source/Destination   | Primary Purpose                                            |
| :--------------------------- | :------------------- | :--------------------------- | :--------------------------------------------------------- |
| **Standard Input (stdin)**   | `0`                  | Keyboard (by default)        | Accepts input for a program.                               |
| **Standard Output (stdout)** | `1`                  | Terminal screen (by default) | Displays the output to the screen or write to a file.      |
| **Standard Error (stderr)**  | `2`                  | Terminal screen (by default) | Displays error messages and diagnostic output separately . |

## Data Stream Redirection

- Data stream redirection is the process of changing the default input, output, or error stream of a program.

1. `>`: It redirect the output of a program to a file. If the file already exists, it will be overwritten.

2. `>>`: It redirect the output of a program to a file. If the file already exists, the output will be appended to the end of the file.

3. `<`: It redirect the input of a program from a file. `$wc -l < file.txt`

4. `2>`: It redirect the error output of a program to a file. If the file already exists, it will be overwritten.

5. `&>`: It redirect both the standard output and standard error to a file. If the file already exists, it will be overwritten.

6. `|`: It redirect the output of a program to the input of another program. This is called a pipeline.

> /dev/null is a special file that discards all data written to it. It is often used to suppress output.

> > when you don't user number before redirection symbol it will redirect the standard output.

### Why do we need separate file descriptors for standard output and standard error?

- It allows us to redirect the output and error messages to different files.
- Can redirect the output and see the error messages on the terminal.
- Scripts can send error messages to a person who can fix the problem.

## Pipes `|`

- Connects on command to another command.
- Pipes takes stdout of left command and passes it to stdin of right command.
- The data never hits the disk; it stays in memory as it flows through the "pipeline."

`$ps aux`: It lists all the processes running on the system.
`grep "python"`: It searches for the word "python".

By combining them: `$ps aux | grep "python"`

All the processes running on the system are piped into the grep command, which searches for the word "python" and displays the output on the terminal.

**tee**: Used to save the stdout to a file and also display it on the terminal.

> Pipes only pass stdout by default. If the first command in a pipe sequence (like `ls /fake_folder | grep "test"`) results in an error, do you think that error message will be sent to the grep command, or will it just pop up on your screen?

> Since stderr (File Descriptor 2) is a completely separate stream from stdout (File Descriptor 1), the pipe only grabs the "standard" output. The error message bypasses the pipe entirely and heads straight to your terminal screen.

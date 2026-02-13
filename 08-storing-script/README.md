# Storing Scripts

## Filesystem Hierarchy Standard

- It is a set of guidelines about the directory structure and the contents of Linux filesystems.
- It is a standard that is used by most Linux distributions.
- This standerdization helps users and softwares to find files and directories in a consistent manner.

## Directory Structure

- `/`: Root directory, Starting point and all the other directories are under this directory.
- `/bin` - Essential user binaries available to all users.
- `/sbin` - Essential system binaries for the root or system administrator.
- `/lib` - Libraries for binaries in `/bin` and `/sbin`.
- `/dev` - Device files represents hardware devices.
- `/etc` - Configuration files.
- `/home` - Home directories for regular users.
- `/root` - Home directory for the root user.
- `/boot` - Boot loader files.
- `/media` - Mount points for removable media such as CD-ROMs, USB drives, and other devices.
- `/mnt` - Temporary mount points.
- `/opt` - Optional add-on application software packages
- `/proc` - Kernel and process information virtual filesystem
- `/srv` - Location of data files for a service
- `/tmp` - Temporary files created by applications.
- `/usr` - User utilities and applications. Contains read-only user data, including binaries (/usr/bin), libraries (/usr/lib), and documentation.
- `/usr/bin` - User binaries
- `/usr/lib` - Libraries for binaries in `/usr/bin`
- `/usr/sbin` - System binaries for the root or system administrator.
- `/var` - Variable files that change frequently, such as logs (/var/log), mail queues, and spool files.

> FHS provides a standardized directory structure so this standard structure helps to store various scripts in a consistent manner.

## Directory for Storing Scripts

- `/usr/local/bin`: System wide script files are stored in this directory and used by all users. It requires `root` or `sudo` access to store scripts.
- `~/.local/bin`: User specific script files are stored in this directory and used by the current user. It does not require `root` or `sudo` access to store scripts.

## How it Works?

- When you run a command in the terminal, the shell looks in the directories listed in the `$PATH` environment variable.
- The `$PATH` environment variable contains a list of directories separated by colons.

```bash
echo $PATH
/home/username/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
```

- When you run a command, the shell looks for the directories from left to right in the `$PATH` environment variable.

> `/usr/bin` contains system binaries, owned by package manager. If you store custom scripts in `/usr/bin`, it may conflict with system binaries, may get overwritten by package manager. It also breaks FHS. /usr/bin: distribution-managed binaries and /usr/local/bin: administrator-installed binaries.

## How Linux Finds Commands?

```bash
$ls
```

- Check if It's a Built-in Command and if the command is a built-in command, it will be executed by the shell itself.
- If the command is not a built-in command, Shell checks the `$PATH` Environment Variable from left to right.
  - /home/username/.local/bin/ls
  - /usr/username/bin/ls
  - /usr/bin/ls ✅ (found) Stop searching
- If command exists in multiple directories in `$PATH` then the first one will be executed.
  - /usr/local/bin/ls this one will be executed.
  - /usr/bin/ls
- If command doesn’t exist anywhere in `$PATH` then it will throw an error.

> `/usr/bin/ls` If you run a command with absolute path, it will be executed directly without checking the `$PATH` environment variable.

> `which` command is used to find the location of a command.

> `whereis` command is used to find the location of a command, man pages, and source files.

> `type` command is used to find the type of a command.

> username@hostname:current_directory$ = ks@ks-laptop:~$
> $ indicates regular user, # indicates root user.
> `~` is a shortcut for the current user's home directory. `/home/ks`
> It is controlled by PS1 environment variable.

## How to Add a Directory to the `PATH` Environment Variable?

- Append the directory to the `$PATH` environment variable.

### Temporary Method(current session only)

```bash
export PATH=$PATH:/path/to/directory
```

### Permanent Method

```bash
nano ~/.bashrc

# Add this line at the bottom
export PATH="$PATH:/path/to/your/directory"
# export PATH="$PATH:/home/k-subramanyeshwara/testpath"
# Press Ctrl + O, then Enter to save.
# Press Ctrl + X to exit.

# Reload the .bashrc file
source ~/.bashrc

# Verify the changes
echo $PATH
```

> `~/.bashrc` is a shell script that is executed whenever a new terminal session is started. It is used to set up the shell environment for the user.


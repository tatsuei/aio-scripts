Table of Contents
=================

   * [List of Bash Commands](#list-of-bash-commands)
      * [Listing Files](#listing-files)
         * [Listing the ten most recently modified files!](#listing-the-ten-most-recently-modified-files)
         * [Listing all files and folders!](#listing-all-files-and-folders)
         * [Listing files WITHOUT ls!](#listing-files-without-ls)

# List of Bash Commands

## Listing Files

This section documents commands and various flags used in listing files and folders. Commands include `ls` and `tree`. [back to Top!](#Table-of-Contents)

| Command          | Function                                                     |
| ---------------- | ------------------------------------------------------------ |
| `ls`             | Lists all files and directories, excluding dotfiles `.` and `..` |
| `ls -a`          | List all entries including **.** and **..**                  |
| `ls -A`          | List all entries excluding **.** and **..**                  |
| `ls -c`          | Sort files by change time                                    |
| `ls -d `         | List directory entries                                       |
| `ls -h`          | Show filesizes in KB, MB, GB etc.                            |
| `ls -H`          | Same as ls -h, using powers of 1,000 instead of 1,024        |
| `ls -l`          | Show contents in long-listing format                         |
| `ls -o`          | Long-listing format without groups.                          |
| `ls -r`          | Show contents in reverse order.                              |
| `ls -s`          | Print size of each file in blocks.                           |
| `ls -S`          | Sort by files size                                           |
| `ls --sort=WORD` | Sort contents by a word (size, version, status)              |
| `ls -t`          | Sort by modification time                                    |
| `ls -u`          | Sort by last access time                                     |
| `ls -v `         | Sort by version                                              |
| `ls -1`          | List one file per line                                       |
| `tree`           | Lists the contents of the current directory in a tree format |
| `tree -L n`      | Lists contents based on `n` levels.                          |
| `tree -d`        | Lists directories only.                                      |

### Listing the ten most recently modified files!

```bash
ls -lt | head	
```

This combines the `l` and `t` flags along with a `head` flag. `head` by default prints the first 10 lines/files. [back to Top!](#Table-of-Contents)

### Listing all files and folders!

```bash
ls -a 
```

Using the `a` flag would list *ALL* files in the directory, including `.` and `..` which represent the `current directory` and the `parent directory`! 

```bash
ls -A
```

`-a`'s big bro would omit the current and parent directories `.` and `..` while listing everything else! [back to Top!](#Table-of-Contents)

### Listing files WITHOUT ls!

```bash
printf "%s\n" *
```

This displays all files and directories in the current directory.

```bash
printf "%s\n" */
```

This command which includes the forward slash `/` will list *only* the directories!

```bash
printf "%s\n" *.{gif,jpg,png}
```

And finally this! Displaying files according to select file extensions!

```bash
files=( * )
# iterate over them
for file in "${files[@]}"; do
echo "$file"
done
```

This script captures files in the current directory, storing them in a variable for processing. [back to Top!](#Table-of-Contents)

### 






























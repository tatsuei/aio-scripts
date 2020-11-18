Table of Contents
=================

   * [Table of Contents](#table-of-contents)
   * [Listing Files](#listing-files)
      * [Listing the ten most recently modified files!](#listing-the-ten-most-recently-modified-files)
      * [Listing all files and folders!](#listing-all-files-and-folders)
      * [Listing files WITHOUT ls!](#listing-files-without-ls)
   * [Using cat (no not that cat.)](#using-cat-no-not-that-cat)
      * [Let's concatenate some files!](#lets-concatenate-some-files)
      * [Displaying the file contents](#displaying-the-file-contents)
      * [Writing to a file?](#writing-to-a-file)
   * [Appendix](#appendix)
      * [M-notation](#m-notation)

# Listing Files

This section documents commands and various flags used in listing files and folders. Commands include `ls` and `tree`. 

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

[Table of Contents!](#Table-of-Contents)

## Listing the ten most recently modified files!

```bash
ls -lt | head	
```

This combines the `l` and `t` flags along with a `head` flag. `head` by default prints the first 10 lines/files. 

[Table of Contents!](#Table-of-Contents)

## Listing all files and folders!

```bash
ls -a 
```

Using the `a` flag would list *ALL* files in the directory, including `.` and `..` which represent the `current directory` and the `parent directory`! 

[Table of Contents!](#Table-of-Contents)

```bash
ls -A
```

`-a`'s big bro would omit the current and parent directories `.` and `..` while listing everything else!

[Table of Contents!](#Table-of-Contents)

## Listing files WITHOUT ls!

```bash
printf "%s\n" *
```

This displays all files and directories in the current directory.

[Table of Contents!](#Table-of-Contents)

```bash
printf "%s\n" */
```

This command which includes the forward slash `/` will list *only* the directories!

[Table of Contents!](#Table-of-Contents)

```bash
printf "%s\n" *.{gif,jpg,png}
```

And finally this! Displaying files according to select file extensions!

[Table of Contents!](#Table-of-Contents)

```bash
files=( * )
# iterate over them
for file in "${files[@]}"; do
echo "$file"
done
```

This script captures files in the current directory, storing them in a variable for processing. 

[Table of Contents!](#Table-of-Contents)

# Using cat (no not that cat.)

| Command  | Function                                                     |
| -------- | ------------------------------------------------------------ |
| `cat -n` | Prints line numbers                                          |
| `cat -v` | Show non-printing characters using `^` and M-notation except **LFD** and **TAB**. *Curious about this M-notation? [Click this](#M-notation)* |
| `cat -T` | Show **TAB** characters as ^I `(caret-i)`                    |
| `cat -E` | Show linefeed (LF) characters as *$*                         |
| `cat -e` | Show non-printing characters + show linefeed characters as *$* |
| `cat -b` | Number non-empty output lines, this flag overrides `-n`      |
| `cat -A` | Same as `cat -e` **and** show **TAB** characters as `caret-i` |
| `cat -s` | Suppress repeated empty output lines, `s` refers to `squeeze`. |

[Table of Contents!](#Table-of-Contents)

## Let's concatenate some files!

```bash
cat file1 file2 file3 > file_all	
```

This command would *compress* the contents in all three files and print the result as if it were a single file! 

```bash
cat file1 file2 file3 | grep foo				
```

This would take the contents of all three files and finds the keyword `foo` in the contents. This would save a lotta time :D 

[Table of Contents!](#Table-of-Contents)

## Displaying the file contents

```bash
cat file.txt
```

will read the file and display it in your terminal. If the file has some non-ASCII characters, you could display them using `cat -v`; this would be useful when control characters are invisible.

```bash
cat -v unicode.txt
```

If you're not into using `cat` and its various flags, try out `less` and `more`! These are interactive, allowing the user to use keys to navigate the file (much like `emacs` or `vim`).

```bash
less file.txt
```

Wanna pass file contents as an input for a command? Try redirection! `tr` is short for `translate`, a common term used in math (translation),

```bash
tr A-Z a-z <file.txt # same as cat file.txt | tr A-Z a-z
```

Gotta check the file from the end? Sure!

```bash
tac file.txt
```

To display the contents of a file in byte-by-byte form, a hex dump is the way to go! This is especially useful when you don't know the precise encoding. `od -cH` is typically used, though alternatives like `xxd` and `hexdump` are a bit more popular.

```bash
printf 'Hëllö wörld' | xxd
0000000: 48c3 ab6c 6cc3 b620 77c3 b672 6c64
H..ll.. w..rld
```

## Writing to a file?

```bash
cat >file
```

This would read any text input in the terminal and *overwrite* the existing data in the file regardless.

```bash
cat >>file
```

Don't wanna overwrite your data? Add another arrow! `>>` would tell the system you would like to *add* data to your file. P.S Use this key combo `Ctrl+D` when you're done typing!

```bash
cat <<END >file
Hello!
END
```

Here using the double arrows `<<` redirection symbol tells the system to append whatever text behind the `<<` to the end of the file on a new line!

# Appendix

## M-notation 

**Obtained from [Brian C.'s answer](https://stackoverflow.com/questions/44694331/what-is-the-m-notation-and-where-is-it-documented) in StackOverflow on July 6th, 2017 at 14:48**

**TL;DR:** The M-notation can be described (in layman terms) as the key-mappings of certain programs and terminals. M in this case refers to `Meta-Something` or the `Meta` key defined by the program and `Something` refers to the key combo pressed after the `Meta` key. 

>I was wondering this too. I checked the source but it seemed easier to create a input file to get the mapping.

> I created a test input file with a Perl scrip `for( my $i=0 ; $i < 256; $i++ ) {  print ( sprintf( "%c is %d %x\n", $i, $i ,$i ) ); }` and then ran it through cat -v

> Also if you see M-oM-;M-? at the start of a file it is the UTF-8 byte order mark.

> **Scroll down through these to get to the M- values:**

```
^@ is 0 0
^A is 1 1
^B is 2 2
^C is 3 3
^D is 4 4
^E is 5 5
^F is 6 6
^G is 7 7
^H is 8 8
(9 is tab)
(10 is NL)
^K is 11 b
^L is 12 c
^M is 13 d
^N is 14 e
^O is 15 f
^P is 16 10
^Q is 17 11
^R is 18 12
^S is 19 13
^T is 20 14
^U is 21 15
^V is 22 16
^W is 23 17
^X is 24 18
^Y is 25 19
^Z is 26 1a
^[ is 27 1b
^\ is 28 1c
^] is 29 1d
^^ is 30 1e
^_ is 31 1f
...printing chars removed...
^? is 127 7f
M-^@ is 128 80
M-^A is 129 81
M-^B is 130 82
M-^C is 131 83
M-^D is 132 84
M-^E is 133 85
M-^F is 134 86
M-^G is 135 87
M-^H is 136 88
M-^I is 137 89
M-^J is 138 8a
M-^K is 139 8b
M-^L is 140 8c
M-^M is 141 8d
M-^N is 142 8e
M-^O is 143 8f
M-^P is 144 90
M-^Q is 145 91
M-^R is 146 92
M-^S is 147 93
M-^T is 148 94
M-^U is 149 95
M-^V is 150 96
M-^W is 151 97
M-^X is 152 98
M-^Y is 153 99
M-^Z is 154 9a
M-^[ is 155 9b
M-^\ is 156 9c
M-^] is 157 9d
M-^^ is 158 9e
M-^_ is 159 9f
M-  is 160 a0
M-! is 161 a1
M-" is 162 a2
M-# is 163 a3
M-$ is 164 a4
M-% is 165 a5
M-& is 166 a6
M-' is 167 a7
M-( is 168 a8
M-) is 169 a9
M-* is 170 aa
M-+ is 171 ab
M-, is 172 ac
M-- is 173 ad
M-. is 174 ae
M-/ is 175 af
M-0 is 176 b0
M-1 is 177 b1
M-2 is 178 b2
M-3 is 179 b3
M-4 is 180 b4
M-5 is 181 b5
M-6 is 182 b6
M-7 is 183 b7
M-8 is 184 b8
M-9 is 185 b9
M-: is 186 ba
M-; is 187 bb
M-< is 188 bc
M-= is 189 bd
M-> is 190 be
M-? is 191 bf
M-@ is 192 c0
M-A is 193 c1
M-B is 194 c2
M-C is 195 c3
M-D is 196 c4
M-E is 197 c5
M-F is 198 c6
M-G is 199 c7
M-H is 200 c8
M-I is 201 c9
M-J is 202 ca
M-K is 203 cb
M-L is 204 cc
M-M is 205 cd
M-N is 206 ce
M-O is 207 cf
M-P is 208 d0
M-Q is 209 d1
M-R is 210 d2
M-S is 211 d3
M-T is 212 d4
M-U is 213 d5
M-V is 214 d6
M-W is 215 d7
M-X is 216 d8
M-Y is 217 d9
M-Z is 218 da
M-[ is 219 db
M-\ is 220 dc
M-] is 221 dd
M-^ is 222 de
M-_ is 223 df
M-` is 224 e0
M-a is 225 e1
M-b is 226 e2
M-c is 227 e3
M-d is 228 e4
M-e is 229 e5
M-f is 230 e6
M-g is 231 e7
M-h is 232 e8
M-i is 233 e9
M-j is 234 ea
M-k is 235 eb
M-l is 236 ec
M-m is 237 ed
M-n is 238 ee
M-o is 239 ef
M-p is 240 f0
M-q is 241 f1
M-r is 242 f2
M-s is 243 f3
M-t is 244 f4
M-u is 245 f5
M-v is 246 f6
M-w is 247 f7
M-x is 248 f8
M-y is 249 f9
M-z is 250 fa
M-{ is 251 fb
M-| is 252 fc
M-} is 253 fd
M-~ is 254 fe
M-^? is 255 ff
```




















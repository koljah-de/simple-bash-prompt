# simple-bash-prompt
A simple colored bash prompt with exit status recognition and git branch detection.

![Screenshot](screenshot.png "Screenshot")

### Installing
Copy *.bash_prompt* to your home directory.

Add  `source ~/.bash_prompt` to your *~/.bashrc*.

Finished.

### Better Tab Completion
For a better tab completion you can add these lines to your *~/.inputrc*:

```bash
# Faster tab completion
set show-all-if-ambiguous on
set completion-ignore-case on

# TAB through the suggestions
TAB:menu-complete

# Move between words with Ctrl+Left and Ctrl+Right
"\e[1;5D":backward-word
"\e[1;5C":forward-word

# Enable the history search mode
"\e[A":history-search-backward
"\e[B":history-search-forward
"\e[C":forward-char
"\e[D":backward-char

# Enable colors
set colored-stats On
set visible-stats On
set mark-symlinked-directories On
set colored-completion-prefix On
set menu-complete-display-prefix On

# Disables the control echo after pressing Ctrl+C
set echo-control-characters off

```
Here you can find additional info and a better explanation of the commands: <br/>
https://wiki.archlinux.org/index.php/Readline

### Some more useful options for the ~/.bashrc
```bash
# Stop logging of repeated identical commands or lines starting with space
export HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

```

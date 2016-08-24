# ide-vim-install
Easy environment setup for Vim addicts.

## Install

<pre>
wget https://raw.githubusercontent.com/xlucas/go-vim-install/master/install.sh
chmod +x install.sh
</pre>
```
## Usage

`./install.sh`

That's all !

## Shortcuts

The following default shortcuts are set in the `.vimrc` file :

### General
- <kbd>F2</kbd> : Create a new tab
- <kbd>F3</kbd> : Maximize/restore current window
- <kbd>F4</kbd> : Enable search highlight
- <kbd>F5</kbd> : Disable search highlight
- <kbd>F6</kbd> : Show/hide the file tree
- <kbd>F7</kbd> : Show/hide the undo tree
- <kbd>F8</kbd> : Show/hide the tagbar (shown by default)
- <kbd>F9</kbd> : Close the current tab
- <kbd>CTRL</kbd> + <kbd>Up</kbd> : Go to the next tab
- <kbd>CTRL</kbd> + <kbd>Down</kbd> : Go to the previous tab

### Formatting
- <kbd>F10</kbd> : Align text using ',' as a delimiter
- <kbd>F12</kbd> : Align text using space as a delimiter
- <kbd>CTRL</kbd> + <kbd>C</kbd> + <kbd>,</kbd> : Format Zen Coding
- <kbd>CTRL</kbd> + <kbd>\_</kbd> : Autoclose xml/html tag(s) (repeat to close several ones)
- <kbd>CTRL</kbd> + <kbd>j</kbd> : Expand snippet
- <kbd>CTRL</kbd> + <kbd>n</kbd> : Go to next snippet item
- <kbd>CTRL</kbd> + <kbd>p</kbd> : Go to previous snippet item

### Search and replace
- <kbd>CTRL</kbd> + <kbd>p</kbd> : Search for a file
- leader + <kbd>a</kbd> : Search for a word recursively from project's root directory
- leader + <kbd>aa</kbd> : Search word under cursor recursively from project's root directory
- leader + leader + <kbd>s</kbd> : Replace all occurences of word under the cursor in this file
- leader + <kbd>vr</kbd> : Recursively replace occurences of word under the cursor in all files

### Grammar
- leader + <kbd>g</kbd> : Run a grammar check
- <kbd>!</kbd> : Go to next grammar error
- <kbd>§</kbd> : Go to previous grammar error
- leader + <kbd>ga</kbd> : Fix all grammar errors automatically
- leader + <kbd>gf</kbd> : Fix this grammar error
- leader + <kbd>gr</kbd> : Remove this grammar error
- leader + <kbd>gd</kbd> : Disable this grammar rule

### Git
- <kbd>]c</kbd> : Go to next hunk
- <kbd>[c</kbd> : Go to previous hunk
- leader + <kbd>hp</kbd> : Preview current git hunk
- leader + <kbd>hr</kbd> : Revert current git hunk
- leader + <kbd>hs</kbd> : Stage current git hunk


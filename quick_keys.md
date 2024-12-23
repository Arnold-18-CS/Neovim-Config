# My Neovim Shortcuts

## General Keys

1. h j k l == ← ↓ ↑ →
2. Delete single character == x
3. Delete word = (at start) dw
4. Delete line == dd
5. Copies character == y
6. Copies word == yw
7. Copies line == yy
8. Undo == u (in normal), Ctrl-w (in insert)
9. Replace character == r {replacement}

### Access system clipboard register
- To allow a shared clipboard to other apps, out of Neovim.
- Use " + y

### Access buffer registers
- Is a stack structure, to access using :reg
- To get text in a specific register position use "{index}p 
- To save text to a specific register position use "{index}y 


### Search and Replace
- Match all occurences of the word under the cursor by * or / then cycle through them using n
1. When highlighted use `c-i-w` to remove the word and type a new one.
2. Cycle to next occurrence with n and press . to repeat previous replacement.
or
1. %s/word/replacement/g(global change in file)c(confirm for each word)

- Search on command prompt using:
1. / - is case sensitive

## Plugin Specific

1. Autocomplete == Enter
2. Cancel autocomplete == Ctrl e
3. Scroll docs up == Ctrl-b
4. Scroll docs down == Ctrl-f

5. Show Neo tree == Ctrl-n
6. Show Neo tree buffer == Space-b-f

7. Find files == Ctrl-p
8. Find word (in all docs) == space-f-g

9. K = provide hover information
10. space-g-d = goto definition
11. space-g-r = goto references
12. space-c-a = give code actions

13. space-d-t = toggle breakpoint
14. space-d-c = access debug tool

## Macros
- To start recording press q
- Set the register to store it in by @{register e.g a}
- Once done recording hit q again
- Access the same register where the macro was saved
- Use motions to repeat the same macro e.g 5@a

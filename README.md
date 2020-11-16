# org-rolodex (WIP)
A personal rolodex for emacs supported by org mode, features:
- A heading in a file per person at the main heading level
- A subheading per person which acts as a dated entry for a person
- If a person exists an entry is added under that person, otherwise a person is created

# Usage
Currently in its basic state:
1. Clone the repo and run M-x eval-buffer (SPC m e b, in Doom Emacs) in org-rolodex.el
2. Navigate to your rolodex org file 
3. M-x rolodex-add-entry, type name, return, type entry, return

# Feature Roadmap
Currently todo:
- Writing to a specific file from anywhere, rather than only writing to current buffer
- A more mature mini buffer approach closer to org capture with templates (should I hook into org capture even using a file+function capture template)
- Add entries per person alphabetically so the rolodex is clearly organised
- Functionality to retrieve a persons rolodex entry rolodex-fetch-person, displayed in a minibuffer
- If adding an entry to a person, and one already exists on that date, optionality to append or create a new entry on that date
- Optional titles per entry
- Setup for personal details: address, home phone etc. again templated and configurable
- Add an optional set of tags per person e.g. WORK, FRIEND, PERSONAL. Defined in similar way to org-todo types
- Formalise into a mode with keybindings (for standard emacs and doom emacs)
- Upload to Melpa

# Elisp Learnings
This is my first foray into elisp and emacs extension writing. The following links have been very useful:
- elisp documentation https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents
- Usage of the 'interactive' keywork with args https://www.gnu.org/software/emacs/manual/html_node/elisp/Interactive-Codes.html
- Examples of the 'interactive' keyword usage https://www.gnu.org/software/emacs/manual/html_node/elisp/Interactive-Examples.html
- Example of an org-capture template with the file+function type https://gist.github.com/webbj74/0ab881ed0ce61153a82e
- Writing a game in emacs (good first elisp resource) https://www.youtube.com/watch?v=gk39mp8Vy4M

Here is an example test function of navigating a buffer, taking a command line argument and adding it to the begining of a buffer.
Use C-x C-e at the end of the snippet to evaluate. Then run M-x test-function, to run.

``` emacs-lisp
(defun test-function (word)
  "Go to beginning of buffer and add WORD."
  (interactive "Mword:")
  (goto-char (point-min))
  (insert word))
```

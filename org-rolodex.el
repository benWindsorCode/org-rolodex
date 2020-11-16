;;; org-rolodex.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Ben Windsor
;;
;; Author: Ben Windsor <http://github/benWindsorCode>
;; Maintainer: Ben Windsor <benjaminwindsor@hotmail.com>
;; Created: November 16, 2020
;; Modified: November 16, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/benWindsorCode/org-rolodex
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;;     This file is a basic extension for Emacs to allow for
;;;     recording and easy manipulation of rolodex like data
;;;     for personal and professional accquaintances.
;;
;;; Code:

(provide 'org-rolodex)

(defconst *rolodex-person-format* "* %s :ROLODEX-PERSON:")
(defconst *rolodex-entry-format* "** %Y-%m-%d :ROLODEX-ENTRY:")

(defun new-person (name)
  "Given a NAME insert a new heading for that NAME."
  (insert (format *rolodex-person-format* name)))

(defun new-entry (entry)
  "Given an ENTRY insert a new heading for that NAME."
  (insert (format-time-string *rolodex-entry-format*) "\n" entry))

(defun find-person (name)
  "Given a NAME search for this name in the file."
  (re-search-forward (concat "* " name) nil t)
  (goto-char (point-at-bol)))

(defun rolodex-add-entry (name entry)
  "Create an entry with text ENTRY under NAME, make a new person if NAME doesn't exist."
  (interactive "MName:\nMEntry:")
  (goto-char 0)
  (if (re-search-forward name nil t)
      (progn
        (goto-char (point-at-eol))
        (insert "\n" (format-time-string *rolodex-entry-format*) "\n" entry))
    (progn
      (goto-char (point-max))
      (insert "\n")
      (new-person name)
      (insert "\n")
      (new-entry entry))))

;;; org-rolodex.el ends here

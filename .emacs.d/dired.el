;; DIRED+
;; install dired+.el for single dired window and colored directories
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)
(setq diredp-font-lock-keywords-1
      (list
       '("^  \\(.+:\\)$" 1 diredp-dir-heading) ; Directory headers
       '("^  wildcard.*$" 0 'default)       ; Override others, e.g. `l' for `diredp-other-priv'.
       '("^  (No match).*$" 0 'default)     ; Override others, e.g. `t' for `diredp-other-priv'.
       '("[^ .]\\.\\([^. /]+\\)$" 1 diredp-file-suffix) ; Suffix
       '("\\([^ ]+\\) -> [^ ]+$" 1 diredp-symlink) ; Symbolic links
       ;; 1) Date/time and 2) filename w/o suffix:
       (list dired-move-to-filename-regexp  '(1 diredp-date-time t t) ; Date/time
             (list "\\(.+\\)$" nil nil (list 0 diredp-file-name 'keep t))) ; Filename
       ;; Files to ignore
       (list (concat "^  \\(.*\\("
                     (concat (mapconcat 'regexp-quote
                                        (or (and (boundp 'dired-omit-extensions)
                                                 dired-omit-extensions)
                                            completion-ignored-extensions)
                                        "[*]?\\|")
                             "[*]?")        ; Allow for executable flag (*).
                     "\\|\\.\\(g?z\\|Z\\)[*]?\\)\\)$") ; Compressed.
             1 diredp-ignored-file-name t)
       '("[^ .]\\.\\([bg]?[zZ]2?\\)[*]?$" 1 diredp-compressed-file-suffix t) ; Compressed (*.z)
       '("\\([*]\\)$" 1 diredp-executable-tag t) ; Executable (*)
       '(" \\([0-9]+\\(\\.[0-9]+\\)?[kKMGTPEZY]?\\)" 1 diredp-inode+size) ; File inode number & size
       ;; Directory names
       (list "^..\\([0-9]* \\)*d"
             (list dired-move-to-filename-regexp nil nil)
             (list "\\(.+\\)" nil nil '(0 diredp-dir-priv t t)))
       '("^..\\([0-9]* \\)*.........\\(x\\)" 2 diredp-exec-priv) ;o x
       '("^..\\([0-9]* \\)*.........\\([lsStT]\\)" 2 diredp-other-priv) ; o misc
       '("^..\\([0-9]* \\)*........\\(w\\)" 2 diredp-write-priv) ; o w
       '("^..\\([0-9]* \\)*.......\\(r\\)" 2 diredp-read-priv)   ; o r
       '("^..\\([0-9]* \\)*......\\(x\\)" 2 diredp-exec-priv)    ; g x
       '("^..\\([0-9]* \\)*....[^0-9].\\([lsStT]\\)" 2 diredp-other-priv) ; g misc
       '("^..\\([0-9]* \\)*.....\\(w\\)" 2 diredp-write-priv) ; g w
       '("^..\\([0-9]* \\)*....\\(r\\)" 2 diredp-read-priv)   ; g r
       '("^..\\([0-9]* \\)*...\\(x\\)" 2 diredp-exec-priv)    ; u x
       '("^..\\([0-9]* \\)*...\\([lsStT]\\)" 2 diredp-other-priv) ; u misc
       '("^..\\([0-9]* \\)*..\\(w\\)" 2 diredp-write-priv) ; u w
       '("^..\\([0-9]* \\)*.\\(r\\)" 2 diredp-read-priv)   ; u r
       '("^..\\([0-9]* \\)*.\\([-rwxlsStT]+\\)" 2 diredp-no-priv keep) ;-
       '("^..\\([0-9]* \\)*\\([bcsmpS]\\)[-rwxlsStT]" 2 diredp-rare-priv) ; (rare)
       '("^..\\([0-9]* \\)*\\(l\\)[-rwxlsStT]" 2 diredp-link-priv) ; l
       (list (concat "^\\([^\n " (char-to-string dired-del-marker) "].*$\\)")
             1 diredp-flag-mark-line t) ; Flag/mark lines
       (list (concat "^\\([" (char-to-string dired-del-marker) "]\\)") ; Deletion flags (D)
             '(1 diredp-deletion t)
             '(".+" (dired-move-to-filename) nil (0 diredp-deletion-file-name t)))
       (list (concat "^\\([^\n " (char-to-string dired-del-marker) "]\\)") ; Flags, marks (except D)
             1 diredp-flag-mark t)
       ))

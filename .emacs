;;EMACS-WIDE SETTINGS
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "/usr/local/share/emacs/site-lisp/"))

;;keep backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(cua-mode nil nil (cua-base))
 '(current-language-environment "ASCII")
 '(custom-browse-sort-alphabetically t)
 '(display-time-mode 1)
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(frame-title-format "emacs %f" t)
 '(load-home-init-file t t)
 '(markdown-command "/usr/local/bin/markdown")
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell f)
 ;; confluence customization
 '(confluence-url "http://wiki.corp.opscode.com/rpc/xmlrpc")
 '(confluence-default-space-alist (list (cons confluence-url "TSE")))
 )

;;show column markers
(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'markdown-mode-hook (lambda () (interactive) (column-marker-1 80)))
;;toggle column 80 marker
;;(global-set-key "\C-X8" 'column-marker-1 80)

;; OSX SETTINGS
(setq default-frame-alist
      '((top . 22) (left . 2)
        (width . 187) (height . 59)))
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
(set-frame-parameter (selected-frame) 'alpha '(99 95))
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(server-start) ;; so it's listening for the emacsclient alias
(setq ns-pop-up-frames nil) ;; keep OSX from opening more windows
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;per http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/
(setq redisplay-dont-pause t)

;; FONTS
;;(set-face-font 'default "-*-bitstream vera sans mono-medium-r-*--18-*-*-*-*-*-*-*")
(set-face-font 'default "-apple-inconsolata-medium-r-normal--20-*-*-*-*-*-*-*")

(defun jfb-set-mac-font (name  size)
  (interactive
   (list (completing-read "font-name: " (mapcar (lambda (n) (list n n)) (mapcar (lambda (p) (car p)) (x-font-family-list))) nil t)
         (read-number "size: " 12)))
  (set-face-attribute 'default nil
                      :family name
                      :slant  'normal
                      :weight 'normal
                      :width  'normal
                      :height (* 10 size)))

;; UI SETTINGS
;;color theme
(require 'color-theme)
(require 'color-theme-twilight-mattray)
(color-theme-twilight-mattray)
;;turn off menu bar
(menu-bar-mode (if window-system 1 -1))
;;'y' instead of 'yes'
(fset 'yes-or-no-p 'y-or-n-p)
;;sort buffer list by name
(setq Buffer-menu-sort-column 2)
;;skip startup message
(setq inhibit-startup-message t)
;;require a newline end of file
(setq require-final-newline 'query)
;;always use spaces, never tabs
(setq-default indent-tabs-mode nil)
;;(define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop);
(setq default-tab-width 2);
;;unset C-z when in X-windows
(when window-system
  (global-unset-key "\C-z")) ; iconify-or-deiconify-frame (C-x C-z)
;;you can lowercase a region
(put 'downcase-region 'disabled nil)

;; KEY BINDINGS
;;skip to line number
(global-set-key "\C-Xg" 'goto-line)
;;toggle comment out block
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
;;indent-region
(global-set-key "\C-ci" 'indent-region)
;;insert another buffer
(global-set-key "\C-cb" 'insert-buffer)
;;set C-h to delete
(global-set-key "\C-h" 'delete-backward-char)
;;toggle word-wrap
(global-set-key "\C-xt" 'toggle-truncate-lines)
;;toggle word-wrap
(global-set-key "\C-xd" 'dirs)
;;create frame
(global-set-key "\M-~" 'new-frame)
;;next frame
(global-set-key "\M-`" 'ns-next-frame)
;;text size
(global-set-key "\M-+" 'text-scale-increase)
(global-set-key "\M-_" 'text-scale-decrease)

;;utf-8
(setq enable-local-variables nil)
;; (define-coding-system-alias 'UTF-8 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

;;RUBY
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session
;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Kitchenfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(setq ruby-deep-indent-paren nil)
;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
;; do overlay
(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
(setq ruby-block-highlight-toggle t)
(require 'flymake)
;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Berksfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Cheffile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Cheffile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Kitchenfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Procfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Thorfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Vagrantfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(add-hook 'ruby-mode-hook
	      (lambda () (flymake-mode t)))
(add-hook 'ruby-mode-hook
	      (lambda () (linum-mode t)))
(defun senny-ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))
(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)))

(global-set-key "\M-pd" "require 'pry'
binding.pry
"))

;;JSON
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(setq auto-mode-alist (cons '("\\.json$" . js-mode) auto-mode-alist))

;;MARKDOWN
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.seed" . conf-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb" . conf-mode) auto-mode-alist))

;;YAML
(autoload 'yaml-mode "yaml-mode.el" "Major mode for editing YAML files" t)
(setq auto-mode-alist (cons '("\\.yml" . yaml-mode) auto-mode-alist))

;;XML-LITE
;;(global-set-key "\C-cx" 'xml-lite-mode)
;;(autoload 'xxml-mode-routine "xml-lite")
;;(add-hook 'sgml-mode-hook 'xxml-mode-routine)

;;WHITESPACE
(require 'whitespace)
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;SHELL
;;Don't echo passwords when communicating with interactive programs:
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;;color output
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;clean up shell output by stripping ctrl-m
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; suppress shell echoes
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

;; make completion buffers disappear after 12 seconds.
(add-hook 'completion-setup-hook
          (lambda () (run-at-time 12 nil
                                  (lambda () (delete-windows-on "*Completions*")))))

;;DIRED
;;install dired+.el for single dired window and colored directories
(require 'dired+)
(toggle-dired-find-file-reuse-dir 1)
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

;;CONFLUENCE
;; assuming confluence.el and xml-rpc.el are in your load path
(require 'confluence)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; confluence editing support (with longlines mode)
;;(autoload 'confluence-get-page "confluence" nil t)
;; (eval-after-load "confluence"
;;   '(progn
;;      (require 'longlines)
;;      (progn
;;        (add-hook 'confluence-mode-hook 'longlines-mode)
;;        (add-hook 'confluence-before-save-hook 'longlines-before-revert-hook)
;;        (add-hook 'confluence-before-revert-hook 'longlines-before-revert-hook)
;;        (add-hook 'confluence-mode-hook '(lambda () (local-set-key "\C-j" 'confluence-newline-and-indent))))))
;; LongLines mode: http://www.emacswiki.org/emacs-en/LongLines
;; (autoload 'longlines-mode "longlines" "LongLines Mode." t)
;; (eval-after-load "longlines"
;;   '(progn
;;      (defvar longlines-mode-was-active nil)
;;      (make-variable-buffer-local 'longlines-mode-was-active)
;;      (defun longlines-suspend ()
;;        (if longlines-mode
;;            (progn
;;              (setq longlines-mode-was-active t)
;;              (longlines-mode 0))))
;;      (defun longlines-restore ()
;;        (if longlines-mode-was-active
;;            (progn
;;              (setq longlines-mode-was-active nil)
;;              (longlines-mode 1))))
;;      ;; longlines doesn't play well with ediff, so suspend it during diffs
;;      (defadvice ediff-make-temp-file (before make-temp-file-suspend-ll
;;                                              activate compile preactivate)
;;        "Suspend longlines when running ediff."
;;        (with-current-buffer (ad-get-arg 0)
;;          (longlines-suspend)))
;;      (add-hook 'ediff-cleanup-hook
;;                '(lambda ()
;;                   (dolist (tmp-buf (list ediff-buffer-A
;;                                          ediff-buffer-B
;;                                          ediff-buffer-C))
;;                     (if (buffer-live-p tmp-buf)
;;                         (with-current-buffer tmp-buf
;;                           (longlines-restore))))))))
;; open confluence page
(global-set-key "\C-xwf" 'confluence-get-page)
;; setup confluence mode
(add-hook 'confluence-mode-hook
          '(lambda ()
             (local-set-key "\C-xw" confluence-prefix-map)))

;; Git
;;(require 'magit)
(require 'gist)

;; Showoff https://github.com/developernotes/showoff-mode
;; (add-to-list 'load-path "~/.emacs.d/showoff-mode")
;; (require 'showoff-mode)
;;(add-to-list 'auto-mode-alist '("\\.md$" . showoff-mode))

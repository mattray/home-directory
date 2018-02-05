;; EMACS-WIDE SETTINGS
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

;; starting location
(setq default-directory (concat (getenv "HOME") "/"))

;; keep backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; install Marmalade and MELPA package repos
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; M-x package-list-packages, type U (mark Upgradable packages) and then x (eXecute the installs and deletions). When it’s done installing all the packages it will ask if you want to delete the obsolete packages and so you can hit y (Yes).

;; UI SETTINGS
(require 'color-theme-twilight-mattray)
(color-theme-twilight-mattray)
;; turn off menu bar
(menu-bar-mode (if window-system 1 -1))
;; 'y' instead of 'yes'
(fset 'yes-or-no-p 'y-or-n-p)
;; sort buffer list by name
(setq Buffer-menu-sort-column 2)
;; skip startup message
(setq inhibit-startup-message t)
;; unset C-z when in X-windows
(when window-system
  (global-unset-key "\C-z")) ; iconify-or-deiconify-frame (C-x C-z)
;; make completion buffers disappear after 15 seconds.
(add-hook 'completion-setup-hook
          (lambda () (run-at-time 15 nil
                                  (lambda () (delete-windows-on "*Completions*")))))

;; utf-8
(setq enable-local-variables nil)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; default to text-mode
(setq-default major-mode 'text-mode)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

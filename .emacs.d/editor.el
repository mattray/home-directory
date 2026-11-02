;; editor settings

;; require a newline end of file
(setq require-final-newline 'query)

;; delete trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; always use spaces, never tabs
(setq-default indent-tabs-mode nil)

;; (define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop);
(setq default-tab-width 2);

;; you can lowercase a region
(put 'downcase-region 'disabled nil)

;; 'y' instead of 'yes'
(fset 'yes-or-no-p 'y-or-n-p)

;; show column markers
;;(require 'column-marker)
;;(add-hook 'diff-mode-hook (lambda () (interactive) (column-marker-1 72)))
;;(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; add yafolding https://github.com/zenozeng/yafolding.el
;;(add-hook 'prog-mode-hook (lambda () (yafolding-mode)))
;;(add-hook 'json-mode-hook (lambda () (yafolding-mode)))

;;(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . diff-mode))

;; show line numbers
;;(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(add-hook 'conf-mode-hook 'display-line-numbers-mode)
;;(add-hook 'yaml-mode-hook 'display-line-numbers-mode)

;; https://git.savannah.gnu.org/cgit/emacs.git/tree/admin/notes/tree-sitter/starter-guide?h=feature/tree-sitter
;; https://emacs-tree-sitter.github.io/installation/
;; (require 'tree-sitter)
;; (require 'tree-sitter-langs)
;; (add-to-list 'treesit-extra-load-path "/Users/mattray/.emacs.d/tree-sitter-module/dist")
;; (global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; KEY BINDINGS
;; set C-h to delete
(global-set-key "\C-h" 'delete-backward-char)
;; skip to line number
(global-set-key "\C-xl" 'goto-line)
;; toggle comment out block
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
;; indent-region
(global-set-key "\C-ci" 'indent-region)
;; insert another buffer
(global-set-key "\C-cb" 'insert-buffer)
;; toggle word-wrap
(global-set-key "\C-xt" 'toggle-truncate-lines)
;; text size
(global-set-key "\M-+" 'text-scale-increase)
(global-set-key "\M-_" 'text-scale-decrease)

;; magit status
;;(global-set-key "\C-xg" 'magit-status)

;;(defun align-to-equals (begin end) "Align region to equal signs" (interactive "r") (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

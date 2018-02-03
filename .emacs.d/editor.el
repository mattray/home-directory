;; editor settings

;; require a newline end of file
(setq require-final-newline 'query)
;; always use spaces, never tabs
(setq-default indent-tabs-mode nil)
;; (define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop);
(setq default-tab-width 2);
;; you can lowercase a region
(put 'downcase-region 'disabled nil)

;; WHITESPACE
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; show column markers
(require 'column-marker)
(add-hook 'diff-mode-hook (lambda () (interactive) (column-marker-1 72)))
(add-hook 'enh-ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'markdown-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'sh-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . diff-mode))

;; KEY BINDINGS
;; skip to line number
(global-set-key "\C-Xg" 'goto-line)
;; toggle comment out block
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
;; indent-region
(global-set-key "\C-ci" 'indent-region)
;; insert another buffer
(global-set-key "\C-cb" 'insert-buffer)
;; set C-h to delete
(global-set-key "\C-h" 'delete-backward-char)
;; toggle word-wrap
(global-set-key "\C-xt" 'toggle-truncate-lines)
;; toggle word-wrap
(global-set-key "\C-xd" 'dirs)
;; create frame
(global-set-key "\M-~" 'new-frame)
;; next frame
(global-set-key "\M-`" 'ns-next-frame)
;; text size
(global-set-key "\M-+" 'text-scale-increase)
(global-set-key "\M-_" 'text-scale-decrease)

(defun align-to-equals (begin end) "Align region to equal signs" (interactive "r") (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

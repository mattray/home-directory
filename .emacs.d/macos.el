;; OSX SETTINGS
(setq default-frame-alist
      '((top . 1) (left . 0)
        (width . 128) (height . 36)))
(set-frame-parameter (selected-frame) 'alpha '(99 95))

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq delete-by-moving-to-trash t)

(when window-system
  (global-unset-key "\C-z")) ; iconify-or-deiconify-frame (C-x C-z)

;; (custom-theme-set-faces
;;  'misterioso
;;  '(region ((t (:inherit nil :background "RoyalBlue4"))))
;;  '(highlight ((t (:inherit region :background "dark olive green"))))
;;  '(hl-line ((t (:inherit highlight)))))

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))
;; (setq custom--inhibit-theme-enable nil)
;; (require 'mattray-twilight-theme)

;; powerline
;; (require 'powerline-mattray-theme)
;; (setq powerline-default-separator 'bar) ;;alternate bar
;; (powerline-mattray-theme)

;; OSX SETTINGS
(setq default-frame-alist
      '((top . 30) (left . 1)
        (width . 167) (height . 37)))
(set-frame-parameter (selected-frame) 'alpha '(99 95))
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(server-start) ;; so it's listening for the emacsclient alias
(setq ns-pop-up-frames nil) ;; keep OSX from opening more windows

;; FONTS
;; 0O 1l
;; (set-face-font 'default "-*-bitstream vera sans mono-medium-r-*--18-*-*-*-*-*-*-*")
;; (set-face-font 'default "-apple-inconsolata-medium-r-normal--18-*-*-*-*-*-*-*")
(set-face-font 'default "-*-Inconsolata for Powerline-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

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

(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

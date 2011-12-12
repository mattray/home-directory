;; Twilight Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Twilight colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/twilight-emacs/color-theme-twilight.el")
;;
;; And then (color-theme-twilight) to activate it.
;;
;; Several areas still require improvement such as recognition of code that ruby-mode doesn't
;; yet pick up (eg. parent classes), Rails/Merb keywords, or non Ruby code related areas
;; (eg. dired, HTML, etc). Please feel free to customize further and send in any improvements,
;; patches most welcome.
;;
;; MIT License Copyright (c) 2008 Marcus Crafter <crafterm@redartisan.com>
;; Credits due to the excellent TextMate Twilight theme
;;
;; Thanks to Travis Jeffery for ido-mode and fixes to the minibuffer-prompt to fit in with the rest of the theme
;;

(defun color-theme-twilight-mattray ()
  "Variant of Color theme by Marcus Crafter, based off the TextMate Twilight theme, created 2008-04-18. Matt Ray's variant 2011-05-10"
  (interactive)
  (color-theme-install
   '(color-theme-twilight-mattray
     ((background-color . "#001122")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "yellow2")
      (foreground-color . "#eeeeee")
      (mouse-color . "yellow2"))
     (default ((t (:background "#001122" :foreground "#CACACA"))))
     (blue ((t (:foreground "blue"))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#141414" :foreground "#CACACA"))))
     (font-lock-builtin-face ((t (:foreground "#CACACA"))))
     (font-lock-comment-face ((t (:foreground "#5F5A60"))))
     (font-lock-constant-face ((t (:foreground "#CF6A4C"))))
     (font-lock-doc-string-face ((t (:foreground "BlanchedAlmond"))))
     (font-lock-function-name-face ((t (:foreground "#9B703F"))))
     (font-lock-keyword-face ((t (:foreground "#CDA869"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))

     ;; Enhanced-Ruby-Mode
     (ruby-string-delimiter-face  ((t (:foreground "#5A6340"))))
     (ruby-regexp-delimiter-face ((t (:foreground "orange"))))
     (ruby-heredoc-delimiter-face ((t (:foreground "#9B859D"))))
     (ruby-op-face ((t (:foreground "#CDA869"))))

     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))

     (minibuffer-prompt ((t (:foreground "#5F5A60"))))
     (ido-subdir ((t (:foreground "#CF6A4C"))))
     (ido-first-match ((t (:foreground "#8F9D6A"))))
     (ido-only-match ((t (:foreground "#8F9D6A"))))
     (mumamo-background-chunk-submode ((t (:background "#222222"))))

     (linum ((t (:background "#141314" :foreground "#2D2B2E"))))
     (hl-line ((t (:background "#1111FF"))))
     (yas/field-highlight-face ((t (:background "#27292A"))))

     (font-lock-string-face ((t (:foreground "#8F9D6A"))))
     (font-lock-type-face ((t (:foreground "#9B703F"))))
     (font-lock-variable-name-face ((t (:foreground "#7587A6"))))
     (font-lock-warning-face ((t (:background "#EE799F" :foreground "red"))))
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))

     (isearch ((t (:background "green" :foreground "black"))))

     ;;selection highlighting
     (region ((t (:background "#003355"))))
     (mode-line ((t (:background "grey75" :foreground "#001122"))))
     (highlight ((t (:background "green3"))))
     (highline-face ((t (:background "SeaGreen"))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow2" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (zmacs-region ((t (:background "snow" :foreground "blue")))))))


(provide 'color-theme-twilight-mattray)

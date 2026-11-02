;;; -*- lexical-binding: t -*-
;; install MELPA package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; M-x package-refresh-contents
;; M-x package-list-packages, type U (mark Upgradable packages) and then x (eXecute the installs and deletions). When it’s done installing all the packages it will ask if you want to delete the obsolete packages and so you can hit y (Yes).

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(twilight-anti-bright-mattray))
 '(custom-safe-themes
   '("4454b1713d399d0c82ca8dea31344c30aa02509ec01d0d44609add393cfc1f08"
     "bb0cea0f286ba07255b0af5f538db1bd4dd0b7581ef2942cdd7121fd294c16d2"
     "e031095ab9babbac23038909788062ec4c8d7ee1fc623c66febd3192ae7a46dd"
     "454984dd07c4b80b2647784a28652246a0d99a9790829635c5eaaa56a2bb7ace"
     "5c93d1c8acc529a7b3755327eda5fbe5013459ba63385ef67216a50720aabcc1"
     default))
 '(explicit-shell-file-name "/bin/zsh")
 '(explicit-zsh-args '("--interactive" "--login"))
 '(fringe-mode '(nil . 0) nil (fringe))
 '(package-selected-packages '(twilight-anti-bright-theme))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro for Powerline" :foundry "nil" :slant normal :weight regular :height 180 :width normal)))))

(load-file "~/.emacs.d/macos.el")
(load-file "~/.emacs.d/editor.el")
(put 'upcase-region 'disabled nil)

;; if you want a Tramp shell on a remote box, open a file there first
;; C-x C-f /ssh:vagrant@127.0.0.1#2222:/tmp/file
;; C-u M-x shell /ssh:vagrant@127.0.0.1#2222:/
;; sudo a file
;; C-x C-f /ssh:cubert|sudo:cubert:/etc/apt/sources.list

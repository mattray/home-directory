;;; emacs configuration

;; install Marmalade and MELPA package repos
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; M-x package-list-packages, type U (mark Upgradable packages) and then x (eXecute the installs and deletions). When it’s done installing all the packages it will ask if you want to delete the obsolete packages and so you can hit y (Yes).

(load-file "~/.emacs.d/global.el")
(load-file "~/.emacs.d/flyspell.el")
(load-file "~/.emacs.d/macos.el")
;; (load-file "~/.emacs.d/json.el")
(load-file "~/.emacs.d/markdown.el")
(load-file "~/.emacs.d/ruby.el")
(load-file "~/.emacs.d/shell.el")
;; (load-file "~/.emacs.d/xml.el")
;; (load-file "~/.emacs.d/rust.el")
;;(load-file "~/.emacs.d/toml.el")
(load-file "~/.emacs.d/yaml.el")
(load-file "~/.emacs.d/editor.el")
(load-file "~/.emacs.d/dired.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;["black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]
 '(ansi-color-names-vector
   ["black" "#aa0000" "#00cd66" "#cdcd00" "#0066ff" "#cc0066" "#40e0d0" "gray92"])
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "ASCII")
 '(custom-browse-sort-alphabetically t)
 '(custom-safe-themes
   (quote
    ("3b1a0c5b02862eec5f1b3f3f4145fd5a8b02d65beb13d8fa8a6262e280f87119" default)))
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(flycheck-ruby-rubocop-executable "/opt/chef-workstation/bin/rubocop")
 '(flycheck-ruby-rubylint-executable "/usr/local/bin/ruby-lint")
 '(frame-title-format "%f" t)
 '(global-diff-hl-mode t)
 '(load-home-init-file t t)
 '(magit-git-executable "/usr/local/bin/git")
 '(markdown-command "/usr/local/bin/markdown")
 '(package-selected-packages
   (quote
    (terraform-mode powerline json-mode diff-hl gist yaml-mode smart-mode-line rust-mode ruby-block rubocop markdown-preview-eww markdown-mode magit js2-refactor go-eldoc flycheck f enh-ruby-mode dired+ column-marker)))
 '(save-place-mode t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t nil (paren))
 '(standard-display-ascii 9 t)
 '(tool-bar-mode nil nil (tool-bar))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell f))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; if you want a Tramp shell on a remote box, open a file there first
;; C-x C-f /ssh:vagrant@127.0.0.1#2222:/tmp/file
;; C-u M-x shell /ssh:vagrant@127.0.0.1#2222:/
;; sudo a file
;; C-x C-f /ssh:cubert|sudo:cubert:/etc/apt/sources.list

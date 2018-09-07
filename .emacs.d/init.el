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
(load-file "~/.emacs.d/osx.el")
(load-file "~/.emacs.d/git.el")
(load-file "~/.emacs.d/go.el")
;; (load-file "~/.emacs.d/json.el")
(load-file "~/.emacs.d/markdown.el")
(load-file "~/.emacs.d/ruby.el")
(load-file "~/.emacs.d/shell.el")
;; (load-file "~/.emacs.d/xml.el")
;; (load-file "~/.emacs.d/rust.el")
(load-file "~/.emacs.d/toml.el")
(load-file "~/.emacs.d/yaml.el")
(load-file "~/.emacs.d/editor.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "olive drab" "green1" "yellow3" "blue2" "magenta3" "cyan3" "gray90"])
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "ASCII")
 '(custom-browse-sort-alphabetically t)
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(flycheck-ruby-rubocop-executable "/opt/chefdk/bin/rubocop")
 '(flycheck-ruby-rubylint-executable "/usr/local/bin/ruby-lint")
 '(frame-title-format "%f" t)
 '(load-home-init-file t t)
 '(markdown-command "/usr/local/bin/markdown")
 '(package-selected-packages
   (quote
    (git-gutter-fringe+ yaml-mode toml-mode smart-mode-line rust-mode ruby-block rubocop markdown-preview-eww markdown-mode js2-refactor go-eldoc git-commit gist flycheck f enh-ruby-mode dired+ column-marker color-theme)))
 '(save-place t nil (saveplace))
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

;; emacs configuration


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
 '(flycheck-chef-foodcritic-executable "/opt/chefdk/bin/foodcritic")
 '(flycheck-ruby-rubocop-executable "/opt/chefdk/bin/rubocop")
 '(flycheck-ruby-rubylint-executable "/usr/local/bin/ruby-lint")
 '(frame-title-format "%f" t)
 '(load-home-init-file t t)
 '(markdown-command "/usr/local/bin/markdown")
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

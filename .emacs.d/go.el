;; Go
;; https://github.com/dominikh/go-mode.el
;; go-mode via elpa
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20151226.1224/" t)
(require 'go-mode-autoloads)
(setenv "GOPATH" (concat (getenv "GOPATH") ":~/gopath"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/go/bin:~/gopath/bin"))
(setq exec-path (append exec-path '("/usr/local/go/bin") '("~/gopath/bin")))
;; https://github.com/syohex/emacs-go-eldoc
(add-to-list 'load-path "~/.emacs.d/elpa/go-eldoc-20151028.10/" t)
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
;; go-mode customizations
(add-hook 'before-save-hook 'gofmt-before-save)

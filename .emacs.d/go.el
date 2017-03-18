;; Go
;; https://github.com/dominikh/go-mode.el
;; go-mode via elpa
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20170308.1512/")
;;(require 'go-mode-autoloads)
(setenv "GOPATH" (getenv "GOPATH"))
(setenv "PATH" (getenv "PATH"))
(setq exec-path (append exec-path '("/usr/local/go/bin") '("/Users/mray/go/bin")))
;; https://github.com/syohex/emacs-go-eldoc
(add-to-list 'load-path "~/.emacs.d/elpa/go-eldoc-20170305.627/")
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
;; go-mode customizations
(add-hook 'before-save-hook 'gofmt-before-save)

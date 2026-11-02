;; Go
;; Periodically go get -u all to keep the downloaded tools updated.
;; https://github.com/dominikh/go-mode.el
;; https://dr-knz.net/a-tour-of-emacs-as-go-editor.html

;; ensure GOPATH is set properly
;; https://github.com/nsf/gocode/issues/261
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "GOPATH")

;; Gopls is a supported backend for lsp-mode. It will be used automatically by lsp-mode if gopls is found in your PATH. You can install gopls via: go get golang.org/x/tools/gopls@latest. To enable lsp-mode for go buffers:
(add-hook 'go-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; flymake-go-staticcheck
(add-hook 'go-mode-hook #'flymake-go-staticcheck-enable)
(add-hook 'go-mode-hook #'flymake-mode)

;; go guru?
;; https://docs.google.com/document/d/1_Y9xCEMj5S-7rv2ooHpZNH15JgRT5iM742gJkw5LtmQ/edit

(add-hook 'before-save-hook 'gofmt-before-save)
;;(add-hook 'before-save-hook (lambda () (gofmt)))

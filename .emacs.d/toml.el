;; TOML
(autoload 'toml-mode "toml-mode" "Major mode for editing TOML files" t)
(add-to-list 'auto-mode-alist '("\\.tml$" . toml-mode))
(add-to-list 'auto-mode-alist '("\\.toml$" . toml-mode))

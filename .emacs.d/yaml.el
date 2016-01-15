;; YAML
(autoload 'yaml-mode "yaml-mode" "Major mode for editing YAML files" t)
(setq auto-mode-alist (cons '("\\.yml" . yaml-mode) auto-mode-alist))

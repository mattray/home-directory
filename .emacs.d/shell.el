;; SHELL
(prefer-coding-system 'utf-8)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'sh-mode-hook (setq sh-basic-offset 2 sh-indentation 2))

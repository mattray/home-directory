;; SHELL
;; Don't echo passwords when communicating with interactive programs:
;; (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;; color output
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; clean up shell output by stripping ctrl-m
;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; suppress shell echoes
;; (defun my-comint-init ()
;;   (setq comint-process-echoes t))
;; (add-hook 'comint-mode-hook 'my-comint-init)

;; custom variables
(custom-set-variables
 '(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 '(ansi-color-names-vector
   ["black" "olive drab" "green1" "yellow3" "blue2" "magenta3" "cyan3" "gray90"])
 )

(add-hook 'sh-mode-hook (setq sh-basic-offset 2 sh-indentation 2))

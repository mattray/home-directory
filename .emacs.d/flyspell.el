;;; Flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq ispell-program-name "/opt/homebrew/bin/ispell") ;; installed with brew
(defun turn-on-flyspell ()
  "Unconditionally turn on Flyspell mode."
  (flyspell-mode 1))
;;(add-hook 'markdown-mode-hook 'flyspell-buffer)
(add-hook 'markdown-mode-hook 'flyspell-mode)
;;(add-hook 'text-mode-hook 'flyspell-buffer)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

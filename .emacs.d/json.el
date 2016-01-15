;; JSON
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq auto-mode-alist (cons '("\\.json$" . js2-mode) auto-mode-alist))
;; beautify JSON https://coderwall.com/p/66juua
(defun beautify-json ()
  "Beautifies any region containing valid JSON data, using Python"
  (interactive)
  (when (use-region-p)
    (let (buf)
      (shell-command-on-region (mark) (point)
                               "python -m json.tool"
                               (current-buffer) t t))))

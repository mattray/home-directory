;;; showoff-mode.el --- Major mode to edit showoff presentation files in Emacs

;; Copyright (C) 2010 Nick Parker

;; Version 0.1.0
;; Keywords: showoff presentation major mode
;; Author: Nick Parker <nickp@developernotes.com>
;; URL: http://github.com/developernotes/showoff-mode

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary

;; For commentary please see the README.org or
;; http://github.com/developernotes/showoff-mode#readme

;;; Installation

;; In your shell:

;;     $ cd ~/.emacs.d/site-lisp
;;     $ git clone git://github.com/developernotes/showoff-mode.git

;; In your emacs config:

;;     (add-to-list 'load-path "~/.emacs.d/site-lisp/showoff-mode")
;;     (require 'showoff-mode)
;;     (add-to-list 'auto-mode-alist '("\\.md$" . showoff-mode))

;;; Thanks

(require 'font-lock)
(require 'cl)
(require 'markdown-mode)

(defconst showoff-mode-version "0.1.0"
  "The version of this `showoff-mode'.")

(defgroup showoff nil
  "A showoff major mode."
  :group 'tools)

(defcustom showoff-serve-buffer-name "*showoff-serve*"
  "The name of the buffer used for serving a showoff presentation"
  :type 'string
  :group 'showoff)

(defcustom showoff-browse-url "http://localhost:9090"
  "The default URL to view the showoff presentation"
  :type 'string
  :group 'showoff)

(defcustom showoff-manifest-file "showoff.json"
  "The manifest file for the showoff presentation"
  :type 'string
  :group 'showoff)

(defcustom showoff-default-folder "one"
  "The name of the default presentation folder"
  :type 'string
  :group 'showoff)

(defcustom showoff-default-file "01_slide.md"
  "The name of the default presentation file"
  :type 'string
  :group 'showoff)

(defvar showoff-use-file-cache t
  "Should `showoff-goto-file' keep a local cache of files?")

(defvar showoff-project-files '()
  "Used internally to cache the files in a project.")

(defvar showoff-completing-function-alist '((ido ido-completing-read)
                                              (icicles  icicle-completing-read)
                                              (none completing-read))
  "The function to call to read file names from the user")

(defvar showoff-completing-library 'ido
  "The library `showoff-goto-file' should use for
completing filenames (`ido' by default)")

(defvar showoff-mode-map (make-keymap)
  "Keymap for showoff major mode.")

(defun showoff-add-slide (slide)
  "Inserts a new slide at the given point"
  (interactive "s Name of slide: ")
  (insert (format "!SLIDE\n# %s #" slide)))

(defun showoff-view-manifest ()
  "View the manifest file for the showoff presentation"
  (interactive)
  (find-file (concat (showoff-root) showoff-manifest-file)))

(defun showoff-serve ()
  "Starts an HTTP server to run the presentation"
  (interactive)
  (save-excursion
    (let ((root (showoff-root)))
      (if root
          (progn
            (cd root)
            (async-shell-command "showoff serve" showoff-serve-buffer-name))))))

(defun showoff-view-presentation ()
  "Open browser to view the presentation"
  (interactive)
  (if (get-buffer showoff-serve-buffer-name)
      (browse-url showoff-browse-url)
    (progn
      (showoff-serve)
      (browse-url showoff-browse-url))))

(defun showoff-create-presentation (project directory)
  "Creates a new showoff presentation"
  (interactive "s Name of project: \nD Directory to create showoff presentation: ")
  (cd directory)
  (shell-command-to-string (format "showoff create %s" project))
  (find-file (format "%s/%s/%s/%s" directory project showoff-default-folder showoff-default-file)))

(defun showoff-goto-file ()
  "Uses your completing read to quickly jump to a showoff file in a project"
  (interactive)
  (let ((root (showoff-root)))
    (find-file
     (concat
      (showoff-completing-read
       "Find file: "
       (showoff-cached-project-files root))))))

(defun showoff-cached-project-files (&optional root)
  "Finds and caches all files in a given project."
  (cond
   ((null showoff-use-file-cache) (showoff-project-files root))
   ((equal (showoff-root) (car showoff-project-files))
    (cdr showoff-project-files))
   (t (cdr (setq showoff-project-files
                 `(,root . ,(showoff-project-files root)))))))

(defun showoff-project-files (root)
  "Finds all files in a given project."
  (split-string
   (shell-command-to-string (format "find %s -name \"*.md\" -type f" root))
   "\n" t))

(defun showoff-completing-read (&rest args)
  "Uses `showoff-completing-function-alist' to call the appropriate completing
function."
  (let ((reading-fn
         (cadr (assoc showoff-completing-library
                      showoff-completing-function-alist))))
    (apply (symbol-function reading-fn) args)))

(defun showoff-root ()
  (let ((root (locate-dominating-file default-directory showoff-manifest-file)))
    (if root
        (expand-file-name root)
      (message "You don't appear to be in a showoff directory.") nil)))

(define-derived-mode showoff-mode markdown-mode
  "showoff-mode"
  "Major mode for editing showoff presentations...")

(define-key showoff-mode-map (kbd "C-c ;a") 'showoff-add-slide)
(define-key showoff-mode-map (kbd "C-c ;m") 'showoff-view-manifest)
(define-key showoff-mode-map (kbd "C-c ;s") 'showoff-serve)
(define-key showoff-mode-map (kbd "C-c ;v") 'showoff-view-presentation)
(define-key showoff-mode-map (kbd "C-c ;f") 'showoff-goto-file)

(provide 'showoff-mode)

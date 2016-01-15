;; RUBY
;; https://github.com/zenspider/enhanced-ruby-mode
;; 'gem install rubocop ruby-lint' for flycheck
;; ruby-rubocop (syntax and style check using RuboCop)
;; ruby-rubylint (syntax and style check using ruby-lint)
(add-to-list 'load-path "~/.emacs.d/elpa/enh-ruby-mode-20151123.141"); must be added after any path containing old ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Kitchenfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile*" . enh-ruby-mode))

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)
(setq ruby-deep-indent-paren nil)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
;; do overlay
(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
(setq ruby-block-highlight-toggle t)

(global-set-key "\M-pd" "require 'pry'
binding.pry
")

;; (add-hook 'ruby-enh-mode-hook
;;           (lambda () (linum-mode t)))
(defun senny-ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))
(eval-after-load 'enh-ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)))

;; custom variables
(custom-set-variables
 '(flycheck-chef-foodcritic-executable "/usr/local/bin/foodcritic")
 '(flycheck-ruby-rubocop-executable "/usr/local/bin/rubocop")
 '(flycheck-ruby-rubylint-executable "/usr/local/bin/ruby-lint")
 )

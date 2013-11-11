(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Grab the following packages if not already installed
(defvar my-packages '(nrepl
                      projectile
                      eldoc
                      paredit
                      clojure-mode
                      rainbow-delimiters
		      color-theme-solarized))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)))

;;When uncommented, it gets rid of syntax highlighting:
;;(add-to-list 'auto-mode-alist '("\\.org\\" . org-mode))

;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cb" 'org-iswitch)
(setq org-log-done 'time)

(global-linum-mode)

;; Enable projectile globally
(require 'projectile)
(projectile-global-mode)

;; Highlight Parentheses
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; Enable ElDoc in Clojure buffers
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(load-theme 'solarized-light t)

;; Load the path in which you store rbenv
;; (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))

;;(setq line-number-display-limit-width 15)

;; Remove the default splash screen
(setq inhibit-startup-message t)
;; Don't add any comments to the *scratch* buffer
(setq initial-scratch-message nil)

;; Need the following to have the sass executable available for use
;; with scss mode
(setq scss-sass-command "~/bin/sass")

;; Require text files end in a newline
(setq require-final-newline 't)

;; Autoload the scss-mode file
(add-to-list 'load-path (expand-file-name "~/.emacs.d/modes/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(require 'clojure-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For better indentation for Compojure macros
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)

  ;; For better indentation of speclj
  (it 'defun)
  (describe 'defun)
  (context 'defun))

;; 'Always 2 spaces' indentation
(setq clojure-defun-style-default-indent t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SML Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add the SML/NJ directory to the Emacs path
(setenv "PATH" (concat "/usr/local/Cellar/smlnj/110.75/libexec/bin:"
                       (getenv "PATH")))
(setq exec-path (cons "/usr/local/Cellar/smlnj/110.75/libexec/bin" exec-path))

;; Have Emacs automatically place the buffer in SML mode whenever it sees
;; a file containing the .sml extension
(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))

(defun sml-mode-hook-defaults ()
  "Global defaults for SML mode"
  (setq sml-indent-level 4) ; indent level should be 4
  (setq indent-tabs-mode nil) ; never indent with tabs
  ; Bind the key C-c C-s to M-x sml-run
  (define-key sml-run "\C-c\C-s" 'sml-run))

(defun inferior-sml-mode-hook-defaults ()
  "Global defaults for the SML buffer"
  (define-key inferior-sml-mode-map "\C-cd" 'sml-prog-proc-chdir))

(add-hook 'sml-mode-hook 'sml-mode-hook-defaults)

(defun inf-sml-mode-hook-defaults ()
  "Local defaults for inferior SML mode"
  (define-key inferior-sml-mode-map "\C-cd" 'sml-cd))

;; Set defaults when loading SML files
(add-hook 'sml-mode-hook 'sml-mode-hook-defaults)
(add-hook 'inferior-sml-mode-hook 'inferior-sml-mode-hook-defaults)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ParEdit Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turning on Paredit mode
(defun enable-paredit () (paredit-mode t))

;; Paredit hooks
(add-hook 'clojure-mode-hook 'enable-paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ElDoc Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Requiring ElDoc
(require 'eldoc)
;; Make ElDoc aware of ParEdit's most used commands
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

(set-frame-font "Menlo-16")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#708183"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

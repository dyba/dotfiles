(require 'package)

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(defalias 'pi 'package-install)
(defalias 'pl 'package-list-packages)

;; Grab the following packages if not already installed
(defvar my-packages
  '(pkg-info
    dash
    
    auto-complete

    company
    company-inf-ruby
    slime-company
    company-ghci
    
    ;; Helm extensions
    helm-flyspell
    
    neotree
    
    projectile
    eldoc
    paredit
    rainbow-delimiters
    helm
    helm-git
    helm-ack
    helm-projectile
    perspective
    web-mode
    magit
    
    ;; JavaScript packages
    js-comint
    js2-mode
    ac-js2
    tern
    tern-auto-complete
    
    ;; CSS packages
    sass-mode
    
    ;; Ruby packages
    rbenv
    enh-ruby-mode
    robe
    inf-ruby
    ruby-tools
    yard-mode
    
    ;; Rust packages
    rust-mode

    ;; Common Lisp packages
    slime
    
    ;; Clojure packages
    clojure-mode
    clj-refactor
    clojure-mode-extra-font-locking
    ac-cider
    cider
    midje-mode

    ;; Erlang packages
    edts
    
    ;; Haskell packages
    haskell-mode
    ghc
    company-ghc

    ;; Themes
    color-theme-sanityinc-solarized
    zenburn-theme

    ;; Clojure packages
    clojure-mode

    tuareg    
    zencoding-mode
    dockerfile-mode
    racket-mode
    feature-mode
    coffee-mode
    elixir-mode))

(defvar pinned-packages
  '(
    ;; Elixir
    alchemist

    smartparens
    ))

(dolist (pkg pinned-packages)
  (add-to-list 'package-pinned-packages `(',pkg "melpa-stable") t))

(dolist (p (append my-packages pinned-packages))
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun shell-command-to-string-no-newline (command)
  "Returns the output of COMMAND as a string, stripping the newline character"
  (replace-regexp-in-string "\n$" "" (shell-command-to-string command)))

(defun program-exists-p (program)
  "Checks if PROGRAM is installed.
  A PROGRAM is considered `installed` if there is a path to it. Otherwise, it's not
  installed."
  (let ((str (shell-command-to-string-no-newline (concat "type" " " program))))
    (and (string-match (concat program " is ") str) t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto Completion Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete)

(add-to-list 'ac-modes #'enh-ruby-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq column-number-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done 'time)

(global-linum-mode)
(column-number-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FlySpell Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; Neotree Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'neotree)

(global-set-key "\C-xn" 'neotree-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight Parentheses Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'paren)

(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Window Movement Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)

;; when cursor is on edge, move to the other side, as in toroidal
;; space
(setq windmove-wrap-around t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sass Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'sass-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elixir Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'elixir-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Alchemist Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'alchemist)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web-mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))

(defun web-mode-config ()
  "Custom hooks for web-mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t))

(add-hook 'web-mode-hook 'web-mode-config)
(add-hook 'web-mode-hook (lambda () (auto-complete-mode 1)))
(add-to-list 'auto-mode-alist '("\\.xml.erb" . web-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(setq magit-last-seen-setup-instructions "1.4.0")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enhanced Ruby Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'enh-ruby-mode)

(add-hook 'enh-ruby-mode-hook #'robe-mode)
(add-hook 'enh-ruby-mode-hook #'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook #'ruby-tools-mode)
(add-hook 'enh-ruby-mode-hook #'yard-mode)
(add-hook 'enh-ruby-mode-hook (lambda () (global-rbenv-mode)))

(defvar ruby-extns
  '("\\.rb$"
    "\\.rake$"
    "Rakefile$"
    "\\.gemspec$"
    "Vagrantfile"
    "\\.ru$"
    "Gemfile$")
  "A collection of regular expressions to match extensions for Ruby files")

(dolist ((extn ruby-extns))
  (add-to-list 'auto-mode-alist '(extn . enh-ruby-mode)))

(setq enh-ruby-hanging-brace-indent-level 2)
(setq enh-ruby-bounce-deep-indent t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rbenv Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rbenv)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby Tools Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ruby-tools)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ZenCoding Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'zencoding-mode)

(add-hook 'sgml-mode-hook 'zencoding-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'inf-haskell)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JavaScript Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook (lambda () (auto-complete-mode)))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(require 'js-comint)

;; Make sure you have rhino installed: brew install rhino
(setq inferior-js-program-command "rhino")

(add-hook 'js2-mode-hook
	  '(lambda ()
	     (local-set-key "\C-x\C-e" 'js-send-last-sexp)
	     (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
	     (local-set-key "\C-cb" 'js-send-buffer)
	     (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
	     (local-set-key "\C-cl" 'js-load-file-and-go)))

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\[[0-9]+[A-Z]" "" output)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tern Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Coq Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/usr/local/opt/coq/lib/emacs/site-lisp")

(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ProofGeneral Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-file "~/.emacs.d/vendor/ProofGeneral/generic/proof-site.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tuareg Mode Configuration (For OCaml)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tuareg)

(setq auto-mode-alist 
      (append '(("\\.ml[ily]?$" . tuareg-mode))
	      auto-mode-alist))

;; -- Tweaks for OS X -------------------------------------
;; Tweak for problem on OS X where Emacs.app doesn't run the right
;; init scripts when invoking a sub-shell
(cond
 ((eq window-system 'ns) ; macosx
  ;; Invoke login shells, so that .profile or .bash_profile is read
  (setq shell-command-switch "-lc")))

;; -- opam and utop setup --------------------------------
;; Setup environment variables using opam
;; The following simpler alternative works as of opam 1.1
(dolist
   (var (car (read-from-string
	      (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))
;; Update the emacs path
(setq exec-path (split-string (getenv "PATH") path-separator))
;; Update the emacs load path
(push (concat (getenv "OCAML_TOPLEVEL_PATH")
	      "/../../share/emacs/site-lisp") load-path)
;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SmartParens Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'smartparens-config)

(smartparens-global-mode)
(smartparens-strict-mode)

(defvar custom-smartparens-mapping
  '(("C-M-f" . sp-forward-sexp)
    ("C-M-b" . sp-backward-sexp)
    
    ("C-M-d" . sp-down-sexp)
    ("C-M-a" . sp-backward-down-sexp)
    
    ("C-S-d" . sp-beginning-of-sexp)
    ("C-S-a" . sp-end-of-sexp)
    
    ("C-M-e" . sp-up-sexp)
    ("C-M-u" . sp-backward-up-sexp)
    ("C-M-t" . sp-transpose-sexp)
    
    ("C-M-n" . sp-next-sexp)
    ("C-M-p" . sp-previous-sexp)
    
    ("C-M-k" . sp-kill-sexp)
    ("C-M-w" . sp-copy-sexp)
    
    ("M-<delete>" . sp-unwrap-sexp)
    ("M-<backspace>" . sp-backward-unwrap-sexp)
    
    ("C-<right>" . sp-forward-slurp-sexp)
    ("C-<left>" . sp-forward-barf-sexp)
    ("C-M-<left>" . sp-backward-slurp-sexp)
    ("C-M-<right>" . sp-backward-barf-sexp)
    
    ("M-D" . sp-splice-sexp)
    ("C-M-<delete>" . sp-splice-sexp-killing-forward)
    ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
    ("C-S-<backspace>" . sp-splice-sexp-killing-around)
    
    ("C-]" . sp-select-next-thing-exchange)
    ("C-<left_bracket>" . sp-select-previous-thing)
    ("C-M-]" . sp-select-next-thing)
    
    ("M-F" . sp-forward-symbol)
    ("M-B" . sp-backward-symbol)))

(dolist (item custom-smartparens-mapping)
  (define-key smartparens-mode-map (kbd (car item)) (cdr item)))

(dolist ((hook '(emacs-lisp-mode-hook
		 clojure-mode-hook
		 scheme-mode-hook
		 inferior-lisp-mode-hook
		 slime-repl-mode-hook
		 cider-repl-mode-hook
		 cider-mode-hook
		 eval-expression-minibuffer-setup-hook
		 lisp-mode-hook)))
  (add-hook hook 'turn-on-smartparens-strict-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure Mode Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'clojure-mode)

(require 'clojure-mode-extra-font-locking)

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
  (context 'defun)
  
  ;; For better indentation when using midje
  (fact 'defun)
  (facts 'defun)
  (fact-group 'defun))


(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Midje Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'midje-mode)

(add-hook 'clojure-mode-hook #'midje-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clj Refactor Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'clj-refactor)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (clj-refactor-mode 1)
	    (cljr-add-keybindings-with-prefix "C-c C-r")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'helm-config)
(require 'helm)

(helm-autoresize-mode t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

(when (executable-find "ack")
  (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
	helm-grep-default-recurse-command "ack -Hn --no-group --no-color %e %p %f"))

(setq helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cider Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable ElDoc in Clojure buffers
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

;; log communication with the nREPL server
(setq nrepl-log-messages)

;; hide *nrepl-connection* and *nrepl-server* buffers from C-x b
(setq nrepl-hide-special-buffers t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'projectile)

(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)

;;(helm-projectile-on)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Perspective Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'perspective)

(persp-mode)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common Lisp Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl-lib)

(defun enable-electric-return ()
  (local-set-key (kbd "RET") 'electrify-return-if-match))

(add-hook 'lisp-mode-hook #'enable-electric-return)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scheme Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'scheme-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Slime Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inferior-lisp-program (shell-command-to-string-no-newline "which clisp"))
(setq slime-contribs '(slime-fancy))

(add-hook 'slime-repl-mode-hook #'enable-electric-return)
(add-hook 'slime-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'inferior-lisp-mode-hook #'enable-electric-return)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ElDoc Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Requiring ElDoc
(require 'eldoc)

;; Make ElDoc aware of ParEdit's most used commands
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

(defun enable-eldoc-defaults ()
  (turn-on-eldoc-mode)
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round))

;; Adding Electric Return
(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\" return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match` then open and indent an empty line between the cursor and the text. Move the cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(defun enable-lisp-defaults ()
  ;;(paredit-mode t)
  (turn-on-eldoc-mode)
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round)
  (local-set-key (kbd "RET") 'electrify-return-if-match)
  (eldoc-add-command 'electrify-return-if-match)
  ;;(show-paren-mode t)
  )

(add-hook 'emacs-lisp-mode-hook #'enable-lisp-defaults)
(add-hook 'clojure-mode-hook #'enable-lisp-defaults)

(set-frame-font "Menlo-16")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#708183" "#c60007" "#728a05" "#a57705" "#2075c7" "#c61b6e" "#259185" "#042028"))
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("a444b2e10bedc64e4c7f312a737271f9a2f2542c67caa13b04d525196562bf38" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "282606e51ef2811142af5068bd6694b7cf643b27d63666868bc97d04422318c1" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(fci-rule-color "#0a2832")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c60007")
     (40 . "#bd3612")
     (60 . "#a57705")
     (80 . "#728a05")
     (100 . "#259185")
     (120 . "#2075c7")
     (140 . "#c61b6e")
     (160 . "#5859b7")
     (180 . "#c60007")
     (200 . "#bd3612")
     (220 . "#a57705")
     (240 . "#728a05")
     (260 . "#259185")
     (280 . "#2075c7")
     (300 . "#c61b6e")
     (320 . "#5859b7")
     (340 . "#c60007")
     (360 . "#bd3612"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'zenburn)

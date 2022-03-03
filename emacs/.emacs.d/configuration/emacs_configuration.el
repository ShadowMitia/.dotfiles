(when (< emacs-major-version 27)
	  (require 'package)
	  (package-initialize)
	  ;; Add MELPA repo
	  (setq package-enable-at-startup nil)
	  (add-to-list 'package-archives
		       '("melpa" . "https://melpa.org/packages/"))
	  )

	(when (>= emacs-major-version 27)
	  (setq package-enable-at-startup nil))


	(set-language-environment "UTF-8")

	(menu-bar-mode -1)
	(toggle-scroll-bar -1)
	(tool-bar-mode -1)



	;; Bootstrap `use-package`
	;; (unless (package-installed-p 'use-package)
	;;   (package-refresh-contents)
	;;   (package-install 'use-package))


	;; Boostrap `streight.el`
	(defvar bootstrap-version)
	(let ((bootstrap-file
	       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
	      (bootstrap-version 5))
	  (unless (file-exists-p bootstrap-file)
	    (with-current-buffer
		(url-retrieve-synchronously
		 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
		 'silent 'inhibit-cookies)
	      (goto-char (point-max))
	      (eval-print-last-sexp)))
	  (load bootstrap-file nil 'nomessage))

	(straight-use-package 'use-package) ;; Install use-package

	(setq straight-use-package-by-default t)

	;; Always have the packages installed and ready to be used
	(setq use-package-always-ensure t)

	;; (use-package auto-package-update
	;;   :config
	;;   (setq auto-package-update-delete-old-versions t)
	;;   (setq auto-package-update-hide-results t)
	;;   (auto-package-update-maybe))

	(use-package nano-theme)
	(nano-mode)
	(nano-dark)

	(use-package nano-modeline)
	(nano-modeline-mode)


	(setq inhibit-startup-screen t)

	;; ;; (use-package spacemacs-common
	;; ;;     :ensure spacemacs-theme
	;; ;;     :init (load-theme 'spacemacs-dark t))

	(use-package magit
	  :bind ("C-x g" . magit-status))

	 (use-package magit-gerrit
	  :config
	  (setq-default magit-gerrit-remote "gerrit")
	   )

	(use-package git-gutter
	  :config
	  (global-git-gutter-mode 't))

	(use-package lsp-mode
	  :hook ((prog-mode . lsp))
	  :config
	  (setq lsp-completion-provider :capf)
	  (setq lsp-completion-enable t)
	  (setq  lsp-lens-enable t)
	  (setq read-process-output-max (* 2048 4096))
	  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))
	  :commands lsp
	  )

	(use-package lsp-ui :commands lsp-ui-mode)

	(use-package company
	  :init (global-company-mode)
	  :config
	  (setq company-idle-delay 0.0)
	  (setq company-minimum-prefix-length 1)
	  (setq lsp-idle-delay 0.1)
	  )

	(use-package company-box
	  :hook (company-mode . company-box-mode)
	  :custom
	  (company-box-max-candidates 50)
	  (company-box-show-single-candidate 'always))

	(use-package flycheck
	  :config
	  (add-hook 'after-init-hook 'global-flycheck-mode)
	  (add-to-list 'flycheck-checkers 'proselint)
	  (setq-default flycheck-highlighting-mode 'lines)
	  ;; Define fringe indicator / warning levels
	  (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
	    (vector #b00000000
		    #b00000000
		    #b00000000
		    #b00000000
		    #b00000000
		    #b00000000
		    #b00000000
		    #b00011100
		    #b00111110
		    #b00111110
		    #b00111110
		    #b00011100
		    #b00000000
		    #b00000000
		    #b00000000
		    #b00000000
		    #b00000000))
	  (flycheck-define-error-level 'error
	    :severity 2
	    :overlay-category 'flycheck-error-overlay
	    :fringe-bitmap 'flycheck-fringe-bitmap-ball
	    :fringe-face 'flycheck-fringe-error)
	  (flycheck-define-error-level 'warning
	    :severity 1
	    :overlay-category 'flycheck-warning-overlay
	    :fringe-bitmap 'flycheck-fringe-bitmap-ball
	    :fringe-face 'flycheck-fringe-warning)
	  (flycheck-define-error-level 'info
	    :severity 0
	    :overlay-category 'flycheck-info-overlay
	    :fringe-bitmap 'flycheck-fringe-bitmap-ball
	    :fringe-face 'flycheck-fringe-info))

	(use-package flycheck-rust
	  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
	  )

	(use-package flycheck-clang-tidy
	  :config '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

	(use-package rust-mode :disabled)

	(use-package rustic
	  :after (rust-mode)
	  :mode ("\\.rs\\'" . rustic-mode)
	  :bind
	  ("C-c C-c" . rustic-compile)
	  :config
	  (setq indent-tabs-mode nil)
	  (setq rustic-format-on-save t)
	  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
	  (setq rustic-flycheck-clippy-params "--message-format=json")
	  (add-to-list 'company-backends
		       '(company-rust :with company-capf))
	  :commands rustic-mode
	  )

	(use-package cargo
	  :hook (rustic-mode . cargo-minor-mode)
	  :diminish cargo-minor-mode)

	(use-package smartparens
	  :config
	  (add-hook 'prog-mode-hook 'smartparens-mode))

	(use-package rainbow-delimiters
	  :config
	  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

	(use-package rainbow-mode
	  :config
	  (setq rainbow-x-colors nil)
	  (add-hook 'prog-mode-hook 'rainbow-mode))

	(use-package org
	  :init
	  (org-babel-do-load-languages
	   'org-babel-load-languages
	   '(
	     (emacs-lisp . t)
	     (org . t)
	     (shell . t)
	     (C . t)
	     (python . t)
	     (css . t)
	     (ocaml . t)
	     (latex . t)
	     (dot . t)
	     (ditaa . t)
	     (makefile . t)
	     (processing .t)
	     (sql . t)
	     (sqlite . t)
	     ))

	  :config
	  (setq org-src-fontify-natively t)
	  (setq org-src-tab-acts-natively t)
	  (setq org-directory "~/kDrive/dropbox/org/")
	  )

	(use-package dap-mode) 

	(use-package yasnippet)

	(with-eval-after-load 'lsp-mode
	  (require 'dap-cpptools)
	  (yas-global-mode))

	(setq gc-cons-threshold (* 100 1024 1024)
	      read-process-output-max (* 1024 1024)
	      treemacs-space-between-root-nodes nil
	      company-idle-delay 0.0
	      company-minimum-prefix-length 2
	      lsp-idle-delay 1)  ;; clangd is fast


	(use-package multiple-cursors
	  :config
	  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
	  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
	  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
	  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

	(use-package unicode-fonts
	  :ensure t
	  :config
	  (unicode-fonts-setup))

      ;; Emoji: 😄, 🤦, 🏴󠁧󠁢󠁳󠁣󠁴󠁿
    (set-fontset-font t 'symbol "Apple Color Emoji")
    (set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
    (set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
    (set-fontset-font t 'symbol "Symbola" nil 'append)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

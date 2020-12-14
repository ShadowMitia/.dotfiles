

(set-language-environment "UTF-8")

(require 'package)

(when (< emacs-major-version 27)
  (package-initialize))

(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Always havve the packages installed and ready to be used
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package nano
  :load-path "nano-emacs"
  :init
  
  ;; Window layout (optional)
  (require 'nano-layout)

  ;; Theming Command line options (this will cancel warning messages)
  (add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
  (add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
  (add-to-list 'command-switch-alist '("-default"  . (lambda (args))))

  (cond
   ((member "-default" command-line-args) t)
   ((member "-dark" command-line-args) (require 'nano-theme-dark))
   (t (require 'nano-theme-light)))

  ;; Customize support for 'emacs -q' (Optional)
  ;; You can enable customizations by creating the nano-custom.el file
  ;; with e.g. `touch nano-custom.el` in the folder containing this file.
  (let* ((this-file  (or load-file-name (buffer-file-name)))
         (this-dir  (file-name-directory this-file))
         (custom-path  (concat this-dir "nano-custom.el")))
    (when (and (eq nil user-init-file)
               (eq nil custom-file)
               (file-exists-p custom-path))
      (setq user-init-file this-file)
      (setq custom-file custom-path)
      (load custom-file)))

  ;; Theme
  (require 'nano-faces)
  (nano-faces)

  (require 'nano-theme)
  (nano-theme)

  (require 'nano-theme-dark)
  
  ;; Nano default settings (optional)
  (require 'nano-defaults)

  ;; Nano session saving (optional)
  (require 'nano-session)

  ;; Nano header & mode lines (optional)
  (require 'nano-modeline)

  ;; Nano key bindings modification (optional)
  (require 'nano-bindings)

  ;; Nano counsel configuration (optional)
  ;; Needs "counsel" package to be installed (M-x: package-install)
  ;; (require 'nano-counsel)

  ;; Welcome message (optional)
  (let ((inhibit-message t))
    (message "Welcome to GNU Emacs / N Λ N O edition")
    (message (format "Initialization time: %s" (emacs-init-time))))

  ;; Splash and help (optional)
  (add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
  (unless (member "-no-splash" command-line-args)
    (require 'nano-help)
    (require 'nano-splash))
  )



(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)

(setq gc-cons-threshold 100000000)

;; (use-package spacemacs-common
;;     :ensure spacemacs-theme
;;     :init (load-theme 'spacemacs-dark t))


(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package magit)

(use-package lsp-mode
  :hook (rustic-mode . lsp)
  :config
  (setq lsp-completion-provider :capf)
  (setq lsp-completion-enable t)
  (setq read-process-output-max (* 2048 4096))
  :commands lsp
  )

(use-package company
  :init (global-company-mode)
  )

(use-package lsp-ui :commands lsp-ui-mode)

(use-package flycheck
  :init (global-flycheck-mode)
  )

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )

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

(use-package paren
  :init (show-paren-mode)
  :config
  (setq show-paren-delay 0)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(show-paren-mode paren-mode cargo rustic flycheck-rust flycheck lsp-mode magit company-box spacemacs-theme auto-package-update use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

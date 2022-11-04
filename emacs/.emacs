;;; init.el --- Emacs entry point  -*- lexical-binding: t; -*-

(setq-default vc-follow-symlinks t)

;; (debug-on-entry 'package-initialize)
(require 'org)

(setq emacs_config_file (concat user-emacs-directory "../.dotfiles/emacs/.emacs.d/configuration/emacs_configuration.org"))

(org-babel-tangle-file emacs_config_file)

(org-babel-load-file (expand-file-name emacs_config_file user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

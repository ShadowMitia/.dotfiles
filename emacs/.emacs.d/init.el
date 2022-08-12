;;; init.el --- Emacs entry point  -*- lexical-binding: t; -*-

(setq-default vc-follow-symlinks t)

;; (debug-on-entry 'package-initialize)
(require 'org)

(setq emacs_config_file (concat user-emacs-directory "configuration/emacs_configuration.org"))

(org-babel-tangle-file emacs_config_file)

(org-babel-load-file (expand-file-name emacs_config_file user-emacs-directory))

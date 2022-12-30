;;; init.el --- Emacs entry point
;;; -*- lexical-binding: t; -*-

;;; Follow links always (so it can follow dotfiles files)
(setq-default vc-follow-symlinks t
  package-native-compile t)

;; (debug-on-entry 'package-initialize)
;;; We need org-babel-tangle-file available
(require 'org)

(setq emacs_config_file (concat user-emacs-directory "../.dotfiles/emacs/.emacs.d/configuration/emacs_configuration.org"))
(setq emacs_config_file_el (concat user-emacs-directory "../.dotfiles/emacs/.emacs.d/configuration/emacs_configuration.el"))

(when (file-newer-than-file-p emacs_config_file emacs_config_file_el)
  (org-babel-tangle-file emacs_config_file)
  )

;;; (org-babel-load-file (expand-file-name emacs_config_file user-emacs-directory))
(load emacs_config_file_el)

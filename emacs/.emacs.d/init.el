(require 'org)
(setq vc-follow-symlinks t)
(org-babel-load-file
 (expand-file-name "emacs_configuration.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(writegood-mode expand-region rainbow-mode use-package spacemacs-theme smartparens rustic rainbow-delimiters magit lsp-ui git-gutter flycheck-rust company-box cargo auto-package-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

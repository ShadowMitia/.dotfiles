;; (debug-on-entry 'package-initialize)
(require 'org)
(org-babel-load-file
 (expand-file-name "configuration/emacs_configuration.org"
                   user-emacs-directory))

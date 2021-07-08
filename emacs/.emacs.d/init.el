(require 'org)
(setq vc-follow-symlinks t)
(set-language-environment "UTF-8")

(when (< emacs-major-version 27)
  (package-initialize))


;; Add MELPA repo
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Boostrap `quelpa`
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade))

  (quelpa
   '(quelpa-use-package
     :fetcher git
     :url "https://github.com/quelpa/quelpa-use-package.git"))
  (require 'quelpa-use-package)
  )

(eval-when-compile
  (require 'use-package))

;; Always havve the packages installed and ready to be used
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)

(setq gc-cons-threshold 100000000)

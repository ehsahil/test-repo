
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(setq-default neo-show-hidden-files t)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;
;; Setup puppet-mode for autoloading
;;
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(autopair-global-mode t)
 '(global-undo-tree-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (autopair undo-tree groovy-mode yaml-mode indent-tools terraform-mode wrap-region multiple-cursors)))
 '(show-paren-mode t)
 '(wrap-region-global-mode t nil (wrap-region)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-directory ((t (:foreground "brightcyan"))))
 '(minibuffer-prompt ((t (:foreground "white")))))
(global-linum-mode t)
(show-paren-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

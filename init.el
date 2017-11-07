
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq-default indent-tabs-mode nil)
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
 '(Buffer-menu-name-width 40)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(autopair-global-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("e7caf161142e749e495afaee7fc735a6f48e5addd8be097fe5288bbe1da68409" default)))
 '(global-undo-tree-mode t)
 '(highlight-indent-guides-auto-enabled t)
 '(ido-vertical-mode t)
 '(package-selected-packages
   (quote
    (flycheck-bashate dockerfile-mode flycheck-yamllint highlight-indent-guides ido-describe-bindings flymake-json flymake-puppet helm-mode-manager flx-ido ido-hacks ido-vertical-mode smex flycheck recover-buffers smooth-scrolling esxml puppet-mode js-auto-beautify go-autocomplete auto-complete go-mode exec-path-from-shell yaml-mode wrap-region undo-tree terraform-mode multiple-cursors indent-tools groovy-mode autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default")))))
(global-linum-mode t)
(show-paren-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(menu-bar-mode -1)
;;;;;;;;;;;;;;;;;;;;;;
;; go customization ;;
;;;;;;;;;;;;;;;;;;;;;;
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setenv "GOPATH" "/Users/joaqmendez/mygo/")
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; go autocomplete customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple cursors keybidings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c m e ") 'mc/edit-lines)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m i n") 'mc/insert-numbers)
(global-set-key (kbd "C-c m i l") 'mc/insert-letterss)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; toggle cursor at point ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'multiple-cursors)

(defun mc/toggle-cursor-at-point ()
  "Add or remove a cursor at point."
  (interactive)
  (if multiple-cursors-mode
      (message "Cannot toggle cursor at point while `multiple-cursors-mode' is active.")
    (let ((existing (mc/fake-cursor-at-point)))
      (if existing
          (mc/remove-fake-cursor existing)
        (mc/create-fake-cursor-at-point)))))

(add-to-list 'mc/cmds-to-run-once 'mc/toggle-cursor-at-point)
(add-to-list 'mc/cmds-to-run-once 'multiple-cursors-mode)

(global-set-key (kbd "C-i") 'mc/toggle-cursor-at-point)
;;(global-set-key (kbd "C-u") 'multiple-cursors-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; scroll line by line ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "ESC <up>") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "ESC <down>") (lambda () (interactive) (scroll-down 1)))

;;;;;;;;;;;;;;;;;;;;;
;; more ido for me ;;
;;;;;;;;;;;;;;;;;;;;;
(ido-mode 1)
(require 'ido-hacks nil t)					       
(if (commandp 'ido-vertical-mode) 				       
    (progn							       
      (ido-vertical-mode 1)					       
      (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))) 
(if (commandp 'smex)						       
    (global-set-key (kbd "M-x") 'smex))			       
(if (commandp 'flx-ido-mode)					       
    (flx-ido-mode 1))					       

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent highlihgt mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq highlight-indent-guides-auto-enabled t)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'puppet-mode-hook 'highlight-indent-guides-mode)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'yaml-mode-hook 'flycheck-mode)
(add-hook 'puppet-mode-hook 'flycheck-mode)
(setq highlight-indent-guides-method 'fill)
 (global-set-key [9] (quote indent-region))

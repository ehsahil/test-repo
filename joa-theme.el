(deftheme joa
  "Created 2017-03-21.")

(custom-theme-set-variables
 'joa
 '(package-selected-packages (quote (autopair undo-tree groovy-mode yaml-mode indent-tools terraform-mode wrap-region multiple-cursors)))
 '(autopair-global-mode t)
 '(global-undo-tree-mode t)
 '(menu-bar-mode nil)
 '(server-mode t)
 '(show-paren-mode t)
 '(wrap-region-global-mode t))

(custom-theme-set-faces
 'joa
 '(dired-directory ((t (:foreground "brightcyan"))))
 '(minibuffer-prompt ((t (:foreground "white")))))

(provide-theme 'joa)

;;; bats-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "bats-mode" "bats-mode.el" (23461 21851 0 0))
;;; Generated autoloads from bats-mode.el

(autoload 'bats-mode "bats-mode" "\
Major mode for editing and running Bats tests.

See URL `https://github.com/sstephenson/bats'.

\\{bats-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.bats\\'" . bats-mode))

;;;***

;;;### (autoloads nil nil ("bats-mode-pkg.el") (23461 21841 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; bats-mode-autoloads.el ends here

;;; recover-buffers-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "recover-buffers" "recover-buffers.el" (22796
;;;;;;  59572 0 0))
;;; Generated autoloads from recover-buffers.el

(let ((loads (get 'recover-buffers 'custom-loads))) (if (member '"recover-buffers" loads) nil (put 'recover-buffers 'custom-loads (cons '"recover-buffers" loads))))

(autoload 'recover-buffers "recover-buffers" "\
Like `recover-session', but visit all the buffers from the selected file.

Files whose names match `recover-buffers-skip-list' will not be visited.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("50recover-buffers.el" "recover-buffers-pkg.el")
;;;;;;  (22796 59572 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; recover-buffers-autoloads.el ends here

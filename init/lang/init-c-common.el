
;; Auto-detect others' files indent style
;; (require 'dtrt-indent)
;; (dtrt-indent-mode t)

(setq-default c-basic-offset 4)

(defun prf/main-c-mode-common-hook ()
  (c-set-style "linux")
  ;; Switch between header/source
  (local-set-key  (kbd "C-c o") 'ff-find-other-file)
  ;; C-d for deleting
  (local-set-key (kbd "C-d") 'duplicate-line-or-region)
  (setq comment-start "//"
	comment-end   ""))

(add-hook 'c-mode-common-hook 'prf/main-c-mode-common-hook)




(provide 'init-c-common)

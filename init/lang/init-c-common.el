
;; Auto-detect others' files indent style
;; (require 'dtrt-indent)
;; (dtrt-indent-mode t)

(defun prf/main-c-mode-common-hook ()
  ;; Switch between header/source
  (local-set-key  (kbd "C-c o") 'ff-find-other-file)
  ;; C-d for deleting
  (local-set-key (kbd "C-d") 'duplicate-line-or-region)
  ;; line numbers
  ;; (if (boundp display-line-numbers-mode)
  ;;     (display-line-numbers-mode 1)
  ;;   (linum-mode 1))
  (setq comment-start "//"
	comment-end   ""))

(defun prf/indentation-c-mode-common-hook ()
  (c-set-style "linux")
  (setq tab-width 4
	c-basic-offset 4))


(add-hook 'c-mode-common-hook 'prf/main-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'prf/indentation-c-mode-common-hook)


;; ------------------------------------------------------------------------
;; ECLIM

;; (require 'emacs-eclim))
;; (setq
;;  eclim-auto-save t
;;  eclim-executable "/opt/eclipse/juno/eclim")
;; (require 'eclim)
;; (require 'eclimd)
;; (global-eclim-mode)
;; NB: needs to be defined here, overwise it gets overriden by the above statements
;; (add-hook 'c-mode-common-hook
;; 	(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))


;; ------------------------------------------------------------------------

(provide 'init-c-common)

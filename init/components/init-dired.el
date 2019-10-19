
;; [[http://www.emacswiki.org/emacs/DiredTweaks]]
;; http://stackoverflow.com/questions/14602291/dired-how-to-get-really-human-readable-output-find-ls-option
;; http://stackoverflow.com/questions/4115465/emacs-dired-too-much-information




(defvar prf/dired-listing-switches "-alh")



;; DIRED

(use-package dired
  :ensure nil
  :demand
  :bind (
         :map dired-mode-map
	 ("C-c C" . prf/dired-do-copy-not-dwin)
	 ("C-c R" . prf/dired-do-rename-not-dwin)
         ;; do not create other dired buffers when navigating
         ;; TODO: far from being perfect (closes all dired windows, not just current)
	 ("<return>" . dired-find-alternate-file)
	 ("^" . (lambda () (interactive) (find-alternate-file ".."))))
  :custom
  (dired-recursive-copies 'always "Never prompt for recursive copies of a directory")
  (dired-recursive-deletes 'always "Never prompt for recursive deletes of a directory")
  :init
  (setq
   dired-dwim-target t	;; if other window -> set as default dir for copy
   ls-lisp-dirs-first t ;; display dirs 1st
   dired-listing-switches prf/dired-listing-switches
   diredp-hide-details-initially-flag nil
   diredp-hide-details-propagate-flag nil)

  (when (executable-find "busybox")
    (setq dired-use-ls-dired nil))

  :config
  (defun prf/dired-do-copy-not-dwin ()
    (interactive)
    (let ((dired-dwim-target nil))
      (dired-do-copy)))
  (defun prf/dired-do-rename-not-dwin ()
    (interactive)
    (let ((dired-dwim-target nil))
      (dired-do-rename)))

  (put 'dired-find-alternate-file 'disabled nil))



;; EXTRA FACES

(use-package dired+
  :quelpa (dired+ :fetcher github :repo "emacsmirror/dired-plus")
  :after (dired)
  :demand
  ;; :config
  ;; (eval-after-load "dired-aux"
  ;;     '(require 'dired-async))
  )

;; NB: alternative if we only wanted extra coloring https://github.com/purcell/diredfl



;; EXTRA COMMANDS

(use-package dired-rsync
  :after (dired)
  :config
  (bind-key "C-c C-r" 'dired-rsync dired-mode-map))
;; NB: alternative https://oremacs.com/2016/02/24/dired-rsync/


(use-package dired-git-info
  :bind (
         :map dired-mode-map
         (")" . dired-git-info-mode)))

;; BUG: doesn't work w/ dired+
(use-package dired-hide-dotfiles
  :disabled
  :bind (
         :map dired-mode-map
         ("M-." . dired-hide-dotfiles-mode)))




(provide 'init-dired)

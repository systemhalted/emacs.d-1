

(use-package prf-md-shiatsu
  :load-path "~/.emacs.d/plugins/prf-md-shiatsu"
  :config
  (defun prf/md-hook/enable-md-shiatsu-minor-mode ()
    (when (string-match-p (regexp-quote "shiatsu") default-directory)
      (when (executable-find "multimarkdown")
	(setq markdown-command (executable-find "multimarkdown")))
      (prf-md-shiatsu 1)))

  (add-hook 'markdown-mode-hook 'prf/md-hook/enable-md-shiatsu-minor-mode))


(provide 'init-md-org-shiatsu)

;; inspired by setup-cygwin package

(prf/require-plugin 'cygwin-mount)

;;; Make Cygwin paths accessible
(cygwin-mount-activate)

;;; Follow Cygwin symlinks.
;;; Handles old-style (text file) symlinks and new-style (.lnk file) symlinks.
;;; (Non-Cygwin-symlink .lnk files, such as desktop shortcuts, are still loaded as such.)
(defun follow-cygwin-symlink ()
  "Follow Cygwin symlinks.
Handles old-style (text file) and new-style (.lnk file) symlinks.
\(Non-Cygwin-symlink .lnk files, such as desktop shortcuts, are still
loaded as such.)"
  (save-excursion
    (goto-char 0)
    (if (looking-at
         "L\x000\x000\x000\x001\x014\x002\x000\x000\x000\x000\x000\x0C0\x000\x000\x000\x000\x000\x000\x046\x00C")
        (progn
          (re-search-forward
           "\x000\\([-A-Za-z0-9_\\.\\\\\\$%@(){}~!#^'`][-A-Za-z0-9_\\.\\\\\\$%@(){}~!#^'`]+\\)")
          (find-alternate-file (match-string 1)))
      (if (looking-at "!<symlink>")
          (progn
            (re-search-forward "!<symlink>\\(.*\\)\0")
            (find-alternate-file (match-string 1))))
      )))
(add-hook 'find-file-hooks 'follow-cygwin-symlink)


;;; Use Unix-style line endings.
;; (setq-default buffer-file-coding-system 'undecided-unix)

;;; Add Cygwin Info pages
(setq Info-default-directory-list (append Info-default-directory-list (list "c:/cygwin64/usr/info/")))

;;; Use `bash' as the default shell in Emacs.
;; (setq exec-path (cons "C:/cygwin/bin" exec-path))
;; (setq shell-file-name "C:/cygwin/bin/bash.exe") ; Subprocesses invoked via the shell.
;; (setenv "SHELL" shell-file-name)
;; (setenv "PATH" (concat (getenv "PATH") ";C:\\cygwin\\bin"))
;; (setq explicit-shell-file-name shell-file-name) ; Interactive shell
;; (setq ediff-shell shell-file-name)      ; Ediff shell
;; (setq explicit-shell-args '("--login" "-i"))
;;;;; (setq shell-command-switch "-ic") ; SHOULD THIS BE "-c" or "-ic"?
;; (setq w32-quote-process-args ?\") ;; " @@@ IS THIS BETTER? ;@@@ WAS THIS BEFORE: (setq w32-quote-process-args t)

(provide 'init-cygwin)
;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * FILE-MANAGEMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** RANGER-MOD CUSTOMIZATION
(use-package ranger
	:ensure t
	:defer t
	;; :config
	:bind (:map ranger-mode-map
							("r r" . ranger-refresh)
							("M-f" . avy-goto-word-1)
							("g g" . ranger-goto-top)
							("G G" . ranger-goto-bottom)
							("Z F F" . find-file-other-frame)
							("Z D D" . mkdir)
							("Z F I" . (lambda() (interactive)
													 (find-file-other-frame
														(expand-file-name
														 "INI/file-mng-cfg.el"
														 user-emacs-directory))))
							))

;; --------------------------------------
;; ** DIRED-MOD CUSTOMIZATION
(use-package dired
 ;; :config
	)
;; --------------------------------------
;; * GITS-MODs CUSTOMIZATION
;; --------------------------------------
;; ** MAGIT-MOD CUSTOMIZATION
(use-package magit
	:ensure t
	:defer t
	:bind (:map magit-status-mode-map
							("M-z M-z" . (lambda() (interactive)
														(setq buyn-magit-buff-name (buffer-name))
														(bury-buffer)))
							("n n" . (lambda() (interactive)
														(setq buyn-magit-buff-name (buffer-name))
														(bury-buffer)))
							("n f i" . (lambda() (interactive)
													 (find-file-other-frame
														(expand-file-name
														 "INI/file-mng-cfg.el"
														 user-emacs-directory))))

							("J J" . magit-display-repository-buffer)
							("J j" . magit-status-jump)
							("j" . magit-section-forward)

							("K K" . magit-file-untrack)
							("K k" . magit-discard)
							("k" . magit-section-backward)

							("p" . magit-push)

							;; ("<F9> m m" .
							("M-z M-m" .
							 (lambda() (interactive)
								 (magit-git-command
									"git checkout master;git merge experemental;git push;git checkout experemental")))
							))
;; --------------------------------------
;; *  --------------------------------------

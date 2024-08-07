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
							("g g" . ranger-goto-top)
							("G G" . ranger-goto-bottom)
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

							("J J" . magit-display-repository-buffer)
							("J j" . magit-status-jump)
							("j" . magit-section-forward)

							("K K" . magit-file-untrack)
							("K k" . magit-discard)
							("k" . magit-section-backward)

							;; ("<F9> m m" .
							("M-z M-m" .
							 (lambda() (interactive)
								 (magit-git-command
									"git checkout master;git merge experemental;git push;git checkout experemental")))
							))
;; --------------------------------------
;; *  --------------------------------------

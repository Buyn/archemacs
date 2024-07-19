;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * DEVELOPMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** AUTOCOMPLETE-MOD CUSTOMIZATION
;; (find-file-other-frame "~/INI/autocomplete-cfg.el")
(load "~/INI/autocomplete-cfg.el")
;; --------------------------------------
;; ** PROJECTILE CUSTOMIZATION
(use-package projectile
  :ensure t
  ;; :init
  ;; (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))
;; --------------------------------------
;; ** SNIPPETS-MOD CUSTOMIZATION
;; (find-file "~/INI/snippets-cfg.el")
(load "~/INI/snippets-cfg.el")
;; --------------------------------------
;; ** DELIMITERS-MOD CUSTOMIZATION
;; (find-file "~/INI/delimiters-cfg.el")
(load "~/INI/delimiters-cfg.el")
;; --------------------------------------
;; ** PYTHON-MOD CUSTOMIZATION
;; (find-file "~/INI/python-cfg.el") 
;; (find-file-other-frame "~/INI/python-cfg.el")
(load "~/INI/python-cfg.el")
;; --------------------------------------
;; ** LUA-MOD CUSTOMIZATION
;; --------------------------------------
;; (find-file "~/INI/lua-cfg.el")
(load "~/INI/lua-cfg.el")
;; --------------------------------------
;; ** AHK-MODE CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/INI/dev/autohotkey-cfg.el")
(load "~/INI/dev/autohotkey-cfg.el")
;; --------------------------------------
;; ** C#-MOD CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/csharp-cfg.el")
;; (load "~/INI/dev/csharp-cfg.el")
;; --------------------------------------
;; ** CLOJURE-MODE CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/clojure-cfg.el")
(load "~/INI/dev/clojure-cfg.el")
;; --------------------------------------
;; ** UNITY CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/unity-cfg.el")
(load "~/INI/dev/unity-cfg.el")
;; --------------------------------------
;; ** JS-MOD CUSTOMIZATION
;; (find-file-other-frame "~/INI/js-cfg.el") 
(load "~/INI/js-cfg.el")
;; --------------------------------------
;; ** FORMATS-MOD CUSTOMIZATION
;; (find-file-other-frame "~/INI/dev/formats-mods-cfg.el")
(load "~/INI/dev/formats-mods-cfg.el")
;; --------------------------------------
;; ** FLYCHECK CUSTOMIZATION
(load "~/INI/flycheck-cfg.el")
;; (find-file "~/INI/flycheck-cfg.el") 
;; --------------------------------------
;; ** DEVELOPMENT SETINGS CUSTOMIZATION
(setq compilation-scroll-output nil)
;; (defun my-compilation-finish-function (buffer desc)
;;   (message "Buffer %s: %s" buffer desc)
;; 	(evil-goto-first-line)
;; 	)
;; (add-to-list 'compilation-finish-functions 'my-compilation-finish-function)
;; ** DEVELOPMENT-KEY CUSTOMIZATION
;; *** save & recompile
;; **** global-set-key <f8> :
;;  --------------------------------------
(global-set-key(kbd "<f8>") '(lambda() (interactive)
				;; (save-buffer)
				(save-some-buffers 'no-confirm)
				(org-save-all-org-buffers)
				(evil-normal-state)
				(let ((curent-buffer (buffer-name)))
					(select-frame-by-name "*compilation*")
					(recompile)
					(select-frame-by-name curent-buffer))))				

;; (setq compilation-scroll-output nil)
;; (add-to-list 'compilation-finish-functions 'my-compilation-finish-function)
;;  --------------------------------------
;; **** global-set-key "M-<f8>" :
;;  --------------------------------------
(global-set-key(kbd "M-<f8>") '(lambda() (interactive)
								(save-buffer)
								(evil-normal-state)
								(compile
								 (read-string
										(concat
											"defult(" (buffer-name) "):")
										(buffer-file-name)
										nil
										(buffer-name)
										)
									)
								))
;; --------------------------------------
;; **** global-set-key "M-<f8>" :
;;  --------------------------------------
(define-key evil-visual-state-map (kbd "M-<f8>") '(lambda() (interactive)
								(setq region-text (buffer-substring (region-beginning) (region-end)))
								(save-buffer)
								(evil-normal-state)
								(compile
								 (read-string
										(concat
											"defult(" (buffer-name) "):")
										(concat
												(buffer-file-name)
												" -p "
												region-text
												)
										nil
										(buffer-name)
										)
									)
								))
;; --------------------------------------
;; *** --------------------------------------
;; ** PROG-MODE-HOOK CUSTOMIZATION
	(add-hook 'prog-mode-hook '(lambda ()
;; *** line-numbers-mode
		;; (setq display-line-numbers-mode t)
		(display-line-numbers-mode t)
;; *** highlight-indentation-mode : 
		(highlight-indentation-mode t)
;; *** projectile-mode : 
		(projectile-mode +1)
		(define-key evil-visual-state-map (kbd "M-e M-p M-o") '(lambda() (interactive)
					(projectile-multi-occur (buffer-substring (region-beginning) (region-end)))))
		(define-key evil-normal-state-map (kbd "M-e M-p M-o") 'projectile-multi-occur)

;; *** outshine-mode : 
		;; #'outshine-mode on in outshine cfg
		;; (find-file-other-frame "~/INI/outshine_cfg.el")
		;; (outshine-mode t)
		;; (outline-minor-mode t)
;; *** end prog-mode-hook
		))
;; --------------------------------------
;; *  --------------------------------------

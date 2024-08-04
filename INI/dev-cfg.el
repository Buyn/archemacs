;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * DEVELOPMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** PROJECTILE CUSTOMIZATION
(use-package projectile
  :ensure t
  ;; :init
  ;; (projectile-mode +1)
  :bind (
					:map projectile-mode-map
              ;; ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)
					:map evil-normal-state-map
							("ZPFF" . 'projectile-find-file-other-frame)
							("ZPFO" . 'projectile-find-other-file-other-frame)
							("ZPFR" . 'projectile-find-related-file-other-frame)
							("ZPFD" . 'projectile-find-file-dwim-other-frame)
							("ZPFT" . 'projectile-find-implementation-or-test-other-frame)
							("ZPFB" . 'projectile-switch-to-buffer-other-frame)
							("Zo" . 'projectile-switch-to-buffer-other-frame)
							("ZPTT" . 'projectile-find-test-file)
							("ZPTM" . 'projectile-find-matching-test)
							("ZPTC" . 'projectile-create-missing-test-files)
							("ZPTT" . 'projectile-test)
							("ZPDD" . 'projectile-dired-other-frame)
							("M-e M-p M-o" . 'projectile-multi-occur)
					:map evil-normal-state-map
							("M-e M-p M-o" . (lambda() (interactive)
					(projectile-multi-occur (buffer-substring (region-beginning) (region-end)))))
))

;; --------------------------------------
;; ** DELIMITERS-MOD CUSTOMIZATION
;; (find-file "~/.archemacs/INI/delimiters-cfg.el")
(load "~/.archemacs/INI/dev/delimiters-cfg.el")
;; --------------------------------------
;; ** PYTHON-MOD CUSTOMIZATION
;; (find-file "~/.archemacs/INI/python-cfg.el") 
;; (find-file-other-frame "~/.archemacs/INI/python-cfg.el")
(load "~/.archemacs/INI/dev/python-cfg.el")
;; --------------------------------------
;; ** LUA-MOD CUSTOMIZATION
;; --------------------------------------
;; (find-file "~/.archemacs/INI/lua-cfg.el")
(load "~/.archemacs/INI/dev/lua-cfg.el")
;; --------------------------------------
;; ** OUTSHINE-MOD CUSTOMIZATION
;; --------------------------------------
(load "~/.archemacs/INI/dev/outshine_cfg.el")
;; --------------------------------------
;; ** AHK-MODE CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/dev/autohotkey-cfg.el")
(load "~/.archemacs/INI/dev/autohotkey-cfg.el")
;; --------------------------------------
;; ** C#-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/csharp-cfg.el")
;; (load "~/.archemacs/INI/dev/csharp-cfg.el")
;; --------------------------------------
;; ** CLOJURE-MODE CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/clojure-cfg.el")
(load "~/.archemacs/INI/dev/clojure-cfg.el")
;; --------------------------------------
;; ** UNITY CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/unity-cfg.el")
(load "~/.archemacs/INI/dev/unity-cfg.el")
;; --------------------------------------
;; ** JS-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/js-cfg.el") 
(load "~/.archemacs/INI/dev/js-cfg.el")
;; --------------------------------------
;; ** FORMATS-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/formats-mods-cfg.el")
(load "~/.archemacs/INI/dev/formats-mods-cfg.el")
;; --------------------------------------
;; ** FLYCHECK CUSTOMIZATION
(load "~/.archemacs/INI/dev/flycheck-cfg.el")
;; (find-file "~/.archemacs/INI/flycheck-cfg.el") 
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

;; *** outshine-mode : 
		;; #'outshine-mode on in outshine cfg
		;; (find-file-other-frame "~/.archemacs/INI/outshine_cfg.el")
		;; (outshine-mode t)
		;; (outline-minor-mode t)
;; *** end prog-mode-hook
		))
;; --------------------------------------
;; *  --------------------------------------

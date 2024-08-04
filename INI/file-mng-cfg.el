;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * FILE-MANAGEMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** MAGIT-MOD CUSTOMIZATION
(use-package magit
	:ensure t
	:defer t
	)
;; --------------------------------------
;; ** RANGER-MOD CUSTOMIZATION
(use-package ranger
	:ensure t
	:defer t
	;; :config
	:bind (:map ranger-mode-map
				 ("r r" . ranger-refresh)))

;; --------------------------------------
;; ** DIRED-MOD CUSTOMIZATION
(use-package dired
 ;; :config
	)
;; --------------------------------------
;; *  --------------------------------------

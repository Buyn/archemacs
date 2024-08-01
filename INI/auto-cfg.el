;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * AUTO-MODs CUSTOMIZATION
;; --------------------------------------
;; **  MAGIT-MOD CUSTOMIZATION
(use-package magit
 :ensure t
	)
;; --------------------------------------
;; ** AUTOCOMPLETE-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/autocomplete-cfg.el")
(load (expand-file-name "INI/auto/autocomplete-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** SNIPPETS-MOD CUSTOMIZATION
;; (find-file-other-frame (expand-file-name "INI/auto/snippets-cfg.el" user-emacs-directory))
(load (expand-file-name "INI/auto/snippets-cfg.el" user-emacs-directory))
;; --------------------------------------
;; *  --------------------------------------

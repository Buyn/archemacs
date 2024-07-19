;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/interface/powerline-cfg.el")
;; --------------------------------------
;; --------------------------------------;; 
;; * SPACELINE CUSTOMIZATION
;; ** spaceline powerline : 
(use-package spaceline 
	:ensure t
;; *** spaceline config
  :config
		;; (spaceline-spacemacs-theme)
		;; (spaceline-emacs-theme)
  (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme)
;; *** END )
	)
;; --------------------------------------
;; *  --------------------------------------

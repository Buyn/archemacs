;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; * CLOJURE-MODE CUSTOMIZATION
;; --------------------------------------
;; ** clojure-mode
;; *** install
;; M-x package-install RET rainbow-delimiters RET
;; (unless (package-installed-p 'clojure-mode)
;;   (package-install 'clojure-mode))
;; (require 'use-package)
(use-package clojure-mode
	:ensure t
	;; :disabled
;; *** :config
	:config
 (setq clojure-indent-style align-arguments)
 (setq clojure-indent-keyword-style align-arguments)
;; *** END )
	)
;; *** Docs 
;; **** links:
;; https://github.com/clojure-emacs/clojure-mode
;; **** Customization:
;; *** --------------------------------------
;; ** ob-clojur-mode
;; *** install
(use-package ob-clojure
	;; :disabled
	:defer t
	;; :ensure t
	:config
		(setq org-babel-clojure-backend nil)
	;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
	;; (custom-theme-set-faces
	;; 	'material
	;; 	`(rainbow-delimiters-depth-1-face ((t
	;; 			(:foreground ,"aquamarine"))))
	;; 	)
	)
;; *** --------------------------------------
;; ** clj-refactor
;; *** install
(use-package clj-refactor
	:disabled
	:defer t
	;; :ensure t
	;; :config
	;; 	(setq org-babel-clojure-backend nil)
	;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
	;; (custom-theme-set-faces
	;; 	'material
	;; 	`(rainbow-delimiters-depth-1-face ((t
	;; 			(:foreground ,"aquamarine"))))
	;; 	)
	)
;; *** --------------------------------------
;; * --------------------------------------

;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; * UNITY CUSTOMIZATION
;; --------------------------------------
;; ** install miracle: Arcadia 
;; :quelpa (outshine :fetcher github :repo "alphapapa/outshine")
;; git clone https://github.com/Saikyun/miracle.git
(unless (package-installed-p 'miracle)
	(use-package miracle 
	;; :ensure t 
		:quelpa (miracle :fetcher github :repo "Saikyun/miracle")))
	;; (quelpa
	;; '(miracle
	;; 	:fetcher github
	;; 	:url "https://github.com/saikyun/miracle.git"))
;; (quelpa '(miracle :repo "saikyun/miracle" :fetcher github))
;; (require 'use-package)
;; ** use-package miracle : 
(use-package miracle 
	;; :ensure t
;; ** END )
	)
;; ** Docs 
;; *** links:
;; https://github.com/Saikyun/miracle
;; *** keys:
;; Keys 	Description
;; C-c C-c 	Evaluate expression at point.
;; C-c C-r 	Evaluate region.
;; C-c C-k 	Evaluate current buffer contents.
;; C-c C-l 	Load current file from disk.
;; C-c C-d 	Describe symbol at point, showing documentation in REPL window.
;; C-c C-n 	Evaluate namespace.
;; C-c C-b 	Interrupt running job.
;; M-. 	Jump to definition of var at point.
;; M-, 	Jump back to where you were before you did M-.
;; Miracle shortcuts for REPL buffer
;; Keys 	Description
;; C-c C-d 	Describe symbol at point, showing documentation in REPL window.
;; C-c C-c 	Interrupt running job.
;; M-. 	Jump to definition of var at point.
;; C-c C-f 	Replaces the last result with a pretty printed version of it. f is for formatting.
;; ** --------------------------------------
;; * --------------------------------------

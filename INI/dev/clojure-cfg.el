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
(use-package clojure-mode
	:ensure t
	;; :disabled
	:config
 (setq clojure-indent-style 'align-arguments)
 (setq clojure-indent-keyword-style 'align-arguments)
	)
;; ** ob-clojur-mode
(use-package ob-clojure
	;; :disabled
	:defer t
	;; :ensure t
	:config
		(setq org-babel-clojure-backend 'cider)
	;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
	;; (custom-theme-set-faces
	;; 	'material
	;; 	`(rainbow-delimiters-depth-1-face ((t
	;; 			(:foreground ,"aquamarine"))))
	;; 	)
	)
;; ** use-package cider:
(use-package cider
	:defer t
	:ensure t
  :after clojure-mode
  :config
  ;; (set-lookup-handlers! 'cider-mode nil) ; doom option 
	;; (setq lsp-enable-completion-at-point nil) ; use cider completion
	(setq cider-eldoc-display-for-symbol-at-point nil) ; disable cider showing eldoc during symbol at point
	)

;; ** clj-refactor
(use-package clj-refactor
	:defer t
	:ensure t
  :after clojure-mode
  :config
  ;; (set-lookup-handlers! 'clj-refactor-mode nil) ; doom option 
	(setq cljr-add-ns-to-blank-clj-files nil) ; disable clj-refactor adding ns to blank files
	)
;; ** Leiningen

;; ** --------------------------------------
;; * LSP-MODE CUSTOMIZATION
;; --------------------------------------
;; ** use-package lsp-mode:
(use-package lsp-mode
	:defer t
	:ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook
	(;; replace XXX-mode with concrete major-mode(e. g. python-mode)
		(clojure-mode-hook . lsp)
		(clojurescript-mode-hook . lsp)
		(clojurec-mode-hook . lsp)
		;; (XXX-mode . lsp)
		;; if you want which-key integration
		(lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
	:config
	(setq gc-cons-threshold (* 100 1024 1024)
				read-process-output-max (* 1024 1024)
				treemacs-space-between-root-nodes nil
				company-minimum-prefix-length 1)
	)

;; ** use-package lsp-ui:
(use-package lsp-ui :commands lsp-ui-mode)
;; ;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;; ** use-package lsp-ivy:
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; ** lsp-treemacs:
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ** --------------------------------------
;; * use-package dap-mode:
;; optionally if you want to use debugger
;; (use-package dap-mode)


;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;; ** --------------------------------------
;; * --------------------------------------

;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/lit-cfg.el")
;; (find-file-other-frame "~/INI/lit-cfg.el") 
;; --------------------------------------
;; *  --------------------------------------
;; * READERS MODS CUSTOMIZATION 
;; ** fb2-mode
;; *** load
;; (add-to-list 'load-path "~/ELs/Readers/fb2-mode/")
;; (add-to-list 'load-path (expand-file-name "ELs/Readers/fb2-mode/" user-emacs-directory))
;; https://github.com/spline1986/fb2-mode
;; https://github.com/spline1986/fb2-mode.git
;; *** use-package fb2-mode : 
(use-package fb2-mode
	:defer t
	;; :ensure t
  ;; :disabled
	;; :load-path "~/ELs/Readers/fb2-mode"
	:load-path "ELs/Readers/fb2-mode/"
	;; :init
	;; :load-path (expand-file-name "ELs/Readers/fb2-mode/" user-emacs-directory)
;; (find-file (expand-file-name "ELs/Readers/fb2-mode" user-emacs-directory))

;; *** :config : 
	:config
;; (add-to-list 'auto-mode-alist '("\\.fb2\\'" . fb2-mode))
;; (add-to-list 'auto-mode-alist '("\\.fb\\'" . fb2-mode))

;; (define-key fb2-mode-map (kbd "<f9>") 'read-aloud-stop)
;; (define-key fb2-mode-map (kbd "SPC") 'buyn-reader-go)
;; (define-key fb2-mode-map (kbd "S-SPC") 'evil-scroll-up)

;; (add-hook 'fb2-mode-hook #'toggle-word-wrap)
;; *** auto-mode-alist:
	;; :mode (("\\.fb2\\'" "\\.fb\\'" ) . fb2-mode)
	;; :mode ("\\.fb2\\'" "\\.fb\\'")
	;; :mode
	;; ("\\.fb2\\'" . fb2-mode)
	;; :interpreter "fb2-mode"

;; *** ===========END========= ) : 
	)
;; *** Docs
 ;; https://github.com/spline1986/fb2-mode
 ;; Screenshot
 ;; Installation
 ;; fb2-show-images — if not nil then images in book will displayed (default t).
 ;; fb2-images-height — height of images in fb2-mode buffer (default 500).
 ;; fb2-replace-hard-spaces — if not nil then non-breaking spaces will replaced by spaces (default nil).
;; ** nov.el
;; *** use-package esxml-query : 
;; (use-package esxml-query
	;; :defer t
	;; :ensure t
  ;; :disabled
;; )

;; *** use-package nov.el : 
(use-package nov
	:defer t
	;; :ensure t
  ;; :disabled
	;; :load-path "~/ELs/Readers/nov.el/"
	:load-path "ELs/Readers/nov.el/"
	;; :init
;; *** :config : 
	:config
	(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
	;; :mode ("\\.epub\\'" . nov-mode)
;; *** ===========END========= ):
	)
;; *** Docs
;; git clone https://depp.brause.cc/nov.el.git
;; all doc in start mods
;; *  --------------------------------------

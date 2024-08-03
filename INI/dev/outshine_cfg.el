;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/folding-cfg.el")
;; --------------------------------------
;; * OUTSHINE-MOD CUSTOMIZATION 
;; --------------------------------------
;; ** use-package outshine
(use-package outshine :ensure t
  ;; uncoment to instal
  ;; loding each time - resrch how to setup right
  ;; :quelpa (outshine :fetcher github :repo "alphapapa/outshine")
;; ** outshine config
  :config
;; *** binds
	;; (defvar outline-minor-mode-prefix "\M-#")
	(define-key evil-normal-state-map "zf" 'outshine-insert-heading)
;; **** zF
	(define-key evil-normal-state-map "zF" '(lambda() (interactive)
			;; (evil-previous-line)
			(outshine-insert-comment-subtree )
			(insert (read-string "comment : "))
			))

;; **** visual add zf
	(define-key evil-visual-state-map "zf" '(lambda() (interactive)
			(setq region-text (buffer-substring (region-beginning) (region-end)))
			(evil-normal-state)
			;; (evil-open-above 1)
			(evil-previous-line)
			(outshine-insert-heading)
			;; (backward-char)
			(save-excursion
				;; (insert " ")
				(insert region-text)
				(unless (eq major-mode 'org-mode)
					(insert ":")
					)
			)))

;; *** outshine startup state
	(setq outshine-startup-folded-p 1)
;; *** autoload
	;; (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
	(add-hook 'outline-minor-mode-hook 'outshine-mode)
	(add-hook 'prog-mode-hook '(lambda () (outshine-mode t)))
	;; (add-hook 'prog-mode-hook '(lambda () (outline-minor-mode t)))
	;; (add-hook 'prog-mode-hook '(lambda () (setq outline-minor-mode 1)))
	;; (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
	;; (add-hook 'python-mode-hook 'outline-minor-mode)
	;; (add-hook 'lua-mode-hook 'outline-minor-mode)
	;; (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
;; *** theme customization
	;; (custom-theme-set-faces
	;; 'material
	;; `(outline-1 ((t (:height 1.25 :weight bold))))
	;; `(outline-2 ((t (:height 1.15 :weight bold))))
	;; `(outline-3 ((t (:height 1.05 :weight bold))))
	;; `(outline-4 ((t (:height 1.95 :weight bold))))
	;; `(outline-5 ((t (:height 1.85 :weight bold))))
	;; `(outline-6 ((t (:height 1.75 :weight bold))))
	;; `(outline-7 ((t (:height 1.65 :weight bold))))

   ;; `(org-level-1 ((,class (:inherit outline-1
   ;;                       :background ,header-color
   ;;                       :weight bold
   ;;                       :box (:style released-button)
   ;;                       :height 1.3))))
   ;; `(org-level-2 ((,class (:inherit outline-2
   ;;                                :background ,"#35575b"
   ;;                                :box (:style released-button)
   ;;                       :height 1.2))))
   ;; `(org-level-3 ((,class (:inherit outline-3 :height 1.1))))
   ;; `(org-level-4 ((,class (:inherit outline-4 :height 1.0))))
   ;; `(org-level-5 ((,class (:inherit outline-5 ))))
   ;; `(org-level-6 ((,class (:inherit outline-6 ))))
   ;; `(org-level-7 ((,class (:inherit outline-7 ))))
   ;; `(org-level-8 ((,class (:inherit outline-8 ))))
   ;; `(org-level-9 ((,class (:inherit outline-9 ))))

;; ** END of use-package outshine 
	)
;; -------------------------------------- }}}
;; *  --------------------------------------

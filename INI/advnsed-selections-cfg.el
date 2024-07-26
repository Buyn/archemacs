;; --------------------------------------
;; init.el --- Emacs configuration
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; --------------------------------------
;; * ADVNSED SELECTIONS CUSTOMIZATION
;; --------------------------------------
;; * expand-region cfg
;; ** use-package expand-region 
(use-package expand-region :ensure t
;; ** expand-region config
  :config
;; *** hydra-expand-region
;; **** defhydra
  (defhydra hydra-expand-region
	;; (:color blue)
	(:body-pre 'er/expand-region)
  "expand-region"
;; ****  key list
  ("C-=" er/expand-region "more")
  ("=" er/expand-region "more")
  ("m" er/expand-region "more")
  ("SPC" er/expand-region "more")
  ("-" er/contract-region "less")
  ("l" er/contract-region "less")
  ("S-SPC" er/contract-region "less")
  ("C--" er/contract-region "less")
  ("w" er/mark-word "wrd")
  ("s" er/mark-symbol "smbl")
  ;; ("=" er/mark-symbol-with-prefix "more")
  ;; ("=" er/mark-next-accessor "more")
  ("f" er/mark-method-call "methd")
  ("'" er/mark-inside-quotes "iq")
  ("\"" er/mark-outside-quotes "oq")
  ("(" er/mark-inside-pairs "i(")
  (")" er/mark-outside-pairs "o)")
  (";" er/mark-comment ";")
  ("u" er/mark-url "url")
  ;; ("=" er/mark-email "more")
  ("d" er/mark-defun "def")
;; ****  END )
  )
;; **** Bind
(global-set-key (kbd "C-=") 'hydra-expand-region/body)
(define-key evil-visual-state-map (kbd "SPC") 'hydra-expand-region/body)
(define-key evil-normal-state-map "zv" 'hydra-expand-region/body)
;; *** binds
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; ** END of use-package outshine 
	)
;; ** -------------------------------------- }}}


;; * evil-mc cfg
;; ** use-package evil-mc 
(use-package evil-mc :ensure t
;; ** evil-mc config
	:disabled
	:config
	(global-evil-mc-mode  1) ;; enable
	(define-key evil-visual-state-map "zi" 'evil-mc-make-cursor-in-visual-selection-end)
	 ;; (define-key evil-visual-state-map "zj" 'evil-mc-make-cursor-move-next-line)
	 ;; (define-key evil-visual-state-map "zk" 'evil-mc-make-cursor-move-prev-line)
	 ;; (define-key evil-visual-state-map "zn" 'evil-mc-skip-and-goto-next-match)
	 ;; (define-key evil-visual-state-map "zp" 'evil-mc-skip-and-goto-prev-match)
	 ;; (define-key evil-visual-state-map "zN" 'evil-mc-skip-and-goto-next-cursor)
	 ;; (define-key evil-visual-state-map "zP" 'evil-mc-skip-and-goto-prev-cursor)
	 (define-key evil-visual-state-map "zo" 'evil-mc-make-all-cursors)
	 (define-key evil-visual-state-map "zI" 'evil-mc-make-cursor-in-visual-selection-beg)
	 (define-key evil-visual-state-map "zq" 'evil-mc-undo-all-cursors)
;; ** END of use-package outshine 
	)
;; ** -------------------------------------- 


;; * --------------------------------------

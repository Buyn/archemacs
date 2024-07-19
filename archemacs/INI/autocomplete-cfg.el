;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; * AUTO-COMPLETE  CUSTOMIZATION
;; ** old vanila setings
;; --------------------------------------
;; (setq tab-always-indent 'complete)
;; (add-to-list 'completion-styles 'initials t)
;; --------------------------------------
;; ** company
(use-package company :ensure t
  ;; :defer 2
	:config
	(add-hook 'prog-mode-hook 'company-mode)
	;; (setq completion-styles "basic substring emacs22")
	(setq completion-styles '(partial-completion substring emacs22))
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	(setq company-minimum-prefix-length 10)
	(setq company-idle-delay nil)
	(setq company-show-numbers t)
	;; :bind ("C-c c" hydra-clock/body)
;; ***  END use-package 
  )
;; (require 'company)
;; (require 'company)
;; ** defun program-mode-hook-customize : 
(defun program-mode-hook-customize (args)
  "comands fun list to customizing
	programing mode
	но есть подозрение что негде оно не запускается
	у сомпани свои настройуи
	у фузикомпани свои
	в каждый новерное нужно домавить эту
	и вообщегде есть програминг мод
	"
  (interactive "P")
		(display-line-numbers-mode t)
		(company-fuzzy-mode 1)
		(setq company-minimum-prefix-length 3)
		(setq company-show-numbers t)
		(setq company-idle-delay 0.1)
		(setq outshine-mode 1))
;; ** company fuze search
;; *** use-package company-fuzzy : 
(use-package company-fuzzy :ensure t
;; *** --------------------------------------
  ;; :defer 2
;; *** :init : 
 :diminish 
 :init
  (setq company-require-match nil)            ; Don't require match, so you can still move your cursor as expected.
  (setq company-tooltip-align-annotations t)  ; Align annotation to the right side.
  (setq company-eclim-auto-save nil)          ; Stop eclim auto save.
  (setq company-dabbrev-downcase nil)         ; No downcase when completion.
;; *** :config : 
  :config
  ;; Enable downcase only when completing the completion.
  (defun jcs--company-complete-selection--advice-around (fn)
    "Advice execute around `company-complete-selection' command."
    (let ((company-dabbrev-downcase t))
      (call-interactively fn)))
  (advice-add 'company-complete-selection :around #'jcs--company-complete-selection--advice-around)
;; *** add-hook 'prog-mode-hook : 
	(add-hook 'prog-mode-hook (lambda () 
		(setq company-show-numbers t)
		(setq company-fuzzy-mode 1)
		(setq company-minimum-prefix-length 3)
		(setq company-idle-delay 0.1)))
;; ***  END use-package 
  )
;; (require 'company)
;; (company-fuzzy-mode 1)
;; *** --------------------------------------
;; ** jedi 
;; --------------------------------------
(use-package jedi 
	:ensure t
	;; :init
  ;; :disabled
	;; (elpy-enable)
	:config
	; move quick-help tooltips to the minibuffer
	(setq jedi:tooltip-method nil)

	; don't auto-complete unless requested
	(setq ac-auto-start nil)
	(setq ac-auto-show-menu nil)
	;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
	(add-hook 'python-mode-hook 'jedi:setup)
	(setq jedi:complete-on-dot t)  
	)

;; --------------------------------------
;; ** company-jedi 
;; --------------------------------------
(use-package company-jedi 
	:ensure t
	;; :init
	;; (elpy-enable)
	:config
	(defun my/python-mode-hook ()
		(add-to-list 'company-backends 'company-jedi))
	(add-hook 'python-mode-hook 'my/python-mode-hook)
	;; (define-key evil-insert-state-map (kbd "m-SPC") 'company-jedi)
	)
;; --------------------------------------

;; * --------------------------------------

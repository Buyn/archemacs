;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; * PYTHON-MOD CUSTOMIZATION
;; --------------------------------------
;; ** (use-package elpy
(require 'use-package)
(use-package elpy :ensure t
;; *** init : 
	:defer t
	:init
	(elpy-enable)
;; *** config : 
	:config
	;; (elpy-enable)
	;; (ivy-mode 1)
	(company-mode 1)
	;; (setq compilation-scroll-output nil)
	(setq compilation-scroll-output t)
	;; not working from config onli from init and not from hooks
	;; (add-hook 'python-mode-hook 'elpy-mode)
	;; (add-hook 'python-mode-hook 'elpy-enable)
	;; (setq python-shell-interpreter "python"
	;; python-shell-interpreter-args "-i")
	;; findout what it do
	(add-to-list 'auto-mode-alist '("\\.kv$" . python-mode))
	;; (add-to-list 'interpreter-mode-alist '("kv" . python-mode))
;; *** define-key : 
	(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete)
	(define-key evil-normal-state-map (kbd "M-e M-f M-p") 'xref-find-definitions)
	(define-key evil-normal-state-map (kbd "M-e M-f M-P") 'xref-find-definitions-other-frame)
	(define-key evil-normal-state-map (kbd "M-e M-f M-o") 'elpy-occur-definitions)
	(define-key evil-normal-state-map (kbd "M-e M-f M-a") 'elpy-goto-assignment)
	(define-key evil-normal-state-map (kbd "M-e M-f M-d") 'elpy-goto-definition)
	(define-key evil-normal-state-map (kbd "M-e M-f M-D") 'elpy-goto-definition-other-window)
	;; (define-key evil-insert-state-map (kbd "<f8>") '(lambda() (interactive)
	;; 			(org-save-all-org-buffers)
	;; 			(save-some-buffers 'no-confirm)
	;; 			(evil-normal-state)
	;; 			(recompile)
	;; 			))
;; *** 	) : 
	)
;; * --------------------------------------

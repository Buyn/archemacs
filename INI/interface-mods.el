;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; * IVY CUSTOMIZATION
;; --------------------------------------
(require 'use-package)
(use-package ivy :ensure t
	;; :init
	;; (elpy-enable)
	:config
	(ivy-mode 1)
	(ido-mode nil)
	)
;;  --------------------------------------
;; * AVY CUSTOMIZATION
;; --------------------------------------
(use-package avy :ensure t
	;; :init
	;; (elpy-enable)
	:config
		(define-key evil-normal-state-map (kbd "M-f") 'avy-goto-word-1)
		(define-key evil-normal-state-map (kbd "f") 'evil-avy-goto-char-in-line)
		(define-key evil-visual-state-map (kbd "f") 'evil-avy-goto-char-in-line)
	)
;; --------------------------------------
;; * DIMINISH CUSTOMIZATION
;; --------------------------------------
(use-package diminish
  :ensure t
	:demand t
  ;; :init
	:config
  (diminish 'which-key-mode)
  ;; (diminish 'linum-relative-mode)
  ;; (diminish 'hungry-delete-mode)
  ;; (diminish 'subword-mode)
  ;; (diminish 'beacon-mode)
  ;; (diminish 'irony-mode)
  ;; (diminish 'page-break-lines-mode)
  ;; (diminish 'auto-revert-mode)
  (diminish 'rainbow-delimiters-mode)
  (diminish 'rainbow-mode)
  (diminish 'org-roam-ui-mode)
  (diminish 'yas-minor-mode)
  ;; (diminish 'yas-minor-mode)
  ;; (diminish 'flycheck-mode)
  (diminish 'ivy-mode)
  (diminish 'outshine-mode)
  ;; (diminish 'outline-mode)
  (diminish 'company-fuzzy-mode " CpF")
  (diminish 'outline-minor-mode)
  (diminish 'ComFuz-mode)
	;; (diminish 'subword-mode)
	(diminish 'visual-line-mode)
  ;; (diminish '+3-mode)
  (diminish 'helm-mode))
;; --------------------------------------
;; * WHICH-KEY CUSTOMIZATION
;; --------------------------------------
(use-package which-key
	:ensure t
	:config
		(which-key-mode))
;; --------------------------------------

;;  --------------------------------------
;; * POWERLINE CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/interface/powerline-cfg.el")
(load "~/.archemacs/INI/interface/powerline-cfg.el")
;; --------------------------------------
;; * INPUT-METHODS CUSTOMIZATION: 
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/interface/input-methods-cfg.el")
(load "~/.archemacs/INI/interface/input-methods-cfg.el")
;; --------------------------------------
;; * --------------------------------------

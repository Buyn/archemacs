;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;;  --------------------------------------
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
	)
;; --------------------------------------

;;  --------------------------------------
;; * POWERLINE CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/interface/powerline-cfg.el")
(load "~/.archemacs/INI/interface/powerline-cfg.el")
;; --------------------------------------
;; * REVERSE-IM CUSTOMIZATION: 
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/interface/input-methods-cfg.el")
(load "~/.archemacs/INI/interface/input-methods-cfg.el")
;; --------------------------------------
;; * --------------------------------------

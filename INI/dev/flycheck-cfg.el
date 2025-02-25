;; * FLYCHECK CUSTOMIZATION
;; --------------------------------------
;; ** use-package flycheck 
(use-package flycheck :ensure t
  ;; :init
  ;; (elpy-enable)
;; ** :config : 
  :config
  ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
;; ** bind 
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-1")
  ;;    'flycheck-first-error)
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-n")
  ;;         'flycheck-next-error)
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-f")
  ;;         'flycheck-next-error-function)
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-;")
  ;;         'flycheck-next-error-pos)
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-p")
  ;;         'flycheck-previous-error)
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-d")
  ;;    'flycheck-display-error-explanation)
  ;; (define-key evil-normal-state-map (kbd "M-e M-n M-s")
  ;;    'list-flycheck-error)
;; ** End of use-package ) 
  )

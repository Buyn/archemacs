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
  )

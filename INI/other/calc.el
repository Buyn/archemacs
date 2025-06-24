(use-package calc
  ;; :disabled
  ;; :defer t
  ;; :ensure t
  ;; :config
  ;;   (define-key calc-mode-map (kbd "M-k") 'windmove-up)
  :bind (:map  calc-mode-map
              ("M-k" . windmove-up)
              ;; ("M-K" . '(calc-copy-as-kill N))
              ("M-K" . calc-copy-as-kill ))
  )

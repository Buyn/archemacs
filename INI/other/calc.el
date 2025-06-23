(use-package calc
  ;; :disabled
  :defer t
  :ensure t
  ;; :config
  :bind (:map  calc-mode-map
              ("M-k" . windmove-up)
              ;; ("M-K" . '(calc-copy-as-kill N))
              ("M-K" . calc-copy-as-kill )
              )
  )

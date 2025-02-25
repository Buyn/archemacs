;; * REVERSE-IM CUSTOMIZATION:
;; --------------------------------------
;; ** install
;; https://github.com/a13/reverse-im.el
(use-package reverse-im
  :ensure t
;; ** :config:
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t)
;; ** define-key:
  ;; (define-key evil-visual-state-map (kbd "M-U") 'reverse-im-translate-region)
  (define-key evil-visual-state-map (kbd "M-U") '(lambda () (interactive) 
            (reverse-im-translate-region (region-beginning) (region-end))
            (toggle-input-method)))
  (define-key evil-insert-state-map (kbd "M-U") 'reverse-im-translate-word)
  (define-key evil-insert-state-map (kbd "C-U") '(lambda () (interactive) 
            (reverse-im-translate-word 1)
            (toggle-input-method)))
;; ** use-package END)
  )
;; ** --------------------------------------

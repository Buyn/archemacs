(use-package telega
  ;; :disabled
  :ensure t
  :defer t

  :config
  (setq telega-server-libs-prefix "/usr")
  ;; telega-chat-mode
  ;; (define-key evil-normal-state-map (kbd "M-f") 'avy-goto-word-1)
  ;; (define-key evil-normal-state-map (kbd "M-F") 'avy-goto-char-timer)
  (setq telega-emoji-use-images nil)

)

(use-package gpt
 :ensure t
 :config
  ;; (setq gpt-openai-key "sk-*")
  (setq gpt-openai-engine "gpt-3.5-turbo")
  (define-key evil-normal-state-map (kbd "M-a M-j M-o") 'gpt-dwim)
  )

(use-package gptel
	:ensure t
	;; :disabled
	:config
  (custom-set-variables '(gptel-model "gpt-3.5-turbo-16k"))
  (define-key evil-normal-state-map (kbd "M-a M-j M-S-h") 'gptel-system-prompt)
  (define-key evil-normal-state-map (kbd "M-a M-j M-j") 'gptel-send)
  (define-key evil-normal-state-map (kbd "M-a M-j M-h") 'gptel-mode)
  ;; (setq gpt-openai-key "sk-*")
  (setq gptel-default-mode 'org-mode)
)

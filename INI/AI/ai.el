(use-package gpt
	:disabled
	:ensure t
	:config
		;; (setq gpt-openai-key "sk-*")
		;; (setq gpt-openai-engine "gpt-3.5-turbo")
		(setq gpt-openai-engine "gpt-4o-mini")
		;; (setq gpt-openai-engine "gpt-4o")
		;; (setq gpt-openai-engine "gpt-4o-mini-2024-07-18")
		(define-key evil-normal-state-map (kbd "M-a M-j M-o") 'gpt-dwim)
  )

(use-package gptel
	;; :disabled
	:ensure t
	:config
		;; (custom-set-variables '(gptel-model "gpt-3.5-turbo-16k"))
		;; (custom-set-variables '(gptel-model "gpt-4o"))
		(custom-set-variables '(gptel-model "gpt-4o-mini"))
		;; (custom-set-variables '(gptel-model "gpt-4o-mini-2024-07-18"))
		;; (setq gptel-model "gpt-4o-mini-2024-07-18")
		(define-key evil-normal-state-map (kbd "M-a M-j M-S-h") 'gptel-system-prompt)
		(define-key evil-normal-state-map (kbd "M-a M-j M-j") 'gptel-send)
		(define-key evil-normal-state-map (kbd "M-a M-j M-h") 'gptel-mode)
		;; (setq gpt-openai-key "sk-*")
		(setq gptel-default-mode 'org-mode)
)

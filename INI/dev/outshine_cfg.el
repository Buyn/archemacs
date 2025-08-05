;; ** use-package outshine
(use-package outshine :ensure t
  ;; uncoment to instal
  ;; loding each time - resrch how to setup right
  ;; :quelpa (outshine :fetcher github :repo "alphapapa/outshine")
;; ** outshine config
  :config
;; *** binds
  ;; (defvar outline-minor-mode-prefix "\M-#")
  (define-key evil-normal-state-map "zf" 'outshine-insert-heading)
;; **** zF
  (define-key evil-normal-state-map "zF" '(lambda() (interactive)
      ;; (evil-previous-line)
      (outshine-insert-comment-subtree )
      (insert (read-string "comment : "))
      ))

;; **** visual add zf
  (define-key evil-visual-state-map "zf" '(lambda() (interactive)
                                            (let ((region-text (buffer-substring (region-beginning) (region-end))))
        (evil-normal-state)
        ;; (evil-open-above 1)
        (evil-previous-line)
        (outshine-insert-heading)
        ;; (backward-char)
        (save-excursion
          ;; (insert " ")
          (insert region-text)
          (unless (eq major-mode 'org-mode)
            (insert ":"))))))

;; *** outshine startup state
  (setq outshine-startup-folded-p 1)
;; *** autoload
  (add-hook 'outline-minor-mode-hook 'outshine-mode)
  (add-hook 'prog-mode-hook '(lambda () (outshine-mode t)))
  )

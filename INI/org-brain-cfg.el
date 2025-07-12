(use-package org-brain :ensure t

:init

(setq org-brain-path "~/Dropbox/orgs/org-Brain")

(with-eval-after-load 'evil
  (evil-set-initial-state 'org-brain-visualize-mode 'emacs))

:config

(setq-default tab-width 8)

(bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
(define-key org-brain-visualize-mode-map (kbd "M-f") 'avy-goto-word-1)

(define-key org-brain-visualize-mode-map (kbd "S-C-<return>")
            '(lambda() (interactive)
               (push-button)
               (org-brain-goto-current) 
               (let (buffer-name-to-close (buffer-name))
                 (evil-quit)
                 (switch-to-buffer-other-frame buffer-name-to-close))))

(define-key org-brain-visualize-mode-map (kbd "C-<return>")
            '(lambda() (interactive)
               (push-button)
               (org-brain-goto-current) 
               (let (buffer-name-to-close (buffer-name))
                 (evil-quit)
                 (org-brain-visualize-back)
                 (switch-to-buffer-other-frame buffer-name-to-close))))

(setq org-id-track-globally t)
(setq org-id-locations-file "~/Dropbox/orgs/org-Brain/.org-id-locations")

(push '("b" "Brain" plain (function org-brain-goto-end)
        "* %i%?" :empty-lines 1)
      org-capture-templates)

(setq org-brain-title-max-length 23)

)

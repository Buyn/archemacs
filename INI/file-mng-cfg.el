;; * FILE-MANAGEMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** RANGER-MOD CUSTOMIZATION
(use-package ranger
  :ensure t
  :defer t
  ;; :config
  :bind (:map ranger-mode-map
              ("r r" . ranger-refresh)
              ("M-f" . avy-goto-word-1)
              ("g g" . ranger-goto-top)
              ("G G" . ranger-goto-bottom)
              ("Z F F" . find-file-other-frame)
              ("Z G T T" . (lambda () (interactive)
                    (dired "/home/buyn/Desktop/")))
              ("c d" . (lambda () (interactive)
                  (let ((target (read-directory-name "Jump to dir: ")))
                    (dired target))))
              ("C-S-F" . (lambda () (interactive)
                (if (eq (frame-parameter nil 'fullscreen) 'maximized)
                    (progn
                      (set-frame-parameter nil 'fullscreen nil)
                      ;; If we weren't in minimal mode, switch to minimal deer mode
                      (unless (r--fget ranger-minimal)
                        (ranger-minimal-toggle)))
                    (progn
                      (set-frame-parameter nil 'fullscreen 'maximized)
                      ;; If we were in minimal mode, switch back to full ranger
                      (when (r--fget ranger-minimal)
                        (ranger-minimal-toggle))))))
              ; dire edit
              ("Z F I" . (lambda() (interactive)
                           (find-file-other-frame
                            (expand-file-name
                             "INI/file-mng-cfg.el"
                             user-emacs-directory))))))

;; --------------------------------------
;; ** DIRED-MOD CUSTOMIZATION
(use-package dired
 ;; :config
  )
;; --------------------------------------
;; * GITS-MODs CUSTOMIZATION
;; --------------------------------------
;; ** MAGIT-MOD CUSTOMIZATION
(use-package magit
  :ensure t
  :defer t
  :bind (:map magit-status-mode-map
              ("M-z M-z" . (lambda() (interactive)
                            (setq buyn-magit-buff-name (buffer-name))
                            (bury-buffer)))
              ("n n" . (lambda() (interactive)
                            (setq buyn-magit-buff-name (buffer-name))
                            (bury-buffer)))
              ("n f i" . (lambda() (interactive)
                           (find-file-other-frame
                            (expand-file-name
                             "INI/file-mng-cfg.el"
                             user-emacs-directory))))

              ("J J" . magit-display-repository-buffer)
              ("J j" . magit-status-jump)
              ("j" . magit-section-forward)

              ("K K" . magit-file-untrack)
              ("K k" . magit-discard)
              ("k" . magit-section-backward)

              ("p" . magit-push)

              ;; ("<F9> m m" .
              ("M-z M-m" .
               (lambda() (interactive)
                 (magit-git-command
                  "git checkout master;git merge experemental;git push;git checkout experemental")))
              ))
;; --------------------------------------

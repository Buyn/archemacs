;; * DEVELOPMENT-MODs CUSTOMIZATION
;; --------------------------------------
;; ** PROJECTILE CUSTOMIZATION
(use-package projectile
  :defer t
  :ensure t
  ;; :init
  ;; (projectile-mode +1)
  :bind (
          :map projectile-mode-map
              ;; ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)
          :map evil-normal-state-map
              ("ZPFF" . 'projectile-find-file-other-frame)
              ("ZPFO" . 'projectile-find-other-file-other-frame)
              ("ZPFR" . 'projectile-find-related-file-other-frame)
              ("ZPFd" . 'projectile-find-file-dwim-other-frame)
              ("ZPFT" . 'projectile-find-implementation-or-test-other-frame)
              ("ZPFB" . 'projectile-switch-to-buffer-other-frame)
              ("ZPFD" . 'projectile-dired-other-frame)
              ("Zoo" . 'projectile-switch-to-buffer-other-frame)
              ("Zii" . 'projectile-switch-to-buffer)
              ("ZPTt" . 'projectile-find-test-file)
              ("ZPTM" . 'projectile-find-matching-test)
              ("ZPTC" . 'projectile-create-missing-test-files)
              ("ZPTP" . 'projectile-current-project-test-files)
              ("ZPTT" . 'projectile-toggle-between-implementation-and-test)
              ("ZPGG" . 'projectile-find-tag)
              ("ZPGR" . 'projectile-regenerate-tags)
              ("ZPPN" . 'projectile-switch-project-by-name)
              ("ZPPS" . 'projectile-switch-project)
              ("ZPPF" . 'projectile-current-project-files)
              ("ZPSI" . (lambda() (interactive)
                                  (find-file-other-frame (expand-file-name "INI/dev-cfg.el" user-emacs-directory))))
              ("Z P P <F2>" . 'projectile-save-project-buffers)
              ("ZPPO" . 'projectile-switch-open-project)
              ("ZPPP" . 'projectile-commander)
              ("ZPgg" . 'projectile-grep)
              ("ZPgr" . 'projectile-ripgrep)
              ("ZPrr" . 'projectile-find-references)
              ("M-e M-r M-r" . 'projectile-find-references)
              ("ZPRR" . 'projectile-replace)
              ("ZPRE" . 'projectile-replace-regexp)
              ("M-e M-p M-o" . 'projectile-multi-occur)
              ("M-e M-t M-t" . 'projectile-toggle-between-implementation-and-test)
          :map evil-normal-state-map
              ("M-e M-p M-o" . (lambda() (interactive)
                                 (projectile-multi-occur
                                  (buffer-substring (region-beginning) (region-end)))))
              ("M-e M-r M-r" . (lambda() (interactive)
                                 (projectile-find-references
                                  (buffer-substring (region-beginning) (region-end)))))
    ;; build/compile project (s-p c)
    ;; test project (s-p T)
))

;; --------------------------------------
;; ** DELIMITERS-MOD CUSTOMIZATION
;; (find-file "~/.archemacs/INI/delimiters-cfg.el")
;; (load "~/.archemacs/INI/dev/delimiters-cfg.el")
(load (expand-file-name "INI/dev/delimiters-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** PYTHON-MOD CUSTOMIZATION
;; (find-file "~/.archemacs/INI/python-cfg.el") 
;; (find-file-other-frame "~/.archemacs/INI/python-cfg.el")
;; (load "~/.archemacs/INI/dev/python-cfg.el")
(load (expand-file-name "INI/dev/python-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** LUA-MOD CUSTOMIZATION
;; --------------------------------------
;; (find-file "~/.archemacs/INI/lua-cfg.el")
;; (load "~/.archemacs/INI/dev/lua-cfg.el")
(load (expand-file-name "INI/dev/lua-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** OUTSHINE-MOD CUSTOMIZATION
;; --------------------------------------
;; (load "~/.archemacs/INI/dev/outshine_cfg.el")
(load (expand-file-name "INI/dev/outshine_cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** AHK-MODE CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/dev/autohotkey-cfg.el")
;; (load "~/.archemacs/INI/dev/autohotkey-cfg.el")
;; (load (expand-file-name "INI/dev/autohotkey-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** C#-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/csharp-cfg.el")
;; (load "~/.archemacs/INI/dev/csharp-cfg.el")
;; (load (expand-file-name "INI/dev/csharp-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** C-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/c-mode-cfg.el")
;; (load "~/.archemacs/INI/dev/c-mode-cfg.el")
;; (load (expand-file-name "INI/dev/c-mode-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** CLOJURE-MODE CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/clojure-cfg.el")
;; (load "~/.archemacs/INI/dev/clojure-cfg.el")
(load (expand-file-name "INI/dev/clojure-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** UNITY CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/unity-cfg.el")
;; (load "~/.archemacs/INI/dev/unity-cfg.el")
;; (load (expand-file-name "INI/dev/unity-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** JS-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/js-cfg.el") 
;; (load "~/.archemacs/INI/dev/js-cfg.el")
(load (expand-file-name "INI/dev/js-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** FORMATS-MOD CUSTOMIZATION
;; (find-file-other-frame "~/.archemacs/INI/dev/formats-mods-cfg.el")
;; (load "~/.archemacs/INI/dev/formats-mods-cfg.el")
(load (expand-file-name "INI/dev/formats-mods-cfg.el" user-emacs-directory))
;; --------------------------------------
;; ** FLYCHECK CUSTOMIZATION
;; (load "~/.archemacs/INI/dev/flycheck-cfg.el")
(load (expand-file-name "INI/dev/flycheck-cfg.el" user-emacs-directory))
;; (find-file "~/.archemacs/INI/flycheck-cfg.el") 
;; --------------------------------------
;; ** DEVELOPMENT SETINGS CUSTOMIZATION
(setq compilation-scroll-output nil)
;; (defun my-compilation-finish-function (buffer desc)
;;   (message "Buffer %s: %s" buffer desc)
;;  (evil-goto-first-line)
;;  )
;; (add-to-list 'compilation-finish-functions 'my-compilation-finish-function)

;;  --------------------------------------
(global-set-key (kbd "<f8>") nil)
(global-set-key(kbd "<f8> <f8>") '(lambda() (interactive)
        ;; (save-buffer)
        (save-some-buffers 'no-confirm)
        (org-save-all-org-buffers)
        (evil-normal-state)
        (let ((curent-buffer (buffer-name)))
          (select-frame-by-name "*compilation*")
          (recompile)
          (select-frame-by-name curent-buffer))))       

;; (setq compilation-scroll-output nil)
;; (add-to-list 'compilation-finish-functions 'my-compilation-finish-function)
;;  --------------------------------------

;;  --------------------------------------
(global-set-key (kbd "M-<f8>") nil)
(global-set-key (kbd "M-<f8> M-<f8>") '(lambda() (interactive)
                (save-buffer)
                (evil-normal-state)
                (compile
                 (read-string
                    (concat
                      "defult(" (buffer-name) "):")
                    (buffer-file-name)
                    nil
                    (buffer-name)))))
;; --------------------------------------

;;  --------------------------------------
(define-key evil-visual-state-map (kbd "M-<f8>") nil)
(define-key evil-visual-state-map (kbd "M-<f8> M-<f8>") '(lambda() (interactive)
                (setq region-text (buffer-substring (region-beginning) (region-end)))
                (save-buffer)
                (evil-normal-state)
                (compile
                 (read-string
                    (concat
                      "defult(" (buffer-name) "):")
                    (concat
                        (buffer-file-name)
                        " -p "
                        region-text)
                    nil
                    (buffer-name)))))

(define-key evil-visual-state-map (kbd "M-<f8> M-<f7>") '(lambda() (interactive)
                (setq region-text (buffer-substring (region-beginning) (region-end)))
                (save-buffer)
                (evil-normal-state)
                (compile
                 (read-string
                    (concat
                      "defult(" (buffer-name) "):")
                    region-text
                    nil
                    (buffer-name)))))
;; --------------------------------------
;; *** --------------------------------------

;;  --------------------------------------
(define-key org-mode-map (kbd "<f8>") nil)

(defvar my/org-saved-buffer nil
  "Buffer saved for remote org-babel execution.")

(defun my/org-save-current-buffer ()
  "Save the current buffer globally to use later."
  (interactive)
  (setq my/org-saved-buffer (buffer-name))
  (message "Saved buffer: %s" (buffer-name)))

(defun my/org-run-remote-or-local-src-block ()
  "Execute src block either in saved buffer (if exists)
or locally if not saved."
  (interactive)
  (evil-normal-state)
  (save-excursion
    (let ((origin-buffer (buffer-name)))
      (if my/org-saved-buffer
          (progn
            ;; Переключаемся в сохранённый буфер
            ;; (switch-to-buffer my/org-saved-buffer)
            (select-frame-by-name my/org-saved-buffer)
            (message "Executing in saved buffer: %s" (buffer-name))
            (org-babel-goto-named-src-block "auto-tangle-block")
            (org-babel-execute-src-block)
            ;; Возвращаемся
            ;; (switch-to-buffer origin-buffer))
            (select-frame-by-name origin-buffer))
        ;; Если нет – выполняем тут же
          (progn (org-babel-goto-named-src-block "auto-tangle-block")
                 (org-babel-execute-src-block))))))

;; Привязки клавиш
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "<f8> <S-f8>") #'my/org-save-current-buffer)
  (define-key org-mode-map (kbd "<f8> <f8>") #'my/org-run-remote-or-local-src-block))

(define-key org-mode-map (kbd "<f8> <f7>")
      '(lambda() (interactive)
        (save-excursion
          (progn
            (setq org-src-preserve-indentation t)
            (untabify (point-min) (point-max))
            ;; (save-buffer)
            (save-some-buffers 'no-confirm)
            ;; (universal-argument)
            ;; (universal-argument)
            (org-babel-tangle)
            ;; (save-buffer)
            ;; (save-some-buffers 'no-confirm)
            (org-save-all-org-buffers)
            (evil-normal-state)
            (let ((origen-buffer (buffer-name)))
              (select-frame-by-name "*compilation*")
              (recompile)
              (select-frame-by-name origen-buffer))))))
;; --------------------------------------

  (add-hook 'prog-mode-hook '(lambda ()
;; *** line-numbers-mode
    ;; (setq display-line-numbers-mode t)
    (display-line-numbers-mode t)
;; *** flycheck-mode
    (flycheck-mode t)
;; *** highlight-indentation-mode : 
    (highlight-indentation-mode t)
;; *** projectile-mode : 
    (projectile-mode +1)

;; *** outshine-mode:
    ;; #'outshine-mode on in outshine cfg
    ;; (find-file-other-frame "~/.archemacs/INI/outshine_cfg.el")
    ;; (outshine-mode t)
    ;; (outline-minor-mode t)
;; *** end prog-mode-hook
    ))
;; --------------------------------------

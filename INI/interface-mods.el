;; * IVY CUSTOMIZATION
;; --------------------------------------
(require 'use-package)
(use-package ivy :ensure t
  ;; :init
  ;; (elpy-enable)
  :config
  (ivy-mode 1)
  (ido-mode nil)
  )
;;  --------------------------------------
;; * AVY CUSTOMIZATION
;; --------------------------------------
(use-package avy :ensure t
  ;; :init
  ;; (elpy-enable)
  :config
    (define-key evil-normal-state-map (kbd "M-f") 'avy-goto-word-1)
    (define-key evil-normal-state-map (kbd "M-F") 'avy-goto-char-timer)
    (define-key evil-normal-state-map (kbd "f") 'evil-avy-goto-char-in-line)
    (define-key evil-visual-state-map (kbd "f") 'evil-avy-goto-char-in-line)
    (define-key evil-normal-state-map (kbd "F") nil)
    (define-key evil-visual-state-map (kbd "F") nil)
    ;; (define-key evil-normal-state-map (kbd "FF") 'khaoos-evil-find-char)
    ;; (define-key evil-visual-state-map (kbd "FF") 'khaoos-evil-find-char)
    (define-key evil-normal-state-map (kbd "FF") 'evil-find-char)
    (define-key evil-visual-state-map (kbd "FF") 'evil-find-char)
    (define-key evil-normal-state-map (kbd "FJ") 'avy-goto-word-1-below)
    (define-key evil-visual-state-map (kbd "FJ") 'avy-goto-word-1-below)
    (define-key evil-normal-state-map (kbd "FK") 'avy-goto-word-1-above)
    (define-key evil-visual-state-map (kbd "FK") 'avy-goto-word-1-above)
    (define-key evil-normal-state-map (kbd "FH") 'avy-goto-char-timer)
    (define-key evil-visual-state-map (kbd "FH") 'avy-goto-char-timer)
    (define-key evil-normal-state-map (kbd "FL") 'avy-goto-char-timer)
    (define-key evil-visual-state-map (kbd "FL") 'avy-goto-char-timer)
    ;; (define-key evil-normal-state-map (kbd "Ff") 'khaoos-evil-find-char-backward)
    ;; (define-key evil-visual-state-map (kbd "Ff") 'khaoos-evil-find-char-backward)
    (define-key evil-normal-state-map (kbd "Ff") 'evil-find-char-backward)
    (define-key evil-visual-state-map (kbd "Ff") 'evil-find-char-backward)
  )
;; --------------------------------------
;; * DIMINISH CUSTOMIZATION
;; --------------------------------------
(use-package diminish
  :ensure t
  :demand t
  ;; :init
  :config
  (diminish 'which-key-mode)
  ;; (diminish 'linum-relative-mode)
  ;; (diminish 'hungry-delete-mode)
  ;; (diminish 'subword-mode)
  ;; (diminish 'beacon-mode)
  ;; (diminish 'irony-mode)
  ;; (diminish 'page-break-lines-mode)
  ;; (diminish 'auto-revert-mode)
  (diminish 'rainbow-delimiters-mode)
  (diminish 'rainbow-mode)
  (diminish 'org-roam-ui-mode)
  (diminish 'yas-minor-mode)
  ;; (diminish 'yas-minor-mode)
  ;; (diminish 'flycheck-mode)
  (diminish 'ivy-mode)
  (diminish 'outshine-mode)
  ;; (diminish 'outshine)
  ;; (diminish 'outline-mode)
  (diminish 'company-fuzzy-mode " CpF")
  (diminish 'outline-minor-mode)
  (diminish 'ComFuz-mode)
  ;; (diminish 'subword-mode)
  (diminish 'visual-line-mode)
  ;; (diminish '+3-mode)
  (diminish 'helm-mode))
;; --------------------------------------
;; * WHICH-KEY CUSTOMIZATION
;; --------------------------------------
(use-package which-key
  :ensure t
  :config
    (which-key-mode))
;; --------------------------------------

;;  --------------------------------------
;; * POWERLINE CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/interface/powerline-cfg.el")
;; (load "~/.archemacs/INI/interface/powerline-cfg.el")
(load (expand-file-name "INI/interface/powerline-cfg.el" user-emacs-directory))
;; --------------------------------------
;; * INPUT-METHODS CUSTOMIZATION: 
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/interface/input-methods-cfg.el")
;; (load "~/.archemacs/INI/interface/input-methods-cfg.el")
(load (expand-file-name "INI/interface/input-methods-cfg.el" user-emacs-directory))
;; --------------------------------------

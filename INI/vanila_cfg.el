(setq inhibit-startup-message t) ;; hide the startup message
(tool-bar-mode -1)
(menu-bar-mode -1)
;; ------------------------------------------------------
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
;; ------------------------------------------------------
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 75))
;; ------------------------------------------------------
(defalias 'yes-or-no-p 'y-or-n-p)
;; ------------------------------------------------------

(load-theme 'material t) ;; load material theme

(set-language-environment "UTF-8")
(add-to-list 'default-frame-alist
             '(font . "Ubuntu Mono"))

;; Включаем emoji!
(when (member "Noto Color Emoji" (font-family-list))
  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend))
;; ------------------------------------------------------

(setq-default tab-width 8) 
(setq-default indent-tabs-mode nil)

(global-display-line-numbers-mode 0)

(global-visual-line-mode t)

;; This can also be turned on using the menu bar, via
;; Options -> Line Wrapping in this Buffer -> Word Wrap
(setq-default truncate-lines nil)
(setq-default line-move-visual t)
(setq-default word-wrap t)
(setq truncate-lines nil)
(setq line-move-visual t)
(setq word-wrap t)

(show-paren-mode 1)
;; for working with pair-able characters
;; lightweight package electric, which provided by Emacs out of the box.
(electric-pair-mode 1)

(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-<") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)

(global-set-key (kbd "M-)") 'delete-pair)
(global-set-key (kbd "M-}") 'delete-pair)
(global-set-key (kbd "M-]") 'delete-pair)
(global-set-key (kbd "M->") 'delete-pair)

(set-input-method "russian-computer")
(global-set-key (kbd "C-^") 'toggle-input-method)

(setq backup-directory-alist '(("." . "~/.archemacs/backups")))
;; Never silently delete old backups.
;; (setq delete-old-versions -1)
;; Use version numbers for backup files.
;; (setq version-control t)
(setq auto-save-default nil)
(setq make-backup-files t)

(when window-system (add-hook 'prog-mode-hook 'hl-line-mode))
(scroll-bar-mode -1)

    (set-face-background 'region "blue3")

(add-to-list 'default-frame-alist '(height . 25))
(add-to-list 'default-frame-alist '(width . 75))

(when (member "Twitter Color Emoji" (font-family-list))
  (set-fontset-font
   t 'symbol (font-spec :family "Twitter Color Emoji") nil 'prepend))

(defun buyn-menu-bar-open ()
  "Show Menu bar on all frames
    and open menu 
    set f10 to (buyn-menu-bar-close)"
  (interactive)
  (menu-bar-mode 1)
  (menu-bar-open)
  (global-set-key (kbd "<f10>") 'buyn-menu-bar-close)
  )

(defun buyn-menu-bar-close()
  "Hide Menu bar on all frames
    and set f10 to (buyn-menu-bar-open)"
  (interactive)
  (menu-bar-mode -1)
  ;; (menu-bar-open)
  (global-set-key (kbd "<f10> <f10>") 'buyn-menu-bar-open)
  )

(global-set-key (kbd "<f10>") nil)
(global-set-key (kbd "<f10> <f10>") 'buyn-menu-bar-open)
;; ------------------------------------------------------

(setq initial-scratch-message ";; * This buffer for Lisp evaluation.
;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with \\[find-file] and enter text in its buffer.
;; 
;;| |_| |_| |           | |_| |_| |
;; \\ _____ /      o_     \\ _____ /
;;  |     |       |_|     |     |
;;  |  |  |       |       |  |  |
;;  |   _ l _   _ | _   _ l _   |
;;  |  | |_| |_| ||| |_| |_| |  |
;;  |  |                     |  |
;;  || |                     | ||
;;  |  |        _____        |  |
;;  |  |       /_|_|_\\       |  |
;;  |  |      /|_|_|_|\\      |  |
;;  |  |      ||_|_|_||      |  |
;;  |  |      ||_|_|_||      |  |
;;  |__|      ||_|_|_||      |__|
;; /   |      ||_|_|_||      |   \\
;; =================================
;; * Whenever I open Emacs, I feel inspired. 
;; Like a craftsman entering his workshop, I feel a realm of possibility open before me. I feel the comfort of an environment that has evolved over time to fit me perfectly—an assortment of packages and key bindings that help me bring ideas to life day after day.
")

(custom-set-variables
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 ;; Finally got around to customizing the vertical split to be the default one (last line in the config):
 ;; '(ediff-diff-options "-w")
 '(ediff-split-window-function 'split-window-horizontally))

(require 'ido)
(ido-mode t)

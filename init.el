;; --------------------------------------
;; .emacs --- Emacs configuration
;; --------------------------------------
;; * Start of manual file
;; --------------------------------------
;; (find-file-other-window "~/.archemacs/INI/init.el")
;; (load "~/.archemacs/INI/init.el")
(load (expand-file-name "INI/init.el" user-emacs-directory))
;; (find-file-other-window "~/.archemacs/INI/init-light.el")
;; (load (expand-file-name "INI/init-light.el" user-emacs-directory))
;; --------------------------------------
;; ** End of manual file
;; --------------------------------------
;; --------------------------------------
;; * START OF AUTOMATION 
;; --------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(gptel-model "gpt-3.5-turbo-16k")
 '(package-selected-packages
	 '(which-key diminish magit ranger yaml-mode yasnippet-snippets skewer-mode reverse-im read-aloud rainbow-delimiters quelpa-use-package projectile powerline plantuml-mode outshine org-roam-ui org-brain ob-translate miracle minimap material-theme lua-mode jedi ivy hydra hledger-mode graphviz-dot-mode gptel gpt flycheck expand-region evil-tabs elpy company-jedi company-fuzzy better-defaults avy ahk-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((((background dark)) (:background "#454590" :extend t)) (t (:background "#A84708FE0FFF" :extend t))))
 '(mode-line ((t (:foreground "Black" :background "DarkOrange" :box nil)))))

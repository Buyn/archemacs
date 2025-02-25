(load (expand-file-name "INI/init.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(package-selected-packages
   '(aider w3m emms ytel-show ytel burly lsp-treemacs lsp-ivy lsp-ui clj-refactor cider lsp-mode parinfer-rust-mode which-key diminish magit ranger yaml-mode yasnippet-snippets skewer-mode reverse-im read-aloud rainbow-delimiters quelpa-use-package projectile powerline plantuml-mode outshine org-roam-ui org-brain ob-translate miracle minimap material-theme lua-mode jedi ivy hydra hledger-mode graphviz-dot-mode gptel gpt flycheck expand-region evil-tabs elpy company-jedi company-fuzzy better-defaults avy ahk-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "Black" :background "DarkOrange" :box nil)))))

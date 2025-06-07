(load (expand-file-name "INI/init.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(gptel-model "gpt-4o-mini")
 '(package-selected-packages
	 '(avy better-defaults burly clj-refactor company-fuzzy company-jedi
				 diminish elpy emms evil-tabs expand-region flycheck gptel
				 graphviz-dot-mode hledger-mode jedi lsp-ivy lsp-ui lua-mode
				 magit material-theme miracle ob-translate org org-brain
				 outshine parinfer-rust-mode plantuml-mode powerline
				 projectile quelpa-use-package rainbow-delimiters ranger
				 reverse-im skewer-mode spacemacs-theme which-key
				 yasnippet-snippets zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "Black" :background "DarkOrange" :box nil)))))

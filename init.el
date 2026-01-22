(load (expand-file-name "INI/init.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(gptel-model 'gemini-flash-lite-latest)
 '(package-selected-packages
   '(aider avy cider clj-refactor company-fuzzy company-jedi diminish
           elpy emms evil-tabs expand-region flycheck gpt gptel
           graphviz-dot-mode hledger-mode hydra ivy jedi lsp-ivy
           lsp-mode lsp-treemacs lsp-ui lua-mode magit material-theme
           miracle ob-translate org-appear org-brain org-roam-ui
           outshine parinfer-rust-mode plantuml-mode powerline
           projectile quelpa-use-package rainbow-delimiters ranger
           reverse-im skewer-mode w3m which-key yasnippet-snippets
           ytel ytel-show))
 '(safe-local-variable-values
   '((eval progn (auto-revert-mode 1))
     (eval progn (setq comment-start "#") (outshine-mode t)
           (auto-revert-mode 1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "Black" :background "DarkOrange" :box nil)))))

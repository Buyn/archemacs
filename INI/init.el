;; (load "~/.archemacs/INI/inpak.el")
(load (expand-file-name "INI/inpak.el" user-emacs-directory))

;; (load "~/.archemacs/INI/vanila_cfg.el")
(load (expand-file-name "INI/vanila_cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/evil-mod-cfg.el")
(load (expand-file-name "INI/evil-mod-cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/interface-mods.el")
(load (expand-file-name "INI/interface-mods.el" user-emacs-directory))

;; (load "~/.archemacs/INI/org-cfg.el")
(load (expand-file-name "INI/org-cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/FIN/fin.el")
(load (expand-file-name "INI/FIN/fin.el" user-emacs-directory))

;; (load "~/.archemacs/INI/frame-control.el")
(load (expand-file-name "INI/frame-control.el" user-emacs-directory))

;; (load "~/.archemacs/INI/folding-cfg.el")
(load (expand-file-name "INI/folding-cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/lit-cfg.el")
(load (expand-file-name "INI/lit-cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/dev-cfg.el")
(load (expand-file-name "INI/dev-cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/hydra-cfg.el")
(load (expand-file-name "INI/hydra-cfg.el" user-emacs-directory))

(use-package eww
  :config
  ;; (load "~/.archemacs/INI/www-cfg.el")
	(load (expand-file-name "INI/www-cfg.el" user-emacs-directory)))

;; (load "~/.archemacs/INI/advnsed-selections-cfg.el")
(load (expand-file-name "INI/advnsed-selections-cfg.el" user-emacs-directory))

;; (load "~/.archemacs/INI/AI/ai.el")
(load (expand-file-name "INI/AI/ai.el" user-emacs-directory))

;; (load "~/.archemacs/ELs/BuYn/shell.el")
(load (expand-file-name "ELs/BuYn/shell.el" user-emacs-directory))

(load "~/Dropbox/backup/file.el")

(message "Load of init.el is ended")

(load (expand-file-name "INI/inpak.el" user-emacs-directory))

(load (expand-file-name "INI/vanila_cfg.el" user-emacs-directory))

(load (expand-file-name "INI/evil-mod-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/interface-mods.el" user-emacs-directory))

(load (expand-file-name "INI/org-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/file-mng-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/hydra-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/frame-control.el" user-emacs-directory))

(load (expand-file-name "INI/auto-cfg.el" user-emacs-directory))

;; (load (expand-file-name "INI/folding-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/lit-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/dev-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/FIN/fin.el" user-emacs-directory))

(use-package eww
  :defer t
  :config
  (load (expand-file-name "INI/www-cfg.el" user-emacs-directory)))

(load (expand-file-name "INI/advnsed-selections-cfg.el" user-emacs-directory))

(load (expand-file-name "INI/AI/ai.el" user-emacs-directory))

(load (expand-file-name "INI/other/calc.el" user-emacs-directory))

(load (expand-file-name "INI/other/telegram.el" user-emacs-directory))

(load (expand-file-name "ELs/BuYn/shell.el" user-emacs-directory))

;; (load "~/Dropbox/backup/file.el")
(let ((file-path "~/Dropbox/backup/file.el"))
  (when (file-exists-p file-path)
    (load file-path)))

(let ((file-path
       (concat
        "~/.emacs.d/"
        (nth 0 (split-string
                (with-temp-buffer
                  (insert-file-contents "/etc/hostname")
                  (buffer-string))))
        ".el")))
  (when (file-exists-p file-path)
    (load file-path)))

(message "Load of init.el is ended")

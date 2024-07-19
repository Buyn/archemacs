;; --------------------------------------
;; init.el --- Emacs configuration
;; * used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; --------------------------------------
;; * AHK-MODE CUSTOMIZATION
;; --------------------------------------
;; ** install ahk-mode : 
(use-package ahk-mode
	:ensure t
;; ** :config : 
	:config
;; ** autoload : 
    ;; (autoload 'ahk-mode "ahk-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))
    (add-to-list 'interpreter-mode-alist '("ahk" . ahk-mode))
;; ** 	) : 
	)
;; *  --------------------------------------

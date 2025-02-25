;; * LUA-MOD CUSTOMIZATION
;; --------------------------------------
;; ** install lua-mode : 
(require 'use-package)
(use-package lua-mode 
  :ensure t
  :init
  ;; (elpy-enable)
;; ** :config : 
  :config
;; ** command : 
  ;; 2. Next, you need to make sure that lua-mode.el is on your load-path (and optionally byte-compile it) and to set up Emacs to automatically enable it for *.lua files or ones that contain lua hash-bang line (`#!/usr/bin/lua`). Putting this snippet to .emacs should be enough in most cases:
    ;;;; This snippet enables lua-mode
    ;; This line is not necessary, if lua-mode.el is already on your load-path
    ;; (add-to-list 'load-path "/path/to/directory/where/lua-mode-el/resides")
;; ** autoload : 
    (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
    (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;; ** ) : 
  )
;; --------------------------------------

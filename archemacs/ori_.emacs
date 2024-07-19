
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-linum-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;To customize the default font and color, type
;; M-x customize-face RET default RET.

;;To customize the default syntax highlighter (also called “font locking”) type
;;M-x customize-group RET font-lock-faces RET.

;;Hiding the splash screen and banner
;;(setq inhibit-startup-message t
;;inhibit-startup-echo-area-message t)  
(add-to-list 'load-path "d:/Development/lisp/Moduls")

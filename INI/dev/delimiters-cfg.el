;; * DELIMITERS-MOD CUSTOMIZATION
;; --------------------------------------
;; ** rainbow-delimiters
;; *** install
;; M-x package-install RET rainbow-delimiters RET
(require 'use-package)
(use-package rainbow-delimiters :ensure t
;; *** :config
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (custom-theme-set-faces
    'material
    `(rainbow-delimiters-depth-1-face ((t
        (:foreground ,"aquamarine"))))
    )
;; *** END )
  )
;; *** Docs 
;; **** links:
;; https://github.com/Fanael/rainbow-delimiters
;; http://emacs-fu.blogspot.com/2011/05/toward-balanced-and-colorful-delimiters.html
;; **** Customization:
;; To customize rainbow-delimiters mode, you can use:

;; M-x customize-group rainbow-delimiters
;; (customize-group "rainbow-delimiters")
;; Color Scheme

;; customize-group rainbow-delimiters-faces has the faces for successive nested pairs of delimiters. You can change them through emacs customize or in your color theme or dot-emacs.

;; The face rainbow-delimiters-unmatched-face is used for unmatched closing delimiters.

;; Zenburn and Solarized themes have their own colors for these faces.

;; deftheme/color-theme.el: Further information is at the top of rainbow-delimiters.el.
;; Stop Highlighting Certain Delimiters

;; You can disable highlighting of any of the supported delimiter types through the customize interface, in the Toggle Delimiters section.
;; ** parinfer
;; *** install
(use-package parinfer
  :disabled
  :defer t
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
            paredit        ; Introduce some paredit commands.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode))
;; *** END )
  )
;; ** parinfer-rust-mode
;; *** install
(use-package parinfer-rust-mode
  ;; :disabled
  :defer t
  :ensure t
  ;; :hook emacs-lisp-mode
  ;; :init
    ;; (setq parinfer-rust-auto-download t)
  :config
    (setq  parinfer-rust-disable-troublesome-modes t)
    ;; (parinfer-rust-mode -1)
    (add-hook 'clojure-mode-hook #'parinfer-rust-mode)
    ;; (add-hook 'emacs-lisp-mode-hook #'parinfer-rust-mode)
    ;; (add-hook 'common-lisp-mode-hook #'parinfer-rust-mode)
    ;; (add-hook 'scheme-mode-hook #'parinfer-rust-mode)
    ;; (add-hook 'lisp-mode-hook #'parinfer-rust-mode)
;; *** END )
  )

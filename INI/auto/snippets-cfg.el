;; * SNIPPETS  CUSTOMIZATION
;; ** yasnippet 
;; *** del: 
;; (unless (package-installed-p 'yasnippet)
;;   (package-install 'yasnippet))
;; только если устанавливать в ручную
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/yasnippet")

;; *** use-package:
(use-package yasnippet
  :defer t
  :ensure t
  ;; :disabled
  ;; :init
;; *** :config : 
  :config
    (use-package yasnippet-snippets
      :ensure t
      :defer t)

  ;; (yas/initialize)
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (yas-global-mode 1)
;; *** ===========END========= ) : 
  )
;; ** yasnippet-snippets 
;; (unless (package-installed-p 'yasnippet-snippets)
;;   (package-install 'yasnippet-snippets))
;; (require 'yasnippet-snippets)

;; (unless (package-installed-p 'emacs-snippets)
;;   (package-install 'emacs-snippets))
;; (add-to-list 'load-path "~/path/to/yasnippet")
;; ;; Load the library
;; (require 'yasnippet)
;; (yas/initialize)
;; ;; Load the snippet files themselves
;; (yas/load-directory "~/path/to/yasnippet/snippets/text-mode")
;; ** Let's have snippets in the auto-complete dropdown
;; (add-to-list 'ac-sources 'ac-source-yasnippet)
;; --------------------------------------

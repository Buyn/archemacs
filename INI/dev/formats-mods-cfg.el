;; * MODS CUSTOMIZATION 
;; ** yaml-mode
;; *** load
;; (add-to-list 'load-path "~/ELs/formats/YAML/yaml-mode.el")
;; (find-file-other-frame "~/ELs/formats/YAML/yaml-mode.el")
;; *** use-package read-aloud : 
(use-package yaml-mode
  ;; :ensure t
  ;; :load-path "ELs/formats/YAML/yaml-mode.el"
  :load-path "ELs/formats/YAML/"
  ;; :init
;; *** :config : 
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.rul\\'" . yaml-mode))
  )

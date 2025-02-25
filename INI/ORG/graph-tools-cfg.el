;; * PLANTUML MODE
;; ** plantuml use-package: 
(use-package plantuml-mode :ensure t
;; *** :init :
  ;; :init
;; *** :config :
  :config
  (setq org-plantuml-jar-path 
    (expand-file-name "~/AddApps/plantuml/plantuml.jar"))
  (setq plantuml-jar-path "~/AddApps/plantuml/plantuml.jar")
  (setq plantuml-default-exec-mode 'jar)
  ;; (setq plantuml-output-type "txt")
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 
    'org-babel-load-languages 
    '((plantuml . t)))
  (define-key plantuml-mode-map (kbd "<f8>") '(lambda() (interactive)
          (save-some-buffers 'no-confirm)
          (org-save-all-org-buffers)
          (evil-normal-state)
          (plantuml-preview 1)))        
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
;; *** end use-package :
  )

;; *** --------------------------------------

;; * GRAPHVIZ-DOT
;; ** GRAPHVIZ DOT MODE:
(use-package graphviz-dot-mode :ensure t
;; *** :init :
  ;; :init
;; *** :config :
  :config
    (setq graphviz-dot-indent-width 4)
    (setq graphviz-dot-dot-program (expand-file-name  "~/AddApps/Graphviz/bin/dot.exe"))
;; *** end use-package :
  )

;; *** --------------------------------------

;; ** ORG BABEL OB-DOT:
;; (add-to-list 'load-path "~/ELs/Org/Babel/ob-dot.el")
(use-package ob-dot
;; *** :ensure :
  ;; :ensure t
;; *** :init :
  ;; :init
  ;; (add-to-list 'load-path "~/ELs/Org/Babel/ob-dot.el")
;; *** :disabled : 
  ;; :disabled
;; *** :load-path:
  ;; :load-path "ELs/Org/Babel/ob-dot.el"
  :load-path "ELs/Org/Babel/"
;; *** :config :
  :config
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((dot . t)))
;; *** end use-package :
  )

;; *** --------------------------------------

;; ** COMPANY GRAPHVIZ DOT:
(use-package company-graphviz-dot
  :disabled
  :ensure t)
;;  --------------------------------------
;; * DITAA MODE
(use-package ob-ditaa 
  ;; :init
  :config
  (setq org-ditaa-jar-path "~/AddApps/ditaa/ditaa0_9.jar")
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((ditaa . t))) ; this line activates ditaa
  )
;;  --------------------------------------

;; * ARTIST MODE
(add-hook 'artist-mode-hook (lambda ()
  ;; (local-set-key (kbd "<f1>") 'org-mode)
  (local-set-key (kbd "<f2>") 
    'artist-select-op-pen-line) ; f2 = pen mode
  (local-set-key (kbd "<f3>") 
    'artist-select-op-line)     ; f3 = line
  (local-set-key (kbd "<f4>") 
    'artist-select-op-square)   ; f4 = rectangle
  (local-set-key (kbd "<f5>") 
    'artist-select-op-ellipse)  ; f5 = ellipse
  (local-set-key (kbd "<f6>") 
    'artist-select-op-erase-rectangle)  ; f6 = erase
  (local-set-key (kbd "<f7>") 
    'artist-select-op-spray-can)  ; f7 = spray
  ;; (local-set-key (kbd "C-z") 'undo)
  ))
;; ** --------------------------------------

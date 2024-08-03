;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/lit-cfg.el")
;; (find-file-other-frame "~/INI/lit-cfg.el") 
;; --------------------------------------
;; *  --------------------------------------
;; * TRANSLATE-MOD CUSTOMIZATION 
;; *** ob-translate
;; **** use-package ob-translate 
(use-package popup :ensure t)
(use-package ob-translate :ensure t
;; (package-refresh-contents)
  ;; :init
  :config
  (add-to-list 'org-babel-load-languages '(translate . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  ;; add translate special block into structure template alist.
  ;; (add-to-list 'org-structure-template-alist '("t" . "src translate"))
  ;; (add-to-list 'org-structure-template-alist '("tr" . "src translate :dest ru"))
	(add-to-list 'org-structure-template-alist '("t" "#+BEGIN_SRC translate ? \n\n#+END_SRC\n"))
	(add-to-list 'org-structure-template-alist '("tr" "#+BEGIN_SRC translate :dest ru ? \n\n#+END_SRC\n"))
  )
;; **** --------------------------------------
;; *** google-translate
;; **** use-package google-translate
(use-package google-translate
  :ensure t
  :custom
  (google-translate-backend-method 'emacs)
  :config
  (require 'google-translate-smooth-ui)
  (setq google-translate-translation-directions-alist
        '(("ru" . "en") ("en" . "ru") ("ru" . "uk")))
  (setq google-translate-output-destination nil)
  (setq google-translate-pop-up-buffer-set-focus t)
  (setq google-translate-default-source-language "ru")
  (setq google-translate-default-target-language "en")
  ;; (global-set-key "\C-ct" 'google-translate-smooth-translate)
	(define-key evil-normal-state-map (kbd "M-a M-l M-o") 'google-translate-smooth-translate)
	(define-key evil-normal-state-map (kbd "M-a M-l M-l") 'google-translate-at-point)
	(define-key evil-normal-state-map (kbd "M-a M-l M-j") 'google-translate-at-point)
	(define-key evil-normal-state-map (kbd "M-a M-l M-k") 'google-translate-at-point-reverse)
  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130)))
;; **** --------------------------------------
;; *** go-translate
;; **** use-package go-translate
(use-package go-translate :ensure t
  ;; :init
	:disabled
  :config
	(setq go-translate-local-language "ru")
	(setq go-translate-target-language "en")
	(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  )
;; **** --------------------------------------
;; *  --------------------------------------

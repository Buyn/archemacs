;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; uncoment Evil
;; * used in
;; (find-file "~/INI/org-cfg.el")
;; --------------------------------------
;; * ORG BRAIN CUSTOMIZATION
;; ** org-brain use-package: 
(use-package org-brain :ensure t
;; *** :init : 
  :init
;; **** org-brain-path : 
;; 2 Configure org-brain-path (defaults to /brain in your org-directory) to a directory
;;  where you want to put your org-brain files (which could be the location where you
;;  already keep your org files if you wish to transform your existing org files into
;;  org-brain files). You can set this with the example config presented above or
;;  through M-x customize-group RET org-brain.
  (setq org-brain-path "~/Dropbox/orgs/org-Brain")
;; ****  Evil : 
;; For Evil users
;; 3 If you’re an evil user, you’ll want to add (evil-set-initial-state
;;  'org-brain-visualize-mode 'emacs) to your org-brain configuration.
  ;; (with-eval-after-load 'evil
  ;;   (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
;; *** :config : 
  :config
;; **** bind-key : 
;; 5 org-brain-prefix-map can be bound to a key to make org-brain commands more
;;  accessable if you edit entries from org-mode. See Editing from org-mode under
;;  Usage below.
  (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
	(define-key org-brain-visualize-mode-map (kbd "M-f") 'avy-goto-word-1)
	(define-key org-brain-visualize-mode-map (kbd "S-C-<return>")
		'(lambda() (interactive)
			(push-button)
			(org-brain-goto-current) 
			(let (buffer-name-to-close (buffer-name))
			(evil-quit)
			(switch-to-buffer-other-frame buffer-name-to-close))))
	(define-key org-brain-visualize-mode-map (kbd "C-<return>")
		'(lambda() (interactive)
				(push-button)
				(org-brain-goto-current) 
				(let (buffer-name-to-close (buffer-name))
				(evil-quit)
				(org-brain-visualize-back)
				(switch-to-buffer-other-frame buffer-name-to-close))))
;; *org-brain*

;; **** org-id : 
;; 4 org-brain use org-id in order to speed things up. Because of this, the variable
;;  org-id-track-globally should be t (which it already is by default). You may want to
;;  modify org-id-locations-file too. If you add entries to org-brain directly from
;;  org-mode you must assign headliens an ID. A comfortable way to do this is with
;;  the command org-brain-ensure-ids-in-buffer. Even more comfortable is to add that
;;  to before-save-hook, so that it runs when saving.
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/Dropbox/orgs/org-Brain/.org-id-locations")
  ;; (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
;; **** org-capture-templates : 
;; 6 You might want to add information at the end of an entry, without visiting the file. A
;;  way to do this is to use a capture template, such as the one presented above.
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
;; **** org-brain-visualize : 
;; 7 If you have a lot of entries, it might take some time to gather information about all
;;  entries when using org-brain-visualize. You could change the value of
;;  org-brain-visualize-default-choices (which is =’all= by default) to only include files,
;;  or even just files in the direct root of org-brain-path.
;; 8 If you feel that org-brain-visualize is too cluttered, you may want to set
;;  org-brain-show-resources and/or org-brain-show-text to nil.
  ;; (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 23)
;; 9 If you have very long entry names, org-brain-visualize may take a lot of horizontal
;;  space. You can cap the shown length of entry titles, by setting
;;  org-brain-title-max-length.
;; **** entries and file entries : 
;; 10 Some users find it confusing having both headline entries and file entries (see
;;  below). It may be preferable to only use headline entries, by setting
;;  org-brain-include-file-entries to nil. If doing this, you should probably also set
;;  org-brain-file-entries-use-title to nil. Another possibility is if you’re only using file
;;  entries, in which case you can set org-brain-scan-for-header-entries to nil.
  ;; (setq org-brain-include-file-entries nil
  ;;       org-brain-file-entries-use-title nil)
;; *** end use-package : 
	)

;; ** polymode use-package: 
;; Allows you to edit entries directly from org-brain-visualize
;; (use-package polymode
;;   :config
;;   (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode))
;; 11 polymode is a package (available on MELPA) which allows for several
;;  major-modes in the same buffer. If you have required the package you can use
;;  M-x org-brain-polymode inside org-brain-visualize, or (as in the example above)
;;  add org-brain-polymode to org-brain-visualize-mode-hook.


;; * --------------------------------------

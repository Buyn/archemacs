;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * ORG-MODE CUSTOMIZATION
;; --------------------------------------
;; ** ---------------     ORG setup
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;;         ;; (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;;         (sequence "NEXT(x)" "WAITING(w)" "VERIFY(v)" "|" "CANCELED(c)" "DELEGATED(g)")))
;; (setq org-agenda-custom-commands
;;       '(("n" occur-tree "NEXT")))
;; --------------------------------------
(require 'org)
(global-set-key [(control f1)] (lambda () (interactive) (find-file-other-frame "~/ORG/start.org")))
(global-set-key [(meta f1)] (lambda () (interactive) (find-file-other-frame "~/ORG/tmp/tmp_links.org")))
(global-set-key [(shift f1)] (lambda () (interactive) (find-file-other-frame "~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org")))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-tags-column -60)
(setq org-adapt-indentation nil)
(setq org-startup-folded t)
(setq org-link-frame-setup
	'((vm . vm-visit-folder-other-frame)
		(vm-imap . vm-visit-imap-folder-other-frame)
		(gnus . org-gnus-no-new-news)
		(file . find-file-other-frame)
		(wl . wl-other-frame)))
;; (global-reveal-mode nil)
(setq org-edit-src-content-indentation 0)
;; (define-key org-mode-map (kbd "M-\~") 'insert-pair)
;; --------------------------------------

;; ** ---------------     ORG TODOs
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        ;; (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "NEXT(x)" 
									"WAITING(w)" 
									"VERIFY(v)" 
									"CR(r)"
									"|" 
									"CANCELED(c)" 
									"DELEGATED(g)")))
;; (setq org-agenda-custom-commands
;;       '(("n" occur-tree "NEXT")))
;; --------------------------------------

;; ** ---------------     ORG Capures
(global-set-key (kbd "C-c c") 'org-capture)
;; (setq org-default-notes-file (concat org-directory "~/org/notes.org"))
(setq org-capture-templates '(
	("t" "Todo" entry
	    (file+headline "~/org/gtd/gtd.org" "Tasks")
	    "* TODO %?\n  %i\n  %a")
	("i" "Todo [inbox]" entry
	    (file+headline "~/org/gtd/inbox.org" "Tasks")
	    "* TODO %i%?")
	("l" "links to transfer" entry
	    (file+headline "~/org/tmp/tmp_links.org" "Tasks")
	    "* TODO %i%?")
	("s" "Sandbox" entry
	    (file+headline "~/org/tmp/sandbox.org" )
	    "* TODO %i%?")
	("T" "Tickler" entry
	    (file+headline "~/org/gtd/tickler.org" "Tickler")
	    "* %i%? \n %U")
	("j" "Journal" entry
	    (file+datetree "~/org/journal.org")
	    "* %?\nEntered on %U\n  %i\n  %a")))
(setq org-refile-targets '(("~/org/gtd/gtd.org" :maxlevel . 3)
                           ("~/org/gtd/someday.org" :level . 1)
                           ("d:/My_Docs/Ofice/PaperFlow/TODO/weekly.org" :level . 1)
                           ("d:/My_Docs/Ofice/PaperFlow/TODO/monthly.org" :level . 1)
                           ("d:/My_Docs/Ofice/PaperFlow/TODO/GTD.org" :level . 1)
                           ("~/org/gtd/tickler.org" :maxlevel . 2)))
;; To define special keys to capture to a particular template without going through the interactive template selection, you can create your key binding like this:
;; (define-key global-map "\C-cx"
;;   (lambda () (interactive) (org-capture nil "x")))
;; https://orgmode.org/manual/Capture-templates.html#Capture-templates
;; ** --------------     Defult Propertys
;; --------------------------------------
(setq org-enforce-todo-dependencies t)
;; Should unfinished children block state changes in the parent? 
(setq org-enforce-todo-checkbox-dependencies t)
;; Should unfinished checkboxes block state changes in the parent?
(setq org-use-property-inheritance t)
;; DEADLINE является одним из этих свойств, которые по умолчанию не наследуются. Вы можете изменить это, настроив переменную
;; User Option: org-confirm-shell-link-function
;;     Function that prompts the user before executing a shell link. 
(setq org-confirm-shell-link-function nil)
;; User Option: org-confirm-elisp-link-function
;;     Function that prompts the user before executing an Emacs Lisp link. 
(setq org-confirm-elisp-link-function nil)
(setq org-log-done t)
;; ** ORG binding : 
;; *** ORG heders : 
;; (define-key evil-normal-state-map
;; 			[C-S-return] 'org-insert-subheading)
(define-key org-mode-map
			[S-M-return] 'org-insert-subheading)
;; (define-key evil-normal-state-map
;; 			[C-M-return] 'org-insert-todo-heading-respect-content)
;; (define-key org-mode-map
;; 			[C-M-return] 'org-insert-todo-heading-respect-content)
;; *** ORG Foldings
;; **** foldings on lavel navigations
(define-key evil-normal-state-map "zj" 'org-forward-element)
(define-key evil-normal-state-map "zk" 'org-backward-element)
(define-key evil-normal-state-map "zh" 'org-up-element)
(define-key evil-normal-state-map "zl" 'org-down-element)
;; it i think in visual not working delate it after resets
(define-key evil-visual-state-map "zj" 'org-forward-element)
(define-key evil-visual-state-map "zk" 'org-backward-element)
(define-key evil-visual-state-map "zh" 'org-up-element)
(define-key evil-visual-state-map "zl" 'org-down-element)
;; **** foldings manipulate
(define-key evil-normal-state-map "zJ" 'org-metadown)
(define-key evil-normal-state-map "zK" 'org-metaup)
(define-key evil-normal-state-map "zH" 'org-shiftmetaleft)
(define-key evil-normal-state-map "zL" 'org-shiftmetaright)
;; **** z[
(define-key evil-normal-state-map "z[" '(lambda() (interactive)
					(outline-up-heading 1)
					))
;; **** z]
(define-key evil-normal-state-map "z]" '(lambda() (interactive)
					(outline-up-heading 3)
					))
;; **** zc
(define-key evil-normal-state-map "zc" '(lambda() (interactive)
					;; (outline-previous-visible-heading 1)
					(move-beginning-of-line nil)
					(org-up-element)
					(hide-subtree)
					))
;; **** zC
(define-key evil-normal-state-map "zC" '(lambda() (interactive)
					(outline-up-heading 1)
					(hide-subtree)
					))
;; *** ORG Table
;; (global-set-key (kbd "C-c <C-return>") 'org-table-insert-row)
;; move to 
;; org-mode-map), which is an interactive autoloaded compiled Lisp
;; (define-key evil-normal-state-map (kbd "C-c <C-return>") 'org-table-insert-row)
(define-key org-mode-map (kbd "C-c <C-return>") 'org-table-insert-row)
;; ** ORG agenda customization
(use-package org-agenda
  :config
;; (find-file-other-frame "~/INI/org_agend_cfg.el")
	(load "~/INI/org_agend_cfg.el"))
;; ** ORG babel 
;; (find-file-other-frame "~/INI/babel-cfg.el")
(load "~/INI/babel-cfg.el")
;; ** ORG-BRAIN 
;; (find-file-other-frame "~/INI/org-brain-cfg.el")
(load "~/INI/org-brain-cfg.el")
;; --------------------------------------

;; * GRAPH ORG TOOLS
;; --------------------------------------
;; (find-file-other-frame "~/INI/ORG/graph-tools-cfg.el")
(load "~/INI/ORG/graph-tools-cfg.el")
;; --------------------------------------

;; * ORG-ROAM CUSTOMIZATION
;; --------------------------------------
;; (find-file-other-frame "~/INI/org-brain-cfg.el")
(load "~/INI/ORG/org-roam-cfg.el")
;; --------------------------------------
;; * ------------------------------------

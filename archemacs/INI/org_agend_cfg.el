;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/org-cfg.el")
;; (find-file-other-frame "~/INI/org-cfg.el")
;; --------------------------------------
;; --------------------- 
;; * ageda setings 
;; --------------------- 
(setq org-agenda-sticky 1)
;; default active on l \ g l
;; (setq org-agenda-log-mode-items '(closed clock))
(setq org-agenda-log-mode-items '(closed clock state))
(setq org-agenda-files '(	
	"~/../Dropbox/orgs/GTD/todo_today.org"
	"~/../Dropbox/orgs/GTD/todo_nottoday.org"))

;; (setq org-agenda-time-grid
;; 		'((daily today require-timed)
;; 		(200 400 600 800 1000 1200 1400 1600 1800 2000 2200 )
;; 		"......" "----------------")
;; 		)

(setq org-agenda-time-grid
		'((daily today require-timed)
		(100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 )
		"......" "----------------")
		)

;; --------------------- 
;; * define-key org-agenda-mode-map
;; --------------------- 
;; ** comments 
;; (define-key org-agenda-mode-map (kbd "H")
;; 	'(lambda () (interactive) 
;; 		(setq current-prefix-arg '(4)) ; C-u
;; 		(call-interactively 'org-agenda-do-date-earlier)))
;; ** g : 
;; --------------------- 
(unbind-key (kbd "g") org-agenda-mode-map)
;; --------------------- 

(define-key org-agenda-mode-map (kbd "g g")
	'(lambda () (interactive) 
		 (org-agenda-redo)
		 (evil-middle-of-visual-line)))

(define-key org-agenda-mode-map (kbd "g j")
	'(lambda () (interactive) 
		 (org-agenda-goto-date)))
	
(define-key org-agenda-mode-map (kbd "g m")
	'(lambda () (interactive) 
		 (evil-middle-of-visual-line)))

(define-key org-agenda-mode-map (kbd "g k")
	'(lambda () (interactive) 
		 (org-agenda-capture)))

(define-key org-agenda-mode-map (kbd "g h")
	'(lambda () (interactive) 
		 (org-agenda-holidays)))

(define-key org-agenda-mode-map (kbd "g l")
	'(lambda () (interactive) 
		 (org-agenda-log-mode)))
	
(define-key org-agenda-mode-map (kbd "g f")
	'(lambda () (interactive) 
		 (toggle-fullscreen-agenda)))
;; --------------------- 

;; ** z : 
;; --------------------- 
(unbind-key (kbd "z") org-agenda-mode-map)
(define-key org-agenda-mode-map (kbd "z n")
	'(lambda () (interactive) 
		 (org-agenda-add-note)))

(define-key org-agenda-mode-map (kbd "z z")
	'(lambda () (interactive) 
			(evil-middle-of-visual-line)
			(evil-scroll-line-to-center (line-number-at-pos))))

(define-key org-agenda-mode-map (kbd "z t")
	'(lambda () (interactive) 
		(evil-scroll-line-to-top  (line-number-at-pos))))

(define-key org-agenda-mode-map (kbd "z b")
	'(lambda () (interactive) 
		(evil-scroll-line-to-bottom  (line-number-at-pos))))

;; ** evil j&k
;; --------------------- 
(define-key org-agenda-mode-map (kbd "j")
	'(lambda () (interactive) 
		 (org-agenda-next-line)))
(define-key org-agenda-mode-map (kbd "k")
	'(lambda () (interactive) 
		 (org-agenda-previous-line)))
;; --------------------- 

;; ** evil c-f&c-b: 
(define-key org-agenda-mode-map (kbd "C-f")
	'(lambda () (interactive) 
		 (evil-scroll-page-down 1)))
(define-key org-agenda-mode-map (kbd "C-b")
	'(lambda () (interactive) 
		 (evil-scroll-page-up 1)))
;; --------------------- 
;; --------------------- 

;; ** P&N : 
;; --------------------- 
(define-key org-agenda-mode-map (kbd "P")
	'(lambda () (interactive) 
		 (evil-scroll-page-up 1)))
(define-key org-agenda-mode-map (kbd "N")
	'(lambda () (interactive) 
		 (evil-scroll-page-down 1)))
;; --------------------- 

;; ** L&H
;; --------------------- 
(define-key org-agenda-mode-map (kbd "L")
	'(lambda () (interactive) 
		 (org-agenda-date-later-minutes 6)))
(define-key org-agenda-mode-map (kbd "H")
	'(lambda () (interactive) 
		 (org-agenda-date-earlier-minutes 6)))
;; --------------------- 

;; ** "C-S-h"&"C-S-l": 
;; --------------------- 
(define-key org-agenda-mode-map (kbd "C-S-l")
	'(lambda () (interactive) 
		 (org-agenda-date-later-hours 3)))
(define-key org-agenda-mode-map (kbd "C-S-h")
	'(lambda () (interactive) 
		 (org-agenda-schedule nil (curent-time-format-hh-mm 1 0))))
;; --------------------- 

;; --------------------- 
;; ** l&h  
;; --------------------- 
(define-key org-agenda-mode-map (kbd "l")
	'(lambda () (interactive) 
		 (org-agenda-date-later-minutes 1)))
(define-key org-agenda-mode-map (kbd "h")
	'(lambda () (interactive) 
		 (org-agenda-date-earlier-minutes 1)))
;; --------------------- 

;; --------------------- 
;; * open ageda on new frame 
;; --------------------- 
;;(setq org-agenda-files (quote ("~/ORG/start.org")))
;;(defun simple-run-command-in-new-frame (command)
;; (select-frame (make-frame))
;; (funcall #'command))

;;(defun run-agenda-in-new-frame ()
;; (run-command-in-new-frame 'org-agenda)
;; (run-command-in-new-frame #'org-agenda)
;;(define-key evil-normal-state-map "gta" 'org-agenda) 
(defun simple-run-command-in-new-frame (command)
  (select-frame (make-frame))
  (funcall #'command))

(define-key evil-normal-state-map (kbd "M-g M-t M-a") '(lambda () (interactive) 
		(simple-run-command-in-new-frame 'org-agenda))) 
;; --------------------- 

;; * Agend ADD new case
;; --------------------- 
;; ** comment : 
 ;; (setq org-agenda-custom-commands 
 ;;      '(("c" "Desk Work" tags-todo "computer" ;; (1) (2) (3) (4)
;; the key to trigger the search ("c")
;; a description of the search for the agenda dispatcher ("Desk Work")
;; the type of search (todo items matching a tag)
;; the tag to search for ("computer")
         ;; ((org-agenda-files '("~/org/widgets.org" "~/org/clients.org")) ;; (5)
         ;;  (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
	 ;;         ("~/computer.html"))
	 ;; specifies that this agenda view should be exported as HTML to "~/computer.html" when the agenda export function is called (C-c a e). 
        ;; ...other commands here
        ;; )))

;; ** org-agenda-custom-commands : 
(setq org-agenda-custom-commands
;; *** Q" . "Custom queries : 
      '(("Q" . "Custom queries") ;; gives label to "Q" 
        ("Qa" "Archive search" search ""
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org")))) 
        ("Qn" "Todo next search" todo "NEXT"
						(
						;; (org-agenda-files (file-expand-wildcards "~/../Dropbox/orgs/GTD/*.org"))
						(org-agenda-files '(		"~/../Dropbox/orgs/GTD/todo_today.org" 
																		;; "~/../Dropbox/orgs/capture/emagus.org" 
																		;; "~/../Dropbox/orgs/capture/Necronomicon.org" 
																		;; "~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																		) 
								))) 
        ("QN" todo "NEXT"
						((org-agenda-files '(		"~/../Dropbox/orgs/GTD/todo_today.org" 
																		;; "~/../Dropbox/orgs/capture/emagus.org" 
																		;; "~/../Dropbox/orgs/capture/Necronomicon.org" 
																		;; "~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																		) 
						))) 
        ("QH" "My-agenda"
              (	(agenda "")
								(org-agenda-files '(
																						"~/../Dropbox/orgs/capture/emagus.org" 
																						"~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																						"~/../Dropbox/orgs/capture/Necronomicon.org" 
																						) 
								))) 
        ("Qh" agenda "My-agenda" (	
								(org-agenda-files '(
																		"~/../Dropbox/orgs/capture/emagus.org" 
																		"~/../Dropbox/orgs/GTD/todo_today.org"
																		"~/../Dropbox/Office/Research/Doc/Grimoire/Grimoire.org"
																		) 
								))) 
        ("Qw" "Website search" search ""
         ((org-agenda-files (file-expand-wildcards "~/website/*.org"))))
        ("Qb" "Projects and Archive" search ""
         ((org-agenda-text-search-extra-files (file-expand-wildcards "~/archive/*.org"))))
                ;; searches both projects and archive directories
        ("QA" "Archive tags search" org-tags-view "" 
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org"))))
        ;; ...other commands here
				)
;; *** ) END org-agenda-custom-commands : 
			)

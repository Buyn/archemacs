;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; (find-file-other-frame "~/.archemacs/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * EWW-MODE CUSTOMIZATION 
;; --------------------------------------
;; ** open-link-in-new-frame
;; --------------------------------------
(defun open-link-in-new-frame ()
  "open-link-in-new-frame"
  (interactive)
			(let (buffer-name-to-close (buffer-name))
				(evil-window-split)
				;; (global-visual-line-mode)
				(eww-open-in-new-buffer)
				;; (eww (shr-url-at-point nil))
				(evil-quit)
				(switch-to-buffer-other-frame buffer-name-to-close)))
;; --------------------------------------
;; ** eww-of
;; --------------------------------------
(defun eww-of (link)
  "open-eww-in-new-frame from link"
  (interactive)
			(let (buffer-name-to-close (buffer-name))
				(evil-window-split)
				;; (global-visual-line-mode)
				(eww link)
				;; (eww (shr-url-at-point nil))
				(evil-quit)
				(switch-to-buffer-other-frame buffer-name-to-close)))
;; --------------------------------------
;; ** org-open-link-in-new-frame
;; --------------------------------------
(defun org-open-link-in-new-frame ()
  " open org link in new frae end not folow
		org-open-link-in-new-frame"
  (interactive)
			(let (buffer-name-to-close (buffer-name))
				(evil-window-split)
				(org-open-at-point)
				;; (eww (shr-url-at-point nil))
				(evil-quit)
				(switch-to-buffer-other-frame buffer-name-to-close)))
;; --------------------------------------
;; ** use-package
(use-package eww
	:defer t
	;; :disabled
	:config
		;; (setq pixel-wait 0.1)
		(setq pixel-wait 0.9)
		(pixel-scroll-mode 1)
		(setq scroll-preserve-screen-position 1)
;; ** external-browser : 
;; default value
;; (setq shr-external-browser 'browse-url-default-browser)
;; to set for special browse
;; (setq shr-external-browser 'browse-url-generic)
;; (setq browse-url-generic-program (executable-find "firefox"))
;; ** url-browser : 
(setq browse-url-browser-function
			'((".*google.*maps.*" . browse-url-generic)
				;; Github goes to firefox, but not gist
				;; ("http.*\/\/github.com" . browse-url-generic)
				("groups.google.com" . browse-url-generic)
				("docs.google.com" . browse-url-generic)
				;; ("melpa.org" . browse-url-generic)
				("build.*\.elastic.co" . browse-url-generic)
				(".*-ci\.elastic.co" . browse-url-generic)
				("gradle-enterprise.elastic.co" . browse-url-generic)
				("internal-ci\.elastic\.co" . browse-url-generic)
				("zendesk\.com" . browse-url-generic)
				("salesforce\.com" . browse-url-generic)
				;; ("stackoverflow\.com" . browse-url-generic)
				("apache\.org\/jira" . browse-url-generic)
				("thepoachedegg\.net" . browse-url-generic)
				("zoom.us" . browse-url-generic)
				("t.co" . browse-url-generic)
				("twitter.com" . browse-url-generic)
				("\/\/a.co" . browse-url-generic)
				;; ("youtube.com" . browse-url-generic)
				("amazon.com" . browse-url-generic)
				("slideshare.net" . browse-url-generic)
				("." . eww-browse-url)))

;; *** reader-browser : 
;; ** define-key : 
;; --------------------------------------
	:bind (:map  eww-mode-map
							("C-<return>" . open-link-in-new-frame)
							("o o" . eww)
							("O O" . eww-browse-with-external-browser)
							;; (\j . evil-scroll-line-down)
							;; (\k . evil-scroll-line-up)
							("SPC" . buyn-reader-go)
							("Z F I" . (lambda() (interactive)
														((find-file-other-frame (expand-file-name "INI/www-cfg.el" user-emacs-directory)))))
							("S-SPC" . evil-scroll-up)
							("<f8>" . read-aloud-buf)
							("<f9>" . read-aloud-stop))

;; --------------------------------------
;; ** hooks : 
;; --------------------------------------
;; *** buyn-eww-hook : 
;; --------------------------------------
;; (defun buyn-eww-hook ()
;; 		(global-visual-line-mode t))
;; (add-hook 'eww-mode-hook 'buyn-eww-hook)
;; *** eww-mode-hook : 
;; (add-hook 'eww-mode-hook #'toggle-word-wrap)
;; (add-hook 'eww-mode-hook #'buyn-reader-start)
;; --------------------------------------
;; ** the END) : 
	)
;; *  --------------------------------------

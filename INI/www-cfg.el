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

(use-package eww
  :defer t
  ;; :disabled

:bind (:map  eww-mode-map
             ("C-<return>" . open-link-in-new-frame)
             ("o o" . eww)
             ("O O" . eww-browse-with-external-browser)
             ;; (\j . evil-scroll-line-down)
             ;; (\k . evil-scroll-line-up)
             ;; ("SPC" . buyn-reader-go)
             ;; ("SPC" . evil-scroll-down)
             ("SPC" . Info-scroll-up)
             ("Z F I" . (lambda() (interactive)
                          ((find-file-other-frame (expand-file-name "INI/www-cfg.el" user-emacs-directory)))))
             ;; ("S-SPC" . evil-scroll-up)
             ("S-SPC" . Info-scroll-down)
             ("<f8>" . read-aloud-buf)
             ("<f9>" . read-aloud-stop))

)

(setq browse-url-handlers
      '((".*google.*maps.*" . browse-url-chromium)
        ("groups.google.com" . browse-url-chromium)
        ("docs.google.com" . browse-url-chromium)
        ;; Github goes to firefox, but not gist
        ("http.*\/\/github.com" . browse-url-firefox)
        ;; ("melpa.org" . browse-url-generic)
        ;; ("build.*\.elastic.co" . browse-url-generic)
        ;; (".*-ci\.elastic.co" . browse-url-generic)
        ;; ("gradle-enterprise.elastic.co" . browse-url-generic)
        ;; ("internal-ci\.elastic\.co" . browse-url-generic)
        ("zendesk\.com" . browse-url-firefox)
        ;; ("salesforce\.com" . browse-url-generic)
        ("stackoverflow\.com" . browse-url-firefox)
        ;; ("apache\.org\/jira" . browse-url-generic)
        ;; ("thepoachedegg\.net" . browse-url-generic)
        ("zoom.us" . browse-url-chromium)
        ("t.co" . browse-url-firefox)
        ("twitter.com" . browse-url-firefox)
        ("\/\/a.co" . browse-url-firefox)
        ("youtube.com" . browse-url-generic)
        ;; ("amazon.com" . browse-url-generic)
        ("slideshare.net" . browse-url-firefox)
        ("." . eww-browse-url)))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "xdg-open")

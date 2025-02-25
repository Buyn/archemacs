;; * ORG-ROAM CUSTOMIZATION
;; --------------------------------------
;; Org-Roam basic configuration
;; (setq org-directory (concat (getenv "HOME") "/Documents/notes/"))
;;  D:\Development\lisp\Dropbox\orgs\Org-roam\default 
;;  D:/Development/lisp/Dropbox/orgs/Org-roam/default 
(use-package org-roam
  ;; :disabled
  :ensure t
  :after org
  :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
  :custom
  ;; (org-roam-directory (file-truename org-directory))
  ;; (org-roam-directory (file-truename "D:/Development/lisp/Dropbox/orgs/Org-roam/default/"))
  (org-roam-directory (file-truename "~/Dropbox/orgs/Org-roam/default/"))
  :config
  (org-roam-setup)
  ;; If you're using a vertical completion framework, you might want a more informative completion interface пологаю 10 максимальное количство символо для тагов - можно убрать
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  ;; (require 'dendroam)
  ;; (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  ;; (require 'org-roam-protocol)
  :bind ( ("C-c n f" . org-roam-node-find)
          ("C-c n l" . org-roam-buffer-toggle)
          ("C-c n c" . org-roam-capture)
          ("C-c n j" . org-roam-dailies-capture-today)
          (:map org-mode-map
                (("C-c n i" . org-roam-node-insert)
                ("C-c n o" . org-id-get-create)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n g" . org-roam-graph)
                ;; ("C-c n r" . org-roam-node-random)       
                ("C-c n a" . org-roam-alias-add)))))


;; --------------------------------------
;; * ORG-ROAM-UI CUSTOMIZATION
(use-package org-roam-ui
  :ensure t
  ;; :disabled
  ;; :straight
  ;;   (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  ;; :demand t
  ;; :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
  ;; запускается сервер сразу с имаком
  ;; :hook (after-init . org-roam-ui-mode)
  :config
  (setq 
        ;; Org-Roam-UI can sync your Emacs theme! This is the default behavior, to disable it do
        ;; org-roam-ui-sync-theme t
        org-roam-ui-sync-theme nil
        ;; ORUI follows you around Emacs by default. To disable this, set
        ;; org-roam-ui-follow nil
        org-roam-ui-follow t
        ;; By default, org-roam-ui will try to open itself in your default browser. To disable this, set
        org-roam-ui-open-on-start nil
        org-roam-ui-update-on-save t))
;; Usage
;; Use M-x org-roam-ui-mode RET to enable the global mode. It will start a web server on http://127.0.0.1:35901/ and connect to it via a WebSocket for real-time updates.
;; --------------------------------------
;; * DENDROAM CUSTOMIZATION
;; ** use-package : 
(use-package dendroam
  :quelpa (dendroam :repo "vicrdguez/dendroam" :fetcher github)
  :ensure t
  :after org-roam
  ;; :demand t
;; ** config : 
  :config
  (setq org-roam-node-display-template "${hierarchy}:${title}")
  ;; (setq org-roam-node-display-template
  ;;      (concat "${hierarchy}:${title}" (propertize "${tags}" 'face 'org-tag)))
  (setq org-roam-capture-templates
        '(("d" "default" plain
          "%?"
          :if-new (file+head "${slug}.org"
                              "#+title: ${hierarchy-title}\n")
          :immediate-finish t
          :unnarrowed t)))
  ;; :after org-roam
  ;; dailies : 
  ;; (setq org-roam-dailies-capture-templates
  ;;      '(("d" "default" entry
  ;;        "* %?"
  ;;        :if-new (file+head "journal.daily.%<%Y.%m.%d>.org"
  ;;                            "#+title: %<%Y-%m-%d>\n"))))
  ;; "Scratch note"
  ;; (setq dendroam-capture-templates
  ;;      '(("t" "Time note" entry
  ;;        "* %?"
  ;;        :if-new (file+head "${current-file}.%<%Y.%m.%d>.org"
  ;;                            "#+title: %^{title}\n"))
  ;;        ("s" "Scratch note" entry
  ;;        "* %?"
  ;;        :if-new (file+head "scratch.%<%Y.%m.%d.%.%M%S%3N>.org"
  ;;                            "#+title: %^{title}\n"))))
;; ** defun : 
  (defun dendroam-node-find-initial-input ()
    (interactive)
    (require 'org-roam)
    (require 'dendroam)
    (org-roam-node-find nil (if (buffer-file-name)
                          (file-name-base (buffer-file-name))
                          "")))
;; ** defun FIX : 
(cl-defmethod org-roam-node-slug ((node org-roam-node))
  "Return the slug of NODE."
  (let ((title (org-roam-node-title node))
        (slug-trim-chars '(;; Combining Diacritical Marks https://www.unicode.org/charts/PDF/U0300.pdf
                           768 ; U+0300 COMBINING GRAVE ACCENT
                           769 ; U+0301 COMBINING ACUTE ACCENT
                           770 ; U+0302 COMBINING CIRCUMFLEX ACCENT
                           771 ; U+0303 COMBINING TILDE
                           772 ; U+0304 COMBINING MACRON
                           774 ; U+0306 COMBINING BREVE
                           775 ; U+0307 COMBINING DOT ABOVE
                           776 ; U+0308 COMBINING DIAERESIS
                           777 ; U+0309 COMBINING HOOK ABOVE
                           778 ; U+030A COMBINING RING ABOVE
                           779 ; U+030B COMBINING DOUBLE ACUTE ACCENT
                           780 ; U+030C COMBINING CARON
                           795 ; U+031B COMBINING HORN
                           803 ; U+0323 COMBINING DOT BELOW
                           804 ; U+0324 COMBINING DIAERESIS BELOW
                           805 ; U+0325 COMBINING RING BELOW
                           807 ; U+0327 COMBINING CEDILLA
                           813 ; U+032D COMBINING CIRCUMFLEX ACCENT BELOW
                           814 ; U+032E COMBINING BREVE BELOW
                           816 ; U+0330 COMBINING TILDE BELOW
                           817 ; U+0331 COMBINING MACRON BELOW
                           )))
    (cl-flet* ((nonspacing-mark-p (char) (memq char slug-trim-chars))
               (strip-nonspacing-marks (s) (string-glyph-compose
                                            (apply #'string
                                                   (seq-remove #'nonspacing-mark-p
                                                               (string-glyph-decompose s)))))
               (cl-replace (title pair) (replace-regexp-in-string (car pair) (cdr pair) title)))
      (let* ((pairs `(("[^[:alnum:][:digit:]\\.]" . "_") ;; convert anything not alphanumeric
                      ("__*" . "_")                   ;; remove sequential underscores
                      ("^_" . "")                     ;; remove starting underscore
                      ("_$" . "")))                   ;; remove ending underscore
             (slug (-reduce-from #'cl-replace (strip-nonspacing-marks title) pairs)))
        (downcase slug)))))

;; ** bind : 
  :bind (("C-c n F" . dendroam-node-find-initial-input))
;; **   ) : 
  )
;; --------------------------------------

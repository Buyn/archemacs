;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * not used in
;; (find-file "~/INI/evil-mod-cfg.el")
;; --------------------------------------
(defun addone-char-into-normal-evil()
    "add one char into normal evil"
    (interactive)
    (setq chartoadd (read-char "enter char"))
	(if (= chartoadd 13)
		(open-line 1)
		(insert chartoadd)))

(defun addone-char-after-normal-evil()
    "add one char after normal evil"
    (interactive)
    (setq chartoadd (read-char "enter char"))
	(if (= chartoadd 13)
		(open-line 1)
		(save-excursion (insert chartoadd))))
    ;;(save-excursion (insert chartoadd)))
;; --------------------------------------

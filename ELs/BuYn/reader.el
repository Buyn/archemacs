;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file-other-frame "~/INI/lit-cfg.el")
;; * --------------------------------------
;; * BUYN's ELISP DEFUNS
;; --------------------------------------
;; ** varibls
(setq highlight-start-color '(:background "darkgreen"))
(setq highlight-pointer-color '(:background "blue"))
(setq highlight-stop-color '(:background "darkgreen"))
;; "blue"
;; "lightgreen"
;; "darkgreen"
(setq stop-point 666)
;; --------------------------------------
;; ** functions
;; *** buyn-read-aloud-start :
(defun buyn-read-aloud-start ()
  "	Старт озвучки с курсора и установка пробела на стоп команду
		и установка ф8 на активацию читалки
		"
    (interactive)
			(read-aloud-buf)
			(define-key evil-normal-state-map (kbd "SPC")
				'buyn-read-aloud-stop)
			(define-key evil-normal-state-map (kbd "<f8>")
				'buyn-reader-start)
			(message "read-aloud is start"))

;; *** buyn-read-aloud-go :
(defun buyn-read-aloud-go ()
  "	Старт озвучки с курсора и установка пробела на стоп команду
		"
    (interactive)
			(read-aloud-buf)
			(define-key evil-normal-state-map (kbd "SPC")
				'buyn-read-aloud-stop))

;; *** buyn-read-aloud-stop :
(defun buyn-read-aloud-stop ()
  "	Стop озвучки и установка пробела на старт озвучки
		"
    (interactive)
		(read-aloud-stop)
		(define-key evil-normal-state-map (kbd "SPC")
			'buyn-read-aloud-go))

;; *** buyn-reader-end :
(defun buyn-reader-end ()
  "	устанавливает пробел на добовление символа
и отключает плавное движение
		"
		(pixel-scroll-mode -1)
		(setq scroll-preserve-screen-position nil)
		(define-key evil-normal-state-map (kbd "SPC") 
					'khaoos-insert-one-char)
		(message "Reader is off"))
;; *** buyn-reader-start :
(defun buyn-reader-start ()
  "	ставит пробел на плавноесть движения
и ф8 на на переключени на озвучку голосом
		"
    (interactive)
	(pixel-scroll-mode 1)
	(setq scroll-preserve-screen-position 1)
	(setq pixel-wait 0.1)
	(define-key evil-normal-state-map (kbd "SPC") 
		'buyn-reader-go)
	(define-key evil-normal-state-map (kbd "S-SPC") 
		'evil-scroll-up

		)

	(define-key evil-normal-state-map (kbd "<f8>") 
		'buyn-read-aloud-start)
	(message "Reader is on"))

;; --------------------------------------
;; *** buyn-reader-stop :
(defun buyn-reader-stop ()
  "	
	останавливает движение
	ставит пробел на плавноесть движения
	и ф8 на на переключени на озвучку голосом
		"
    (interactive)
	(keyboard-quit)
	(message "Reader is stop"))

;; --------------------------------------
;; *** buyn-reader-go :
(defun buyn-reader-go ()
  "ставит пробел на плавноесть движения
и ф8 на на переключени на озвучку голосом
		"
    (interactive)
    (let ((overlay-highlight (make-overlay
                              (point)
                              (+ 1 (point))
															)))
        ;; (overlay-put overlay-highlight 'face '(:background 'highlight-pointer-color))
        ;; (overlay-put overlay-highlight 'line-highlight-overlay-marker t))
			(highlight-region (point) (+ 1 (point)) highlight-pointer-color)
			(evil-window-bottom)
			;; (char-after (point-at-bol))
			;; (highlight-region (line-beginning-position) (+ (line-beginning-position) 21))
			;; (highlight-region (point) (+ (point) 21))
			;; (highlight-region (+ (point) stop-point) (+ (point) stop-point 21))
			(highlight-region (point) (+ 1 (point)))
			;; (highlight-or-dehighlight-char)
			(evil-window-middle)
			(next-line 9)
			;; (evil-window-bottom)
			(pixel-scroll-pixel-up stop-point)
      ;; (pixel-scroll-mode &optional ARG)
			))

;; --------------------------------------
;; *** find-overlays-specifying : 
(defun find-overlays-specifying (prop pos)
  (let ((overlays (overlays-at pos))
        found)
    (while overlays
      (let ((overlay (car overlays)))
        (if (overlay-get overlay prop)
            (setq found (cons overlay found))))
      (setq overlays (cdr overlays)))
    found))


;; --------------------------------------
;; *** highlight-or-dehighlight-line : 
(defun highlight-or-dehighlight-line ()
  (interactive)
  (if (find-overlays-specifying
       'line-highlight-overlay-marker
       (line-beginning-position))
      (remove-overlays (line-beginning-position) (+ 1 (line-end-position)))
    (let ((overlay-highlight (make-overlay
                              (line-beginning-position)
                              (+ 1 (line-end-position)))))
        (overlay-put overlay-highlight 'face '(:background "lightgreen"))
        ;; (overlay-put overlay-highlight 'face '(:background highlight-start-color))
        (overlay-put overlay-highlight 'line-highlight-overlay-marker t))))


;;  --------------------------------------
;; *** highlight-or-dehighlight-char : 
(defun highlight-or-dehighlight-char ()
  (interactive)
  (if (find-overlays-specifying
       'line-highlight-overlay-marker
       (line-beginning-position))
      (remove-overlays (position) (+ 1 (position)))
    (let ((overlay-highlight (make-overlay
                              (position)
                              (+ 1 (position)))))
        (overlay-put overlay-highlight 'face '(:background "lightgreen"))
        ;; (overlay-put overlay-highlight 'face '(:background highlight-start-color))
        (overlay-put overlay-highlight 'line-highlight-overlay-marker t))))


;;  --------------------------------------
;; *** highlight-region : 
(defun highlight-region (begin end &optional color)
  (interactive)
    (let ((overlay-highlight (make-overlay
                              begin
                              end)))
        ;; (overlay-put overlay-highlight 'face '(:background "lightgreen"))
        ;; (overlay-put overlay-highlight 'face '(:background "green"))
        ;; (overlay-put overlay-highlight 'face '(:background "blue"))
        (overlay-put overlay-highlight 'face (or color highlight-start-color))
        ;; (overlay-put overlay-highlight 'face (or color '(:background "green")))
        (overlay-put overlay-highlight 'line-highlight-overlay-marker t)
				))

;;  --------------------------------------
;; * --------------------------------------

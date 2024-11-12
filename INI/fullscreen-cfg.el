;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/frame-control.el")
;; --------------------------------------
;; * MINIMAP-MODE CUSTOMIZATION 
;; --------------------------------------
;; (find-file-other-frame "~/.archemacs/INI/frames/minimap-cfg.el")
;; (load "~/.archemacs/INI/frames/minimap-cfg.el")
;; --------------------------------------
;; * FULLSCREEN-MOD CUSTOMIZATION
;; --------------------------------------
;; (setq-local fullscreen-mode-activ nil)
(defvar-local fullscreen-mode-activ nil
	"indictate is fullscreen mode is activ or not
		or if not init nil
		set it aftar init to false")
;; ** toggle-full-screen :
(defun toggle-full-screen ()
  "Toggles full-screen mode for Emacs window on Win32."
  (interactive)
  (toggle-frame-fullscreen)
)
;; --------------------------------------
;; ** toggle-fonte-lage-size : 
(defun toggle-fonte-lage-size ()
  "Toggle betwin fullscrin font size and normal"
  (interactive)
  ;; use a property “state”. Value is t or nil
  (if (get 'toggle-font-lage-size 'state)
			(progn
				(text-scale-set 0)
				(put 'toggle-font-lage-size 'state nil))
			(progn
				(text-scale-set +3)
				(put 'toggle-font-lage-size 'state t))))
;; --------------------------------------
;; ** toggle-bars : 
(defun toggle-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode)
  (scroll-bar-mode))
;; --------------------------------------
;; ** toggle-full-screen-and-bars : 
(defun toggle-full-screen-and-bars ()
  "Toggles full-screen mode and bars."
  (interactive)
  ;; (toggle-bars)
	;; (setq-local fullscreen-mode-activ (not fullscreen-mode-activ))
  ;; (toggle-full-screen)
	(toggle-frame-maximized)
  (toggle-fonte-lage-size)
	(toggle-fullscreen-minimap)
	;; (evil-window-set-width 0)
	)
;; ** toggle-full-screen-and-minimap : 
(defun toggle-full-screen-and-minimap ()
  "Toggles full-screen mode and minimap."
  (interactive)
  ;; (toggle-bars)
	(setq-local fullscreen-mode-activ (not fullscreen-mode-activ))
	(toggle-frame-maximized)
  ;; (toggle-full-screen)
  (toggle-fonte-lage-size)
	(toggle-fullscreen-minimap)
	;; (evil-window-set-width 0)
	)
;; ** toggle-fullscreen-minimap : 
;; --------------------------------------
(defun toggle-fullscreen-minimap ()
  "Toggle minimap in fullscreen
		fullscreen is chekt on fullscreen-mode-activ"
  (interactive)
	;; (minimap-mode)
	;; (minimap-create)
	(if fullscreen-mode-activ
		;; (minimap-create-window)
		(minimap-mode)
		(minimap-kill))
	;; (minimap-recenter)
	;; (minimap-mode)
	;; (minimap-update nil)
	;; (minimap-update)
	;; (minimap-active-current-buffer-p)
		)
;; ** toggle-fullscreen-agenda : 
(defun toggle-fullscreen-agenda ()
  "Full screen for agenda mode
		if all work rewrite for all mods"
  (interactive)
	(unless (boundp fullscreen-mode-activ)
		(defvar-local fullscreen-mode-activ nil
			"indictate is fullscreen mode is activ or not
				or if not init nil
				set it aftar init to false"))
  ;; (toggle-frame-fullscreen)
	(toggle-frame-maximized)
  (if fullscreen-mode-activ
				(text-scale-set 0)
				(text-scale-set +3))
	(setq-local fullscreen-mode-activ (not fullscreen-mode-activ)))
  
;; ** set-key : 
;; --------------------------------------
;; Use F11 to switch between windowed and full-screen modes
;;(global-set-key (kbd "C-M-f") 'toggle-full-screen-and-bars)
;;(define-key evil-normal-state-map [(control shift f)] 'toggle-full-screen-and-bars)
;; (global-set-key [(control shift f)]  'toggle-full-screen-and-bars)
(global-set-key [(control shift f)]  'toggle-fullscreen-agenda)
;; --------------------------------------
;; ** --------------------------------------
;; * --------------------------------------

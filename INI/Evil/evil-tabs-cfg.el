;; * EVIL TABS CONFIGURATION 
;; ** install evil-tabs
(use-package evil-tabs :ensure t
;; ** :config : 
  :config
  (global-evil-tabs-mode t)
  (elscreen-toggle-display-tab)
  ;; (setq elscreen-display-tab nil)
;; ** evil-ex-define-cmd : 
  (evil-ex-define-cmd "tabc[lone]" 'elscreen-clone)
  (evil-ex-define-cmd "tabcl[ose]" 'elscreen-kill)
;; ** define-key evil-normal-state-map : 
  ;; :bind ("C-c c" hydra-clock/body)
  (evil-define-key 'normal evil-tabs-mode-map
    "gT" nil
    "gTT" 'elscreen-previous
    "gTS" 'elscreen-toggle-display-tab
    "gTL" 'elscreen-clone
    "gTC" 'elscreen-kill
    "gt" nil
    ;; "gtt" 'elscreen-next
    "gtt" 'next-or-make-new-tab
    "gtg" 'elscreen-goto
    "T" 'evil-tabs-current-buffer-to-tab)
;; ** END of use-package evil-tabs
  )
;; ** Docs
;; --------------------------------------
;; :tabnew
;; :tabclone
   ;; (evil-ex-define-cmd "tabe[dit]" 'evil-tabs-tabedit)  
   ;; (evil-ex-define-cmd "tabclone" 'elscreen-clone)  
   ;; (evil-ex-define-cmd "tabc[lose]" 'elscreen-kill)  
   ;; (evil-ex-define-cmd "tabd[isplay]" 'elscreen-toggle-display-tab)  
   ;; (evil-ex-define-cmd "tabg[oto]" 'elscreen-goto)  
   ;; (evil-ex-define-cmd "tabo[nly]" 'elscreen-kill-others)  
   ;; (evil-ex-define-cmd "tabnew" 'elscreen-create)  
   ;; (evil-ex-define-cmd "tabn[ext]" 'elscreen-next)  
   ;; (evil-ex-define-cmd "tabp[rev]" 'elscreen-previous)  
   ;; (evil-ex-define-cmd "tabr[ename]" 'elscreen-screen-nickname)  
   ;; (evil-ex-define-cmd "tabs[elect]" 'elscreen-select-and-goto)  
   ;; (evil-ex-define-cmd "tabw[ith]" 'elscreen-find-and-goto-by-buffer)  
   ;; (evil-ex-define-cmd "q[uit]" 'evil-tab-sensitive-quit)  

;; --------------------------------------
;; --------------------------------------
;; * TAB FUNCTIONS
;; ** make new indirect tab :
(defun make-new-indirect-tab (name)
  "Make new tab and indirect bufer with name"
  (interactive)
  (setq minimap-major-modes '())
  (clone-indirect-buffer name nil)
  (elscreen-create)
  ;; (switch-to-buffer "evil-tabs-cfg.el<2>"))
  (switch-to-buffer name))

;; --------------------------------------
;; ** gen-name-for-curennt-indirect-buffer : 
(defun gen-name-for-curennt-indirect-buffer (ender)
  "genarate name for indirect buffer
    on curennt buffer name"
  ;; (interactive "P")
  (concat (buffer-name) ender)
  ) 

;; --------------------------------------
;; (gen-name-for-curennt-indirect-buffer "<2>")
;; ** next-or-make-new-tab 
(defun next-or-make-new-tab ()
  "Swircg on next tab or
    make new tab and open in it indirect buffer"
  (interactive)
  (let ((num-of-scr (elscreen-get-number-of-screens)))
    (cond
      ((= num-of-scr 1)
        ;; (make-new-indirect-tab (gen-name-for-curennt-indirect-buffer "<2>"))
        (elscreen-clone)
        (message "clone tab")
        )
      ((= num-of-scr 2)
            (elscreen-next))
      ((= num-of-scr 3)
            (switch-between-too-first-tabs)))))

;; --------------------------------------
;; ** switch-between-too-first-tabs 
(defun switch-between-too-first-tabs ()
  "switch-between-too-first-tabs"
  (let ((scr-num (elscreen-get-current-screen)))
    (cond
      ((= scr-num 0) (elscreen-goto 1))
      ((= scr-num 1) (elscreen-goto 0))
      ((> scr-num 1) (elscreen-goto 1)))))

;; --------------------------------------
;; ** make-new-tab-for-fullscreen-windows 
(defun make-new-tab-for-fullscreen-windows ()
  "make-new-tab-for-fullscreen-windows"
  (interactive)
  (when (= (elscreen-get-number-of-screens) 1)
      (make-new-indirect-tab))
  (let ((orbuf-name (buffer-name)))
      (elscreen-create)
      (switch-to-buffer orbuf-name)
      (evil-window-vsplit)
      (evil-window-set-width 60)
      (let ((name (concat orbuf-name "<fs0>")))
        (clone-indirect-buffer name nil)
        (switch-to-buffer name))
      (evil-window-split)
      (let ((name (concat orbuf-name "<fs1>")))
        (clone-indirect-buffer name nil)
        (switch-to-buffer name))
      (evil-window-split)
      (let ((name (concat orbuf-name "<fs2>")))
        (clone-indirect-buffer name nil)
        (switch-to-buffer name))))

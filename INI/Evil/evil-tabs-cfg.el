;; * EVIL TABS CONFIGURATION 
;; ** install evil-tabs
(use-package evil-tabs :ensure t
;; ** :config : 
  :config
  (global-evil-tabs-mode t)
  ;; (elscreen-toggle-display-tab)
  ;; (setq elscreen-display-tab t)
  (setq elscreen-display-tab nil)
;; ** evil-ex-define-cmd : 
  (evil-ex-define-cmd "tabc[lone]" 'elscreen-clone)
  (evil-ex-define-cmd "tabcl[ose]" 'elscreen-kill)
;; ** define-key evil-normal-state-map : 
  ;; :bind ("C-c c" hydra-clock/body)
  (evil-define-key 'normal evil-tabs-mode-map
    "gT" nil
    "gTH" 'elscreen-previous
    "gTL" 'elscreen-next
    "gTD" 'elscreen-toggle-display-tab
    "gTS" 'elscreen-toggle-display-tab
    "gTT" 'elscreen-toggle-display-tab
    "gTC" 'elscreen-clone
    "gTK" 'elscreen-kill
    "gt" nil
    ;; "gtt" 'next-or-make-new-tab
    "gtt" (lambda () (interactive) (switch-or-make-new-name-tab "t-tab"))
    "gtk" (lambda () (interactive) (switch-or-make-new-name-tab "k-tab"))
    "gtl" (lambda () (interactive) (switch-or-make-new-name-tab "l-tab"))
    "gtj" (lambda () (interactive) (switch-or-make-new-name-tab "j-tab"))
    "gtg" 'elscreen-goto
    "T" 'evil-tabs-current-buffer-to-tab)
;; ** END of use-package evil-tabs
  )

(defun switch-or-make-new-name-tab (tab-name)
  "Swiching on j-tab or
    make j-tab and open it or clon activ"
  (interactive)
  (let ((tab
         (seq-find (lambda (val) (string= tab-name (cdr val)))
              (elscreen-get-screen-to-name-alist))))
    (if tab
        (if (= (car tab) (elscreen-get-current-screen))
            (elscreen-goto 0)
            (elscreen-goto (car tab)))
        (progn
          (elscreen-clone)
          (elscreen-screen-nickname tab-name)
          (message "clone tab")))))

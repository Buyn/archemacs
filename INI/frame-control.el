(require 'cl) ;;used to Fix error if theres an error with above code
;; (load "~/.archemacs/ELs/framemove/framemove.el")
(load (expand-file-name "ELs/framemove/framemove.el" user-emacs-directory))
(require 'framemove)
    ;; (windmove-default-keybindings)
    (setq framemove-hook-into-windmove t) ;;Hook framemove into windmove keys
;; Common lisp stuff to fix windmove/framemove 
;; (when (fboundp 'windmove-default-keybindings)
;;   (windmove-default-keybindings))

(global-set-key (kbd "M-h") nil)
(global-set-key (kbd "M-h") 'windmove-left)
(define-key org-mode-map (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-j") 'windmove-down)
(define-key org-mode-map (kbd "M-j") 'windmove-down)
;; no  such variables error
;; (define-key c-mode-base-map (kbd "M-j") 'windmove-down)
;; (define-key c++-mode-map  (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") nil)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") nil)
(global-set-key (kbd "M-l") 'windmove-right)

(setq buyn-monitr-0-position-7 '(0     337))
(setq buyn-monitr-0-position-8 '(670   337))
(setq buyn-monitr-0-position-9 '(660   337))
(setq buyn-monitr-0-position-4 '(0     600))
(setq buyn-monitr-0-position-5 '(670   600))
(setq buyn-monitr-0-position-6 '(660   600))
(setq buyn-monitr-0-position-1 '(0     910))
(setq buyn-monitr-0-position-2 '(670   910))
(setq buyn-monitr-0-position-3 '(660   910))

(setq buyn-monitr-1-position-7 '(0     0))
(setq buyn-monitr-1-position-8 '(670   0))
(setq buyn-monitr-1-position-9 '(1295  0))
(setq buyn-monitr-1-position-4 '(0     360))
(setq buyn-monitr-1-position-5 '(670   360))
(setq buyn-monitr-1-position-6 '(1295  360))
(setq buyn-monitr-1-position-1 '(0     620))
(setq buyn-monitr-1-position-2 '(670   620))
(setq buyn-monitr-1-position-3 '(1295  620))

(setq buyn-monitr-2-position-7 '(1920  0))
(setq buyn-monitr-2-position-8 '(2115  0))
(setq buyn-monitr-2-position-9 '(2310  0))
(setq buyn-monitr-2-position-4 '(1920  412))
(setq buyn-monitr-2-position-5 '(2115  412))
(setq buyn-monitr-2-position-6 '(2310  412))
(setq buyn-monitr-2-position-1 '(1920  752))
(setq buyn-monitr-2-position-2 '(2115  752))
(setq buyn-monitr-2-position-3 '(2310  752))

(global-set-key (kbd "M-S-<kp-home>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-7)
                          (cadr buyn-monitr-0-position-7))))
(global-set-key (kbd "M-S-<kp-up>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-8)
                          (cadr buyn-monitr-0-position-8))))
(global-set-key (kbd "M-S-<kp-prior>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-9)
                          (cadr buyn-monitr-0-position-9))))
(global-set-key (kbd "M-S-<kp-left>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-4)
                          (cadr buyn-monitr-0-position-4))))
(global-set-key (kbd "M-S-<kp-begin>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-5)
                          (cadr buyn-monitr-0-position-5))))
(global-set-key (kbd "M-S-<kp-right>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-6)
                          (cadr buyn-monitr-0-position-6))))
(global-set-key (kbd "M-S-<kp-end>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-1)
                          (cadr buyn-monitr-0-position-1))))
(global-set-key (kbd "M-S-<kp-down>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-2)
                          (cadr buyn-monitr-0-position-2))))
(global-set-key (kbd "M-S-<kp-next>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-0-position-3)
                          (cadr buyn-monitr-0-position-3))))

(global-set-key (kbd "M-<kp-7>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-7)
                          (cadr buyn-monitr-1-position-7))))
(global-set-key (kbd "M-<kp-9>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-9)
                          (cadr buyn-monitr-1-position-9))))
(global-set-key (kbd "M-<kp-8>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-8)
                          (cadr buyn-monitr-1-position-8))))
(global-set-key (kbd "M-<kp-4>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-4)
                          (cadr buyn-monitr-1-position-4))))
(global-set-key (kbd "M-<kp-5>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-5)
                          (cadr buyn-monitr-1-position-5))))
(global-set-key (kbd "M-<kp-6>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-6)
                          (cadr buyn-monitr-1-position-6))))
(global-set-key (kbd "M-<kp-1>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-1)
                          (cadr buyn-monitr-1-position-1))))
(global-set-key (kbd "M-<kp-2>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-2)
                          (cadr buyn-monitr-1-position-2))))
(global-set-key (kbd "M-<kp-3>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-1-position-3)
                          (cadr buyn-monitr-1-position-3))))

(global-set-key (kbd "C-M-<kp-7>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-7)
                          (cadr buyn-monitr-2-position-7))))
(global-set-key (kbd "C-M-<kp-9>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-9)
                          (cadr buyn-monitr-2-position-9))))
(global-set-key (kbd "C-M-<kp-8>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-8)
                          (cadr buyn-monitr-2-position-8))))
(global-set-key (kbd "C-M-<kp-4>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-4)
                          (cadr buyn-monitr-2-position-4))))
(global-set-key (kbd "C-M-<kp-5>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-5)
                          (cadr buyn-monitr-2-position-5))))
(global-set-key (kbd "C-M-<kp-6>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-6)
                          (cadr buyn-monitr-2-position-6))))
(global-set-key (kbd "C-M-<kp-1>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-1)
                          (cadr buyn-monitr-2-position-1))))
(global-set-key (kbd "C-M-<kp-2>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-2)
                          (cadr buyn-monitr-2-position-2))))
(global-set-key (kbd "C-M-<kp-3>") '(lambda() (interactive)
      (set-frame-position (selected-frame)
                          (car buyn-monitr-2-position-3)
                          (cadr buyn-monitr-2-position-3))))

(global-set-key (kbd "M-<kp-subtract>") '(lambda() (interactive)
        (set-frame-size (selected-frame) 75 25)))
(global-set-key (kbd "C-M-<kp-subtract>") '(lambda() (interactive)
        (set-frame-size (selected-frame) 75 35)))

(global-set-key (kbd "M-g M-t M-t") '(lambda() (interactive)
      (switch-to-buffer-other-frame "*scratch*")))
(global-set-key (kbd "M-g M-t M-T") 'make-frame-command)
;; (define-key evil-normal-state-map "gtt" 'make-frame-command)
(global-set-key (kbd " M-g M-t M-f") 'find-file-other-frame)
(global-set-key (kbd " M-g M-t M-b") 'switch-to-buffer-other-frame)
(global-set-key (kbd " M-g M-t M-i") 'switch-to-buffer)
(define-key evil-normal-state-map "ZO" 'switch-to-buffer-other-frame)
(global-set-key (kbd " M-g M-t M-d") 'ido-dired-other-frame)
(setq org-indirect-buffer-display `new-frame)
(global-set-key (kbd " M-g M-t M-o") 'org-tree-to-indirect-buffer)
;; (define-key evil-normal-state-map (kbd "gbb") '(lambda() (interactive)
      ;; (display-buffer (last-buffer))))
(global-set-key (kbd " M-g M-t M-j") '(lambda() (interactive)
      (let (buffer-name-to-close (buffer-name))
      (evil-quit)
      (switch-to-buffer-other-frame buffer-name-to-close))))

(global-set-key (kbd " M-g M-t M-h M-l") 'find-function-on-key-other-frame)
(global-set-key (kbd " M-g M-t M-h M-k") 'find-function-on-key-other-frame)
(global-set-key (kbd " M-g M-t M-h M-f") 'describe-function)
(global-set-key (kbd " M-g M-t M-h M-a") 'xref-find-definitions-other-frame)

(define-key evil-normal-state-map "ZD" '(lambda() (interactive)
          (kill-buffer (current-buffer))))
(define-key evil-normal-state-map "ZX" '(lambda() (interactive)
          (kill-buffer (current-buffer))
          (evil-quit)))
(define-key evil-normal-state-map "ZW" '(lambda() (interactive)
          (evil-quit)))
(define-key evil-normal-state-map "ZE" '(lambda() (interactive)
          (save-buffer)
          (evil-quit)))
(global-set-key (kbd " M-g M-t M-z M-x") '(lambda() (interactive)
          (kill-buffer (current-buffer))
          (evil-quit)))
(define-key evil-normal-state-map "ZQ" '(lambda() (interactive)
          (evil-quit)))
(define-key evil-normal-state-map "ZZ" '(lambda() (interactive)
          (evil-quit)
          (org-save-all-org-buffers)))
(define-key evil-normal-state-map "ZC" '(lambda() (interactive)
          (save-buffer)
          (kill-buffer (current-buffer))
          ))

(define-key evil-normal-state-map "ZHH" '(lambda() (interactive)
          (evil-window-vsplit)
          (ivy-switch-buffer)))
(define-key evil-normal-state-map "Zhh" 'evil-window-vsplit)
(define-key evil-normal-state-map "ZLL"
          '(lambda() (interactive)
            (evil-window-vsplit)
            (windmove-right)))
(define-key evil-normal-state-map "Zll"
          '(lambda() (interactive)
            (evil-window-split)
            (windmove-right
            (ivy-switch-buffer))))
(define-key evil-normal-state-map "ZKK"
          '(lambda() (interactive)
            (evil-window-split)
            (ivy-switch-buffer)))
(define-key evil-normal-state-map "Zkk" 'evil-window-split)
(define-key evil-normal-state-map "ZJJ" 
          '(lambda() (interactive)
            (evil-window-split)
            (windmove-down)))
(define-key evil-normal-state-map "Zjj" 
          '(lambda() (interactive)
            (evil-window-split)
            (windmove-down)
            (ivy-switch-buffer)))
(define-key evil-normal-state-map (kbd "Z S-<SPC> S-<SPC>") 'delete-other-windows)

(define-key evil-normal-state-map "ZI" '(lambda() (interactive)
          (ivy-switch-buffer)))

(define-key evil-normal-state-map "ZR" nil)
(define-key evil-normal-state-map "ZRR" 'ranger)
(define-key evil-visual-state-map "ZRR" '(lambda() (interactive)
          (switch-to-buffer-other-frame "*scratch*")
          (message (buffer-substring (region-beginning) (region-end)))
          (ranger (buffer-substring (region-beginning) (region-end)))))
(define-key evil-normal-state-map "ZRH"
            '(lambda() (interactive)
              (switch-to-buffer-other-frame "*scratch*")
              (ranger "~/")))
(define-key evil-normal-state-map "ZRr"
            '(lambda() (interactive)
               (let
                  ((file-name (file-name-directory (buffer-file-name))))
                  (switch-to-buffer-other-frame "*scratch*")
                  (ranger file-name))))
(define-key evil-normal-state-map "ZRB"
            '(lambda() (interactive)
              (switch-to-buffer-other-frame "*scratch*")
              (ranger "~/Dropbox/")))
(define-key evil-normal-state-map "ZRO"
            '(lambda() (interactive)
              (switch-to-buffer-other-frame "*scratch*")
              (ranger "~/Dropbox/Office/")))
(define-key evil-normal-state-map "ZRo"
            '(lambda() (interactive)
              (switch-to-buffer-other-frame "*scratch*")
              (ranger "~/Dropbox/orgs/")))
(define-key evil-normal-state-map "ZRW"
            '(lambda() (interactive)
              (switch-to-buffer-other-frame "*scratch*")
              (ranger "~/Downloads/")))
(define-key evil-normal-state-map "ZRD"
            '(lambda() (interactive)
              (switch-to-buffer-other-frame "*scratch*")
              (ranger "~/Documents/")))

(define-key evil-normal-state-map "ZMm" '(lambda() (interactive)
                                           (if
                                               (boundp 'buyn-magit-buff-name)
                                               (progn
                                                 (switch-to-buffer-other-frame buyn-magit-buff-name)
                                                 (magit-refresh))

                                             (magit-status))))
(define-key evil-normal-state-map "ZMM" '(lambda() (interactive)
                                           (if
                                               (boundp 'buyn-magit-buff-name)
                                               (progn
                                                 (switch-to-buffer buyn-magit-buff-name)
                                                 (magit-refresh))
                                             (magit-status))))
(define-key evil-normal-state-map "ZME" '(lambda() (interactive)
                                           (magit-status user-emacs-directory)))
(define-key evil-normal-state-map "ZMDS" '(lambda() (interactive)
                                           (buyn-shell-start "emacs --debug-init")))

(define-key evil-normal-state-map "ZFF" 'find-file-other-frame)
(define-key evil-visual-state-map "ZFF" '(lambda() (interactive)
          (find-file-other-frame (buffer-substring (region-beginning) (region-end)))))
(define-key evil-normal-state-map "ZFI" '(lambda() (interactive)
          (find-file-other-frame (expand-file-name "INI/frame-control.el" user-emacs-directory))))

(define-key evil-normal-state-map "ZNN" '(lambda() (interactive)
      (switch-to-buffer-other-frame "*scratch*")
      (evil-buffer-new "*new*")))
(define-key evil-normal-state-map "ZNn" '(lambda() (interactive)
          (evil-buffer-new "*new*")))

;; (find-file-other-frame "~/.archemacs/INI/fullscreen-cfg.el")
(load (expand-file-name "INI/fullscreen-cfg.el" user-emacs-directory))

(defun buyn-get-frame-by-name (fname)
  "If there is a frame named FNAME, return it, else nil."
  (require 'dash) ; For `-some'
  (-some (lambda (frame)
           (when (equal fname (frame-parameter frame 'name))
             frame))
         (frame-list)))

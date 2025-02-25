;; * POWERLINE CUSTOMIZATION
;; --------------------------------------
;; ** install
;; https://github.com/Dewdrops/powerline
;; https://github.com/jonathanchu/emacs-powerline
(unless (package-installed-p 'powerline)
  (use-package powerline 
  ;; :ensure t 
    :quelpa ( powerline 
              ;; :repo "dewdrops/powerline"
              :repo "jonathanchu/emacs-powerline"
              :fetcher github)))
;; ** use-package powerline : 
;; *** --------------------------------------
(use-package powerline 
  ;; :ensure t
;; *** :init
  ;; :init 
  ;;  (set-face-attribute 'mode-line nil
  ;;                      :foreground "Black"
  ;;                      :background "DarkOrange"
  ;;                      :box nil)
  ;;  (setq powerline-arrow-shape 'curve);; 
;; *** :config : 
  :config
    ;; (load "~/ELs/powerline/sm-package-powerline.el")
    ;; (powerline-default-theme)
    (setq powerline-arrow-shape 'curve);; 
    (set-face-attribute 'mode-line nil
                        :foreground "Black"
                        :background "DarkOrange"
                        :box nil)
    (custom-set-faces
    '(mode-line ((t (
                      ;; :foreground "#030303"
                      ;; :background "#bdbdbd"
                      :foreground "Black"
                      :background "DarkOrange"
                      :box nil)))))
    ;; '(mode-line-inactive ((t (
    ;;                  :foreground "#f9f9f9"
    ;;                  :background "#666666"
    ;;                  :box nil)))))
;; *** END )
  )
;; --------------------------------------;;

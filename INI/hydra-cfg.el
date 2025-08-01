(use-package hydra :ensure t
  )

(defhydra spc-main-menu00 (:color blue)
;; ***** hint
    "
    ^Main^                00                ^Menus^          
    ^─────^───────────────────────────────────^─────^────────────
    _a_I      _d_ev menu    _o_rg-mode   _b_Org-Brain                       
    _w_ww     _t_elega      _y_nke-menu  _r_eader
    _c_ommands   _e_macs-menu   ya_s_nippet      
    _p_rev-menu   _q_uit   _SPC_ next  _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("o" org-menu/body)
    ("d" hydra-dev-menu/body)
    ("w" www-menu/body)
    ("t" telega-menu/body)
    ("e" hydra-emacs-menu/body)
    ("c" hydra-commands-menu/body)
    ("a" hydra-ai-menu/body)
    ("SPC" spc-main-menu01/body )
    ("y" hydra-yank-menu/body)
    ("n" spc-main-menu01/body)
    ("s" hydra-yasnippet/body )
    ("r" hydra-reader-menu/body )
    ("b" hydra-brain-org-menu/body)
    ("p" spc-main-menu99/body)
;; ***** END of def
  )

(setq pixel-wait 0)
(defhydra hydra-reader-menu (:color blue)
  ;; "Reader menu spd: % 'pixel-wait"
  "Reader menu "
  ;; "Reader menu spd: %(* 10 (- 1 pixel-wait))"
;; **** r : 
  ("r" (if (bound-and-true-p pixel-scroll-mode)
          (buyn-reader-end)
          (buyn-reader-start))
        "toggle reader")
;; **** f : 
  ("f" (setq pixel-wait (- pixel-wait 0.1))
          (format "faster spd:%s" (- 1 pixel-wait)) :color pink)
;; **** s : 
  ("s" (setq pixel-wait (+ pixel-wait 0.1)) "slower":color pink)
;; **** t : 
  ("t" read-aloud-this "aloudThis")
;; **** B : 
  ("B" read-aloud-buf "aloudBuffer")
;; **** s : 
  ("S" read-aloud-stop "StopAloud")
;; **** E : 
  ("E" read-aloud-change-engine "AloudEngine")
;; **** q : 
  ("q" nil "quit"))
;; --------------------------------------

(defhydra spc-main-menu01 (:color blue)
;; ***** hint
    "
    ^Main^       01        ^Menus^          
    ^────^─────────────────^─────^─────────
    _q_ quit              _o_ outline 
    _c_ calculus          _d_ ediff
    _t_ transpose         _l_it-menu
    _f_ occur-dwim        _SPC_ next    
    _p_rev-menu           _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("SPC" spc-main-menu98/body)
    ("c" (progn
      (define-key calc-mode-map (kbd "M-k") 'windmove-up)
      (calc)))
    ("o" hydra-outline/body) 
    ("d" hydra-ediff/body) 
    ("t" hydra-transpose/body) 
    ("f" hydra-occur-dwim/body)
    ("p" spc-main-menu00/body)
    ("n" spc-main-menu98/body)
    ("l" lit-menu/body)
;; ***** END of def
  )

(defhydra spc-main-menu98 (:color blue)
;; ***** hint
    "
    ^Main^             ^98^             ^  Menus^          
    ^─────^────────────^──^─────────────^───────^─────────
    _q_ quit  _R_evert-buffer  _L_ong-line 
    _K_eyboard-sound  off_k_eyboard-sound 
    _p_rev-menu                     _SPC_ _n_ext-menu    
    "
;; ***** keys
  ("q" nil)
  ("R" revert-buffer)
  ("L" toggle-truncate-lines)
  ("K" (progn
      (require 'async)
      (defun play-keyboard-sound ()
        (interactive)
        (async-start
          (play-sound-file "E:/Temp/wav/selectric-move.wav")))
        (add-hook 'pre-command-hook 'play-keyboard-sound)))

  ("k" (remove-hook 'pre-command-hook 'play-keyboard-sound))
  ("SPC" spc-main-menu99/body)
  ("n" spc-main-menu99/body)
  ("p" spc-main-menu01/body)
;; ***** END of def
  )

(defhydra spc-main-menu99 (:color blue)
;; ***** hint
    "
    ^Main^             ^99^             ^  Menus^          
    ^─────^────────────^──^─────────────^───────^─────────
    _q_uit            _i_n       _h_elp 
    ^^                _j_ump     _l_it-menu
    _p_rev-menu       _n_ext-menu    
    "
;; ***** keys
    ("q" nil)
    ("i" org-clock-in)
    ("j" org-clock-goto)
    ("o" org-clock-out)
  ("h" hydra-help-menu/body)
    ;; ("r" org-clock-report)
  ("n" spc-main-menu00/body)
  ("p" spc-main-menu98/body)
  ("l" lit-menu/body)
;; ***** END of def
  )

(fset 'mac-done-copy
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("dzadd`dpza``" 0 "%d")) arg)))

(defun curent-time-format-hh-mm (p-h p-m)
  "curent-time-format-hh-mm"
  (concat
    (number-to-string (+ p-h (nth 2 (decode-time))))
    ":"
    (let ((i (+ p-m (nth 1 (decode-time)))))
      (if (> i  9)
          (number-to-string i)
          (concat "0" (number-to-string i))))))

(defhydra hydra-yasnippet ( :color pink
              ;; :hint nil
              )
;; **** Hint
  "
              ^YASnippets^
--------------------------------------------
  Modes:    Load/Visit:    Actions:

 _g_lobal  _d_irectory    _i_nsert
 _m_inor   _f_ile         _t_ryout
 _e_xtra   _l_ist         _n_ew
 _q_uit    _a_ll
"
;; **** Keys
  ("d" yas-load-directory)
  ("e" yas-activate-extra-mode)
  ("i" yas-insert-snippet :color blue)
  ("w" yas-wrap-around-region :color blue)
  ("f" yas-visit-snippet-file :color blue)
  ("n" yas-new-snippet :color blue)
  ("t" yas-tryout-snippet)
  ("l" yas-describe-tables :color blue)
  ("g" yas/global-mode)
  ("m" yas/minor-mode)
  ("a" yas-reload-all)
  ("q" nil "quit")
;; **** END )
  )

(defhydra org-menu (:color pink)
    ("d" org-babel-demarcate-block "demarcate" :color blue)
    ("s" org-toggle-inline-images "Show image")
    ("q" nil ) 
    ("o" org-roam-menu/body "Org-rOam" :color blue)
    ("i" org-insert-menu/body "insert" :color blue)
  )

(defhydra org-roam-menu (:color blue)
;; ***** keys
    ("i" org-roam-node-insert "Insert")
    ("c" org-roam-capture "Capture")
    ("g" org-roam-graph "graph")
    ("a" org-roam-alias-add "Alias Add")
    ("q" nil)
    ("D" org-id-get-create "iD get create")
    ("F" (dendroam-node-find-initial-input) "h-Find")
    ("f" org-roam-node-find "Find")
    ("r" org-roam-buffer-display-dedicated "dedicated-buffeR")
    ("SPC" org-roam-buffer-toggle "Roam-buffeR")
    ("j" org-roam-dailies-capture-today "joarnal")
    ("t" org-roam-tag-add "Tag-add")
    ("S"
     (progn
       (org-roam-ui-mode)
       (message "server start on: http://127.0.0.1:35901/")) "Start/StopUI")
    ("z" org-roam-ui-node-zoom "Zoom")
    ("s" org-roam-ui-node-local "Show-node")
    ("R" org-roam-node-random "random")
    ("B" (org-roam-db-sync 'FORCE) "dB-Build")
;; ***** END of def
  )

(defhydra org-insert-menu (:color blue)
    ("t" (insert ":tangle no") "tangle no")
    ("r" (insert ":results output silent") "result no")
    ("h" (insert "#+HEADER: :tangle ../Src/Start.sh") "HEADER")
    ("f" (insert "(find-file-other-frame \" \")") "file frame")
    ("F" (insert "(find-file \" \"") "Find File)")
    ("s" (insert "(buyn-shell-start \" \")") "shell")
    ("k" (insert "(buyn-shell-start \"konsole -e ' '\")") "konsole")

    ("q" nil)
  )

(defhydra hydra-brain-org-menu (:color blue)
  ;; (global-map "C-c")
  "Org-Brain menu"
  ;; ("i" (org-brain-get-id)
  ;;   "addID2header")
  ;; ("I" (org-brain-headline-to-file)
  ;;   "addID2All")
  ("b" (progn
                                (setq-default tab-width 8)
                                (org-brain-visualize "index")
              (setq-default tab-width 2))
    "vis2index.org")
  ;; ("V" (org-brain-visualize (buffer-file-name))
  ;;   "vis2curent.org")
  ("v" (org-brain-visualize)
    "visualize")
  ;; ("B" (org-brain-entry-at-pt)
  ;;   "vis2at-pt")
  ("R" (org-brain-rename-file)
    "rename-file")
  ;; ("U" (org-brain-update-id-location)
  ;;   "updateID")
  ;; ("F" (org-brain-headline-to-file)
  ;;   "Hline2file")
  ;; ("w" (progn  
  ;;    ;; (find-file-other-frame "~/.archemacs/ELs/org-eww/org-eww.el")
  ;;    ;; (require 'org-eww "~/.archemacs/ELs/org-eww/org-eww.el")
  ;;    (org-eww-copy-for-org-mode)
  ;;    )
    ;; "web-page2Org")
  ("q" nil "quit")
  ;; --------------------------------------
  )

(defhydra hydra-emacs-menu (:color blue)
;; ***** keys
;; ****** w : 
    ("w" (if (eq evil-state 'visual)
                (query-replace
                            "/"
                            "\\"
                            nil
                            (region-beginning)
                            (region-end)
                            (current-kill 0 "DO-NOT-MOVE"))
                (query-replace
                            "/"
                            "\\"
                            nil
                            nil
                            (current-kill 0 "DO-NOT-MOVE"))) "To Win Format")
;; ****** u : 
    ("u" (if (eq evil-state 'visual)
                (query-replace
                            "\\"
                            "/"
                            nil
                            (region-beginning)
                            (region-end)
                            (current-kill 0 "DO-NOT-MOVE"))
                (query-replace
                            "\\"
                            "/"
                            nil
                            nil
                            (current-kill 0 "DO-NOT-MOVE"))) "To unix Format")
;; ****** m : 
    ("m" (progn
          (unless (fboundp 'mask_win_path)
              (load (expand-file-name "keymac/mask_win_path.el" user-emacs-directory)))
          (mask_win_path)) "maskSlesh")
;; ****** f : 
  ("f" hydra-emaks-fonts/body "fonts")
  ("t" (untabify (point-min) (point-max)) "untabify all")
;; ****** E : 
  ("E" evil-mode "evil mode")
;; ****** R : 
  ("R" revert-buffer "revert buffer") 
;; ****** W : 
  ("W" (revert-buffer-with-coding-system 'windows-1251) "win-1251") 
;; ****** q : 
  ("q" nil) 
;; ****** s : 
  ("s" copy-to-register "savTex2reg" :color blue ) 
;; ****** i : 
  ("i" insert-register "insReg2buff" :color blue ) 
  ("L" menu-bar--toggle-truncate-long-lines "long-lines")
;; ***** END of def
  )

(defhydra hydra-emaks-fonts (:color blue)
  "fonts menu "
;; **** u : 
  ("u" (set-frame-font "Ubuntu Mono" nil nil)
        "UbuntuMono")
;; **** c : 
  ("c" (set-frame-font "comic sans ms" nil nil)
        "ComicSansMS")
;; **** C : 
  ("C" (set-frame-font "comic Mono" nil nil)
        "ComicMono")
;; **** p : 
  ("p" (set-frame-font "Papyrus" nil nil)
        "Papyrus")
;; **** P : 
  ("P" (set-frame-font "Comic Papyrus" nil nil)
        "ComicPapyrus")
;; **** e : 
  ("e" (set-frame-font "Edwardian Script ITC" nil nil)
        "EdwardianS")
;; **** b : 
  ("b" (set-frame-font "Bamboo" nil nil)
        "Bamboo")
;; **** k : 
  ("k" (set-frame-font "Celtic Knots" nil nil)
        "KelticKnots")
;; **** t : 
  ("t" (set-frame-font "Times New Roman" nil nil)
        "TimesNewRoman")
;; **** q : 
  ("q" nil "quit"))

(defhydra www-menu (:color blue)
;; ***** hint
    "
                                   ^WWW  Menus^          
───────────────────────────────────^──────────^────────────────────────────────
_L_ist  _y_t  _B_ookmarks  _v_isual  _r_enameBuf _m_pv _f_irefox _c_hromium
_S_earchOtherF _s_earch _E_WordOthrF s_W_itch _p_ast&go _k_hinsider        
_Y_ankPageUrl  _f_rameLink _w_iki-trm  _z_oom  _q_uit _i_mgS
    "
;; ***** keys
;; ****** one-line keys
    ("L" (eww-list-buffers))
    ("W" (eww-switch-to-buffer))
    ("B" (eww-list-bookmarks))
    ("f" org-open-link-in-new-frame)
    ("z" hydra-zoom/body)
    ("r" rename-buffer)
  ("q" nil) 
;; ****** "v" : 
    ("v" (progn
      ;; (global-visual-line-mode t)
      (setq truncate-lines nil)
      (setq line-move-visual t)
      (setq word-wrap t)
       )
   )
;; ****** "m" : 
    ("m" (progn
          (eww-copy-page-url)
                                        (message (current-kill 0))
          ;; (buyn-shell-start (concat "mpv " (current-kill 0)))
                                        ))

;; ****** "f" : 
    ("f" (progn
          (eww-copy-page-url)
          (buyn-shell-start (concat "firefox " (current-kill 0)))))

;; ****** "c" : 
    ("c" (progn
          (eww-copy-page-url)
          (buyn-shell-start (concat "chromium " (current-kill 0)))))
;; ****** "s" : 
    ("s"  (
      let (buffer-name-to-close (buffer-name))
          (if (use-region-p)
            (eww (buffer-substring
                (region-beginning)
                (region-end)))
            (eww (buffer-substring
                (line-beginning-position)
                (line-beginning-position 2))))
          (switch-to-buffer buffer-name-to-close)))
;; ****** "S" : 
    ("S"  (
      let (buffer-name-to-close (buffer-name))
          (evil-window-split)
          (if (use-region-p)
            (eww (buffer-substring
                (region-beginning)
                (region-end)))
            (eww (buffer-substring
                (line-beginning-position)
                (line-beginning-position 2))))
          (evil-quit)
          (switch-to-buffer-other-frame buffer-name-to-close)))
;; ****** "w" : 
    ("w"  (
      let (buffer-name-to-close (buffer-name))
          (evil-window-split)
          (if (use-region-p)
            (eww (concat (buffer-substring
                            (region-beginning)
                            (region-end))
                         " site:en.wikipedia.org"))
            (eww (buffer-substring
                (line-beginning-position)
                (line-beginning-position 2))))
          (evil-quit)
          (switch-to-buffer-other-frame buffer-name-to-close)))
;; ****** "y" : 
    ("y"  (
      let (buffer-name-to-close (buffer-name))
          (evil-window-split)
          (if (use-region-p)
              (eww (concat
                    "https://vid.puffyan.us/search?q="
                    (buffer-substring
                            (region-beginning)
                            (region-end))))
            (eww (buffer-substring
                (line-beginning-position)
                (line-beginning-position 2))))
          (evil-quit)
          (switch-to-buffer-other-frame buffer-name-to-close)))
;; ****** "k" : 
    ("k"  (
      let (buffer-name-to-close (buffer-name))
          (evil-window-split)
          (if (use-region-p)
              (eww (concat
                    "https://downloads.khinsider.com/search?search="
                    (buffer-substring
                            (region-beginning)
                            (region-end))))
            (eww (buffer-substring
                (line-beginning-position)
                (line-beginning-position 2))))
          (evil-quit)
          (switch-to-buffer-other-frame buffer-name-to-close)))
;; ****** "i" : 
    ("i"  (
      let (buffer-name-to-close (buffer-name))
          (evil-window-split)
          (if (use-region-p)
              (eww (concat
                    "https://www.google.com/search?gbv=1&bih=&biw=&source=hp&hl=en&ie=ISO-8859-1&tbm=isch&q="
                    (buffer-substring
                            (region-beginning)
                            (region-end))))
            (eww (buffer-substring
                (line-beginning-position)
                (line-beginning-position 2))))
          (evil-quit)
          (switch-to-buffer-other-frame buffer-name-to-close)))
;; ****** "E" : 
    ("E"  (
      let (buffer-name-to-close (buffer-name))
          (evil-window-split)
          (if (use-region-p)
              (eww-search-words)
            (progn 
                ;; According to C-h f region-active-p, it seems that you should use use-region-p instead.
                ;; EDIT: I think that rebinding the key to the new command is a cleaner approach than the advice (other commands may be relying on the original version of eww-search).
                ;; (line-beginning-position)
                ;; (line-beginning-position 2)
                ;; (eww-search-words)))
                (eww (read-string "Query: ")))
          (evil-quit)
          (switch-to-buffer-other-frame buffer-name-to-close))))
;; ****** "Y" : 
    ("Y" (progn  
      (setq x-select-enable-clipboard t)
      (eww-copy-page-url)
      (setq x-select-enable-clipboard nil)
      ))
;; ****** "p" : 
  ("p" (progn  
      (setq x-select-enable-clipboard t)
      (eww (current-kill 0 "DO-NOT-MOVE"))
      (setq x-select-enable-clipboard nil)
      ))
;; ***** END of def
  )

(defhydra hydra-zoom (:color pink)
  ;; (global-map "C-c")
  "zoom"
  ("i" text-scale-increase "in")
  ("o" text-scale-decrease "out")
  ("p" www-menu/body "prev")
  ("q" nil "quit")
  )

(defhydra hydra-yank-menu (:color blue)
  ;; (global-map "C-c")
  "yank menu"
  ("y" (progn  
      (setq x-select-enable-clipboard t)
      (kill-new (current-kill 0 "DO-NOT-MOVE"))
      ;; (message last-clip)
      (setq x-select-enable-clipboard nil)
      )
    "reg2clipbord")
  ("s" (copy-to-buffer) "send2Buff")
  ("w" (progn  
      (setq x-select-enable-clipboard t)
      ;; (find-file-other-frame "~/.archemacs/ELs/org-eww/org-eww.el")
      ;; (require 'org-eww "~/.archemacs/ELs/org-eww/org-eww.el")
      (org-eww-copy-for-org-mode)
      (setq x-select-enable-clipboard nil)
      )
    "web-page2Org")
  ("q" nil "quit")
  ;; --------------------------------------
  )

(defhydra hydra-dev-menu (:color red)
  ;; (global-map "C-c")
  "dev menu"
  ("c" company-mode "company" :color blue)
  ("F" program-mode-hook-customize "fuze")
  ("f" flycheck-mode "flycheck")
  ("o" outshine-mode "outshine")
  ("e" elpy-hydra/body "elpy" :color blue)
  ("P" python-mode "pyton")
  ("p" parinfer-rust-mode "parinferR" :color blue)
  ("d" rainbow-delimiters-mode "delimiters")
  ("T"  (save-excursion
          (progn
            (org-babel-goto-named-src-block "auto-tangle-block")
            (org-babel-execute-src-block)))
        "execute auto-tangle-block" :color blue)
  ("t" (progn
            (setq org-src-preserve-indentation t)
            (untabify (point-min) (point-max))
            (save-buffer)
            (universal-argument)
            (universal-argument)
            (org-babel-tangle))
        "tangle only one file" :color blue)
  ("L" display-line-numbers-mode "line-numbers")
  ("y" hydra-yasnippet/body "yasnippet" :color blue)
  ("q" nil "quit")
  )

(defhydra elpy-hydra (:color blue)
  "
  Elpy in venv:
  "
  ;; Elpy in venv: %`venv-current-name
;; **** Keys
  ("d" (progn (call-interactively 'elpy-test-django-runner) (elpy-nav-errors/body)) "current test, Django runner" :color blue)
  ("t" (progn (call-interactively 'elpy-test-pytest-runner) (elpy-nav-errors/body)) "current test, pytest runner" :color blue)
  ("w" (venv-workon) "workon venv…")
  ("q" nil "quit")
  ("Q" (kill-buffer "*compilation*") "quit and kill compilation buffer" :color blue)
;; **** END )
  )

(defhydra elpy-hydra (:color blue)
  "
  Elpy in venv:
  "
  ;; Elpy in venv: %`venv-current-name
;; **** Keys
  ("d" (progn (call-interactively 'elpy-test-django-runner) (elpy-nav-errors/body)) "current test, Django runner" :color blue)
  ("t" (progn (call-interactively 'elpy-test-pytest-runner) (elpy-nav-errors/body)) "current test, pytest runner" :color blue)
  ("w" (venv-workon) "workon venv…")
  ("q" nil "quit")
  ("Q" (kill-buffer "*compilation*") "quit and kill compilation buffer" :color blue)
;; **** END )
  )

(defhydra elpy-nav-errors (:color red)
;; ***** Hint
  "
  Navigate errors
  "
;; ***** Keys
  ("n" next-error "next error")
  ("p" previous-error "previous error")
  ("s" (progn
         (switch-to-buffer-other-window "*compilation*")
         (goto-char (point-max))) "switch to compilation buffer" :color blue)
  ("w" (venv-workon) "Workon venv…")
  ("q" nil "quit")
  ("Q" (kill-buffer "*compilation*") "quit and kill compilation buffer" :color blue)
;; ***** END )
  )

(defhydra hydra-outline (:color pink :hint nil)
;; **** Hint
  "
^Hide^             ^Show^           ^Move
^^^^^^------------------------------------------------------
_q_: sublevels     _a_: all         _u_: up
_t_: body          _e_: entry       _n_: next visible
_o_: other         _i_: children    _p_: previous visible
_c_: entry         _k_: branches    _f_: forward same level
_l_: leaves        _s_: subtree     _b_: backward same level
_d_: subtree

"
;; **** Keys
  ;; Hide
  ("q" hide-sublevels)    ; Hide everything but the top-level headings
  ("t" hide-body)         ; Hide everything but headings (all body lines)
  ("o" hide-other)        ; Hide other branches
  ("c" hide-entry)        ; Hide this entry's body
  ("l" hide-leaves)       ; Hide body lines in this entry and sub-entries
  ("d" hide-subtree)      ; Hide everything in this entry and sub-entries
  ;; Show
  ("a" show-all)          ; Show (expand) everything
  ("e" show-entry)        ; Show this heading's body
  ("i" show-children)     ; Show this heading's immediate child sub-headings
  ("k" show-branches)     ; Show all sub-headings under this heading
  ("s" show-subtree)      ; Show (expand) everything in this heading & below
  ;; Move
  ("u" outline-up-heading)                ; Up
  ("n" outline-next-visible-heading)      ; Next
  ("p" outline-previous-visible-heading)  ; Previous
  ("f" outline-forward-same-level)        ; Forward - same level
  ("b" outline-backward-same-level)       ; Backward - same level
  ("z" nil "leave")
;; (global-set-key (kbd "C-c #") 'hydra-outline/body) ; by example
;; **** END )
  )

(defhydra hydra-commands-menu (:color blue)
  "
  commands menu:
  "
  ;; Elpy in venv: %`venv-current-name
  ("e" (hydra-eshell-menu/body) "eshell...")
  ("s" (hydra-shell-scripts-menu/body) "scripts...")
  ("l" (hydra-applancher-menu/body) "applancher...")
  ("m" (hydra-player-menu/body) "player...")
  ("p" (emms-pause) "playe/pause")
  ("q" nil "quit")
  )

(defhydra hydra-player-menu (:color blue)
  "
  commands menu:
  "
  ;; Elpy in venv: %`venv-current-name
  ("e" (emms) "emms")
  ("m" (buyn-shell-start (concat "haruna " (buffer-substring (region-beginning) (region-end)))) "2haruna")
  ("M" (buyn-shell-start (concat "mpv " (buffer-substring (region-beginning) (region-end)))) "2mpv")
  ("T" (progn
         (find-file-other-frame "~/Dropbox/Resources/Playlists/test.m3u")
         (emms-play-m3u-playlist "~/Dropbox/Resources/Playlists/test.m3u"))
   "test.m3u")
  ("w" (buyn-shell-start (concat "add2watchm3u " (buffer-substring (region-beginning) (region-end)))) "send2watch.m3u")
  ("W" (progn
          (find-file-other-frame "~/Dropbox/Resources/Playlists/Tech/watch.m3u")
          (emms-play-m3u-playlist "~/Dropbox/Resources/Playlists/Tech/watch.m3u"))
   "test.m3u")
  ("s" (emms-streams) "streams")
  ("q" nil "quit")
  )

(defhydra hydra-eshell-menu (:color blue)
  "
  Eshell menu:
  "
  ;; Elpy in venv: %`venv-current-name
  ("e" (let (buffer-name-to-close (buffer-name))
        (evil-window-split)
        (eshell)
        (evil-quit)
        (switch-to-buffer-other-frame buffer-name-to-close))
      "Open eshell")
  ("q" nil "quit")
  )

(defhydra hydra-shell-scripts-menu (:color blue)
  "
  Shell scripts menu:
  "
  ;; Elpy in venv: %`venv-current-name
  ("R" (progn
          (buyn-shell-start "sh_restart_plasmashell.sh")
          (delete-other-windows))
      "Restart plasmashell")
  ("s" (progn
          (buyn-shell-start "sudo systemctl suspend")
          (delete-other-windows))
      "sleep")
  ("H" (progn
          (buyn-shell-start "sudo systemctl hibernate")
          (delete-other-windows))
      "hibernate")
  ("Y" (progn
          (buyn-shell-start "sudo systemctl hybrid-sleep")
          (delete-other-windows))
      "hYbrid-sleep")
  ("P" (progn
         (buyn-shell-start "sh_off.sh")
         (delete-other-windows))
      "PoweOFF")
  ("q" nil "quit")
  )

(defhydra hydra-applancher-menu (:color blue)
  "
  App Lancher menu
  "
  ;; Elpy in venv: %`venv-current-name
  ("d" (progn
          (buyn-shell-start "emacs --debug-init")
          (delete-other-windows))
      "emacs debug")
  ("m" (progn
         (buyn-shell-start "chromium --profile-directory=Default --app-id=cbgioneaoelhfonhmabneendhdhileho")
            (setq x-select-enable-clipboard t)
            (kill-new "https://meet.google.com/ttu-evry-rvj")
            (setq x-select-enable-clipboard nil)
            (delete-other-windows))
      "my google meetup")
  ("g" (progn
         (buyn-shell-start "chromium --profile-directory=Default --app-id=bbfcdomagcggnpdkfbjfagpgafbehnkk")
         (delete-other-windows))
      "Gemeni")
  ("q" nil "quit")
  )

(defhydra hydra-ediff (:color blue :hint nil)
  "
;; **** Hint
^Buffers           Files           VC                     Ediff regions
----------------------------------------------------------------------
_b_uffers           _f_iles (_=_)       _r_evisions              _l_inewise
_B_uffers (3-way)   _F_iles (3-way)                           _w_ordwise
_?_ help            _c_urrent file                            
"
;; **** Keys
  ("b" ediff-buffers)
  ("B" ediff-buffers3)
  ("=" ediff-files)
  ("f" ediff-files)
  ("F" ediff-files3)
  ("c" ediff-current-file)
  ("r" ediff-revision)
  ("l" ediff-regions-linewise)
  ("w" ediff-regions-wordwise)
  ("?" (info "(ediff) Introduction"))
;; **** END )
  )

(defhydra hydra-transpose (:color red)
;; **** Hint
    "Transpose"
;; **** Keys
     ("c" transpose-chars "characters")
     ("w" transpose-words "words")
     ("o" org-transpose-words "Org mode words")
     ("l" transpose-lines "lines")
     ("s" transpose-sentences "sentences")
     ("e" org-transpose-elements "Org mode elements")
     ("p" transpose-paragraphs "paragraphs")
     ("t" org-table-transpose-table-at-point "Org mode table")
     ("q" nil "cancel" :color blue)
;; **** END )
  )

(defhydra lit-menu (:color pink)
;; ***** hint
    "
                ^OrphoGrammus  Menus^ z M-=         
    ────────────^───────────────────^───────────────────
     _[_ prev err    _]_ next err    _w_ word
     _p_rev cor err  _n_ext cor err  
     _f_lyspell      _c_omment chek  _q_uit
     _a_ll buffer    _r_egion cheak
     _R_u-RU    _D_ictonar chenge    _E_n-US
    "
;; ***** keys
    ("[" evil-prev-flyspell-error :color pink)
    ("]" evil-next-flyspell-error :color pink)
    ("n" flyspell-auto-correct-word :color pink)
    ("p" flyspell-auto-correct-previous-word :color pink)
    ("f" flyspell-mode :color pink)
    ("c" flyspell-prog-mode)
    ("a" flyspell-buffer)
    ;; ("R" ispell-change-dictionary "ru_RU")
    ("R" (progn
            (ispell-change-dictionary "ru_RU")
            (flyspell-mode t)))
    ("D" ispell-change-dictionary)
    ("E" (progn
            (ispell-change-dictionary "en_US")
            (flyspell-mode t)))
    ;; ispell-change-dictionary "en_US")
    ("r" ispell-region)
    ("w" ispell-word :color pink)
  ("q" nil) 
;; ***** END of def
  )

(defhydra hydra-help-menu (:color blue)
  ;; (global-map "C-c")
  "help menu"
  ("a" apropos "apropos")
  ("f" describe-face "describe-face")
  ("q" nil "quit")
  )

(defhydra hydra-f1-grimuar-menu (:color blue)
  ("c" (find-file-other-frame "~/Dropbox/Office/Research/Doc/Codex/BuYn_Codex.org") "Codex")
  ("a" (find-file-other-frame "~/Desktop/orgs/capture/astronomicon.org") "Astronomicon")
  ("E" (find-file-other-frame "~/Desktop/orgs/capture/emagus.org") "Emagus")
  ("n" (find-file-other-frame "~/Dropbox/orgs/capture/Necronomicon.org") "Necronomicon")
  ("t" (find-file-other-frame "~/Dropbox/orgs/capture/Necroteuch.org") "Necroteuch")
  ("T" (buyn-shell-start "/home/buyn/Dropbox/orgs/capture/Necroteuch.sh") "desk5Necroteuch")
  ("s" (find-file-other-frame "~/Dropbox/orgs/capture/Ansible.org") "Ansible")
  ("m" (find-file-other-frame "~/Dropbox/orgs/capture/Manabook.org") "Manabook")
  ("h" (find-file-other-frame "~/Dropbox/orgs/capture/holodeck.org") "Holodeck")
  ("p" (find-file-other-frame "~/Dropbox/orgs/capture/Pensieve.org") "Pensieve")
  ("q" nil)
  )

(defhydra hydra-f1-emagus-menu (:color blue)
  ("D" (buyn-shell-start "wmctrl -s 4 ; emacs --debug-init") "run debug")
  ("T" (find-file "~/Dropbox/orgs/Logs/Todos/log-todo-2024-04-28-W17.org") "log-todo")
  ("E" (find-file-other-frame (expand-file-name "init.org" user-emacs-directory)) "Emacs log")
  ("O" (find-file-other-frame "~/Dropbox/orgs/Code/emacs_GPT_2023-07-20.org") "Init org")
  ("S" (find-file-other-frame "~/Dropbox/orgs_code/archlinux/arh_script.org") "Script org")
  ("B" (find-file-other-frame "~/Dropbox/Office/Dev/Pytho/app/browserchuser.org") "browserScript org")
  ("d" (ranger "~/Dropbox/") "rager Dropbox")
  ("t" (ranger "~/Desktop/") "rager Desktop")
  ("w" (ranger "~/Downloads/") "rager Downloads")
  ("v" (ranger "~/Dev/") "rager Dev")
  ("q" nil)
  )

(global-set-key (kbd "M-<SPC>") 'spc-main-menu00/body)
(define-key evil-normal-state-map (kbd "z M-=") 'lit-menu/body)

(define-key evil-normal-state-map (kbd "M-a M-l M-o") 'lit-menu/body)

(define-key evil-visual-state-map (kbd "M-a M-l M-w") 'ispell-region)
(define-key evil-normal-state-map (kbd "M-a M-l M-w") 'ispell-word)

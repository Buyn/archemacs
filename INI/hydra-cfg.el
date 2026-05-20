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
  ;; **** "F9 F9" : 
  ("F9 F9" buyn/read-aloud-start "toggle aloudBuffer")
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
    ("q" nil "quit") 
    ("o" org-roam-menu/body "Org-rOam-menu" :color blue)
    ("i" org-insert-menu/body "insert-menu" :color blue)
    ("m" org-macro-menu/body "macros-menu" :color blue)
    ("a" (let* ((current-file (buffer-file-name))
         (archived-name (concat current-file "_archive")))
      (find-file-other-frame archived-name)) "open-arhiv" :color blue)
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
    ("R" (insert ":results output replace") "result yes")
    ("h" (insert "#+HEADER: :tangle ../Src/Start.sh") "HEADER")
    ("P" (insert ":PROPERTIES:\n:header-args: :tangle ~/.vimrc\n:END:") "PROPERTIES")
    ("f" (if (use-region-p)
            (let ((text (buffer-substring-no-properties
                        (region-beginning)
                        (region-end))))
              (delete-region (region-beginning) (region-end))
              (insert (format "(find-file-other-frame \"%s\")" text)))
            (progn (insert "(find-file-other-frame \"\")")
              (backward-char 2))
          ) "file frame")
    ("Ff" (insert "(find-file \"\")") "Find File)")
    ("s" (insert "(buyn-shell-start \" \")") "shell")
    ("Fs" (insert "(find-file-other-frame \"/sudo:: \")") "Sudo")
    ("FN" (insert "(find-file-other-frame \"/ssh:buyn@192.168.0.1/~/ \")") "ssh")
    ("FS" (insert "(find-file-other-frame \"/ssh:buyn@192.168.0.1|sudo::/etc/ \")") "ssh sudo")
    ("k" (insert "(buyn-runin-konsole-commаnd \"\")") "konsole")
    ("d" (insert "(delete-other-windows)") "del wins")
    ("q" nil)
  )

(defhydra org-macro-menu (:color blue)
    ("l" (progn
          (call-interactively 'org-store-link)  
          (defalias 'insert-pop-macro
            (kmacro "A C-c C-l C-j C-j C-j <return> <escape>"))
          (define-key evil-normal-state-map (kbd "<f5>") 'org-store-link)
          (define-key evil-normal-state-map (kbd "<f6>") 'insert-pop-macro) 
            ) "link macros f5f6")
    ("c" (progn
            (org-todo "") 
            (evil-next-visual-line) 
          ) "todo clear")
    ("q" nil)
  )

(defhydra hydra-brain-org-menu (:color blue)
  ;; (global-map "C-c")
  "Org-Brain menu"
  ("b" (progn
                                (setq-default tab-width 8)
                                (org-brain-visualize "index")
              ;; (setq-default tab-width 2)
              )
    "vis2index.org")
  ;; ("V" (org-brain-visualize (buffer-file-name))
  ;;   "vis2curent.org")
  ("v" (call-interactively #'org-brain-visualize-dwim)
    "visualize")
  ("V" (call-interactively #'org-brain-visualize)
    "2visualize")
  ;; ("B" (org-brain-entry-at-pt)
  ;;   "vis2at-pt")
  ("R" (call-interactively #'org-brain-rename-file)
    "rename-file")
  ("g" (call-interactively #'org-brain-goto)
    "goto")
  ("p" (call-interactively #'org-brain-goto-parent)
    "2parent")
  ("P" (call-interactively #'org-brain-add-parent)
    "+parent")
  ("f" (call-interactively #'org-brain-goto-friend)
    "2friend")
  ("F" (call-interactively #'org-brain-add-friendship)
    "+friend")
  ("c" (call-interactively #'org-brain-goto-child)
    "2child")
  ("C" (call-interactively #'org-brain-add-child)
    "+child")
  ("q" nil "quit")
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
;; ****** A : 
  ("A" auto-revert-mode "auto-revert buffer") 
;; ****** p : 
  ("p"
   (let ((file (or (buffer-file-name)
                  (user-error "Buffer is not visiting a file"))))
    (kill-new file)         ;; копирует в kill-ring
    (insert file)           ;; вставляет в текст
    (message "Inserted and copied: %s" file)) "buffpath") 

;; ****** W : 
  ("W" (revert-buffer-with-coding-system 'windows-1251) "win-1251") 
;; ****** q : 
  ("q" nil) 
;; ****** s : 
  ("s" copy-to-register "savTex2reg" :color blue ) 
;; ****** i : 
  ("i" insert-register "insReg2buff" :color blue ) 
  ("L" menu-bar--toggle-truncate-long-lines "long-lines")

  ("h" org-appear-mode "auto-emphasis")
  ("H" (if org-hide-emphasis-markers
           (setq org-hide-emphasis-markers nil)
           (setq org-hide-emphasis-markers t)) "emphasis")
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
_L_ist  _y_t  _B_ookmarks  _v_isual  _r_enameBuf _m_pv _f_irefox(s) _c_hromium
_S_earchOtherF _s_earch _E_WordOthrF s_W_itch _p_ast&go _k_hinsider        
_Y_ankPageUrl  _o_rameLink _w_iki-trm  _z_oom  _q_uit _i_mgS
    "
;; ***** keys
;; ****** one-line keys
    ("L" (eww-list-buffers))
    ("W" (eww-switch-to-buffer))
    ("B" (eww-list-bookmarks))
    ("o" org-open-link-in-new-frame)
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
    ("f" )
        (if (use-region-p)
            (progn
              (buyn-shell-start (concat
                    "firefox "
                    "\""
                    "https://www.google.com/search?q="
                    (buffer-substring
                            (region-beginning)
                            (region-end))
                    "\""))
              (delete-other-windows))
            (progn
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
            (buyn-shell-start (concat
                  "firefox "
                  "\""
                  "https://www.google.com/search?q="
                  (buffer-substring
                          (region-beginning)
                          (region-end))
                  "&sclient=gws-wiz-img"
                  "\""))
            (buyn-shell-start (concat
                  "firefox "
                  "\""
                  "https://www.google.com/search?q="
                  (buffer-substring
                      (line-beginning-position)
                      (line-beginning-position 2))
                  "&sclient=gws-wiz-img"
                  "\""))
          (delete-other-windows))))
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

(defun buyn/convert-markdown-to-org (text)
  "Конвертирует TEXT из Markdown в Org-mode по правилам.
На старте конвертирует строки, начинающиеся с '* ', в '- '.
Можно легко добавлять новые правила в список `rules`."
  (let ((rules
         ;; Список правил: (регэксп . замена)
         '(("^\\* " . "- "))))  ; Markdown '* ' → Org '- '
    (dolist (rule rules text)
      (setq text (replace-regexp-in-string (car rule) (cdr rule) text)))))

(defhydra hydra-yank-menu (:color blue)
  ;; (global-map "C-c")
  "yank menu"
  ("y" (progn  
      (setq x-select-enable-clipboard t)
      (kill-new (current-kill 0 "DO-NOT-MOVE"))
      ;; (message last-clip)
      (setq x-select-enable-clipboard nil)
      ) "reg2clipbord")
  ("s" (copy-to-buffer) "send2Buff")
  ("w" (progn  
      (setq x-select-enable-clipboard t)
      ;; (find-file-other-frame "~/.archemacs/ELs/org-eww/org-eww.el")
      ;; (require 'org-eww "~/.archemacs/ELs/org-eww/org-eww.el")
      (org-eww-copy-for-org-mode)
      (setq x-select-enable-clipboard nil)
      ) "web-page2Org")
  ("o" (progn  
      (setq x-select-enable-clipboard t)
      (insert (buyn/convert-markdown-to-org (current-kill 0 t)))
      (setq x-select-enable-clipboard nil)
      ) "2Org")
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

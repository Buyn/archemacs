;; * BUYN's ELISP DEFUNS
;; --------------------------------------
;; ** varibls
;; (setq path-to-emagus-cmd "d:/Development/lisp/Emacs/bin/runemacs.exe") 
(setq path-to-emagus-cmd "D:/Development/lisp/Home/emacs_Run_home.cmd") 
(setq path-to-far "D://shell//FAR//Far.exe")
(setq path-to-emagus-client "d:/Development/lisp/Emacs/bin/emacsclientw.exe -n -c -a ''") 
(setq path-to-emagus-client-buyn "d:/Development/lisp/Emacs/bin/emacsclientw.exe -n -c -a 'buyn'") 
;; ** functions
;; *** buyn-shell-start :
(defun buyn-shell-start (cmd-params)
  " buyn start new process
    as parametr  
    get comand to execute
    "
  (shell-command
   (concat 
    cmd-params
    " &")))

;; *** buyn-cmd-start :
(defun buyn-cmd-start (cmd-params)
  " buyn start new cmd process
    as parametr  
    get comand to execute
    "
  (shell-command
   (concat "cmd"
           " /c "
           " start "
           cmd-params
           " &")))

;; *** buyn-cmd-start-syn :
(defun buyn-cmd-start-syn (cmd-params)
  " buyn start new cmd process
    as parametr  
    get comand to execute
    "
  (shell-command
   (concat "cmd"
           " /c "
           " start "
           cmd-params
           )
   )
  )

;; *** buyn-far :
(defun buyn-far (cmd-params)
  " buyn start new cmd process
    as parametr  
    get comand to execute
    "
  (buyn-cmd-start
   (concat path-to-far
           " "
           cmd-params
           ;; " &"
           )
   )
  )

;; *** buyn-start-emagus :
(defun buyn-start-emagus (unix-path-to-file)
  " buyn start new emacs process
    as parametr  
    get file path in unix format
    unix-path-to-file path to file in unix format
    "
  (shell-command
   (concat path-to-emagus-cmd
           " "
           unix-path-to-file
           " &"
           )
   )
  )

;; *** buyn-start-emagus-win : 
(defun buyn-start-emagus-win (win-path-to-file)
  "  buyn start new emacs process
    as parametr  
    get file path in Windos format
    win-path-to-file path to file in unix format
    "
  ;; (message (replace-regexp-in-string "/" (regexp-quote "\\") win-path-to-file t t))
  (buyn-start-emagus
   ;; (message 
   (replace-regexp-in-string "\\\\" "/" win-path-to-file t t)
   )
  ;; (message (replace-regexp-in-string "\\\\" "/" win-path-to-file t t ))
  ;; (replace-regexp-in-string "/" "\\" path t t)
  ;; (replace-string "f" win-path-to-file)
  ;; (message win-path-to-file)
  )

;; ---------------------------
;; Global variable
;; ---------------------------

(defvar buyn/name-shell-target-buffer-name "*eshell*"
  "Name of the EShell-like buffer to send code to.")

;; ---------------------------
;; Choose buffer to use
;; ---------------------------

(defun buyn/set-name-shell-target-buffer ()
  "Set global target buffer for sending lines/regions."
  (interactive)
  (setq buyn/name-shell-target-buffer-name (buffer-name))
  (message "Target Shell buffer name set to: %s" buyn/name-shell-target-buffer-name))

;; ---------------------------
;; Core send region function
;; ---------------------------

(defun buyn/send-region-to-target-name-shell (start end &optional buffer-name-to-send)
  "Send region to target name-shell buffer and execute.
If BUFFER-NAME-TO-SEND is nil, uses global `buyn/name-shell-target-buffer-name`."
  (interactive "r")
  (let* ((origin (current-buffer))
         (target (get-buffer (or buffer-name-to-send buyn/name-shell-target-buffer-name))))

    (unless target
      (error "Target buffer %s does not exist" buyn/name-shell-target-buffer-name))

    ;; append region to name-shell
    (prepend-to-buffer target start end)

    ;; switch → execute → switch back
    (switch-to-buffer-other-frame target)
    (evil-insert-state)
    ;; (evil-open-below)
    (execute-kbd-macro "\C-m")
    (evil-normal-state)
    (switch-to-buffer-other-frame origin)))

;; ---------------------------
;; Line version
;; ---------------------------

(defun buyn/send-line-to-target-name-shell ()
  "Send current line to target name-shell buffer."
  (interactive)
  (call-interactively
  (buyn/send-region-to-target-name-shell
   (line-beginning-position)
   (line-beginning-position 2))))

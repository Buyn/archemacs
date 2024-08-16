;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/.archemacs/INI/init.el")
;; * --------------------------------------
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
  "	buyn start new process
		as parametr  
		get comand to execute
		"
  (shell-command
		(concat 
						cmd-params
						" &"
						)
		)
  )

;; *** buyn-cmd-start :
(defun buyn-cmd-start (cmd-params)
  "	buyn start new cmd process
		as parametr  
		get comand to execute
		"
  (shell-command
		(concat "cmd"
						" /c "
						" start "
						cmd-params
						" &"
						)
		)
  )

;; *** buyn-cmd-start-syn :
(defun buyn-cmd-start-syn (cmd-params)
  "	buyn start new cmd process
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
  "	buyn start new cmd process
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
  "	buyn start new emacs process
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
   "	buyn start new emacs process
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

;; * BUYN's ELISP DEFUNS
;; --------------------------------------
;; ** send-region-to-eshell-buffer-and-execute:
(defun send-region-to-eshell-buffer-and-execute(start end );&optional INTERCT
  "	Make the custom function interactive and operative on a region
		prepend to the buffer named *eshell*
		switches to the buffer
		and execute-kbd-macro for enter C-m
		switches back to start buffe
		"
  (interactive "r") 
	(let ((buffer-name-to-back (buffer-name)))
			(prepend-to-buffer (get-buffer "*eshell*") start end)
			(switch-to-buffer-other-frame (get-buffer "*eshell*"))
			;; (evil-insert-state)
			(execute-kbd-macro "\C-m")
			(switch-to-buffer-other-frame buffer-name-to-back)))
;; ** send-activ-line-to-eshell-buffer-and-execute:
(defun send-activ-line-to-eshell-buffer-and-execute()
  "	Make the custom function interactive
		evaluet send-region-to-eshell-buffer-and-execute
		with region as from start to end line "
  (interactive) 
	(call-interactively
		(send-region-to-eshell-buffer-and-execute (line-beginning-position) (line-beginning-position 2))))

;; * --------------------------------------

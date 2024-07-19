;; * buton press
;; ** ai-dungeon-buyn-press-retry
(defun ai-dungeon-buyn-press-retry ()
  "press Retry last result to Ai dungeon"
	;; (ai-dungeon-buyn-string-to-log "==========================")
	(skewer-eval "[...document.all].find(el => el.innerText === '󰜉').click();")
  )

;; ** ai-dungeon-buyn-press-editlast
(defun ai-dungeon-buyn-press-editlast ()
  "send Press editlast to Ai dungeon
	"
	(skewer-eval "
		[...document.all].find(el => el.innerText === '󰏫').click();
		"))
;; ** ai-dungeon-buyn-press-cancel
(defun ai-dungeon-buyn-press-cancel ()
  "send Press cancel to Ai dungeon "
	(skewer-eval "[...document.all].find(el => el.innerText === '󰅖').click();"))
;; ** ai-dungeon-buyn-press-send
(defun ai-dungeon-buyn-press-send ()
  "send Press Send to Ai dungeon
	"
	(skewer-eval 
		"[...document.all].find(el => el.innerText === '󰒊').click();
		"))
;; ** ai-dungeon-buyn-press-undo
(defun ai-dungeon-buyn-press-undo ()
  "send Press Send to Ai dungeon
	"
	(skewer-eval 
		" [...document.all].find(el => el.innerText === '󰕌').click();"))
;; ** ai-dungeon-buyn-set-focus-to-textarea
(defun ai-dungeon-buyn-set-focus-to-textarea ()
  "set focus to textarea in Ai dungeon
		may need to activate chrom window to worked out
	"
	(skewer-eval "document.querySelector('textarea').focus();"))
;; ** ai-dungeon-buyn-send-string-to-textarea
(defun ai-dungeon-buyn-send-string-to-textarea (ins-text)
  "Send string to Ai dangeon textarea"
	(let ((tmp-command (concat
								"document.querySelector('textarea').value=`"
								(ai-dungeon-buyn-filter-from-emaks ins-text)
								"`;")))
		(skewer-eval tmp-command)))

;; ** ai-dungeon-buyn-ahk-for-char-in-textarea
(defun ai-dungeon-buyn-ahk-for-char-in-textarea ()
  "Run ahk script to send simbol chenge
		in textarea
		Send char to Ai dangeon textarea and
		delete Sendet char to Ai dangeon textarea
		"
	(skewer-eval "document.querySelector('textarea').focus();")
	(buyn-cmd-start-syn "chrom_spc_bs.ahk"))

;; ** ai-dungeon-buyn-ahk-for-char-in-textarea
(defun ai-dungeon-buyn-ahk-for-chars-in-textarea ()
  "Run ahk script to send simbol chenge
		in textarea
		Send char to Ai dangeon textarea and
		delete Sendet char to Ai dangeon textarea
		"
	(ai-dungeon-buyn-set-focus-to-textarea)
	(buyn-cmd-start-syn "chrom_d_spc_bs.ahk"))

;; ** ai-dungeon-buyn-set-send
(defun ai-dungeon-buyn-set-send (text-status)
  "set send state to say action in Ai dungeon
	 textarea
	"
	(skewer-eval (concat
	 "result ='"
		text-status
		"';
		label_batton = document.querySelector('textarea').parentElement.children[0].children[0];
		for (var i = 0; i < 3 || label_batton.ariaLabel !== result; i++)
			{label_batton.click();}
		if (label_batton.ariaLabel !== result)
			{skewer.log('ERROR= not found text on send');}")))

;; * log command
;; ** ai-dungeon-buyn-string-to-log
(defun ai-dungeon-buyn-string-to-log (ins-text)
  "send string from Ai dungeon to emaks log
	"
	(let ((tmp-command (concat
								"skewer.log('"
								ins-text
								"');")))
		(skewer-eval tmp-command)))
;; ** ai-dungeon-buyn-textarea-to-log
(defun ai-dungeon-buyn-textarea-to-log ()
  "send textarea from Ai dungeon to emaks log
	"
	;; (ai-dungeon-buyn-string-to-log "==========================")
	;; skewer.log('============================');
	(skewer-eval "skewer.log(document.querySelector('textarea').value);"))
;; ** ai-dungeon-buyn-log-the-last
(defun ai-dungeon-buyn-log-the-last ()
  "send last line from Ai dungeon to emaks log
	"
	(ai-dungeon-buyn-press-editlast)
	(ai-dungeon-buyn-textarea-to-log)
	(ai-dungeon-buyn-press-cancel))
;; * complecs commands
;; ** ai-dungeon-buyn-retry
(defun ai-dungeon-buyn-retry ()
  "Retry last result from Ai dangeon
		and send in repel log
	"
	(ai-dungeon-buyn-string-to-log "=========== RETRY =============")
	(ai-dungeon-buyn-press-retry)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; ** ai-dungeon-buyn-continue
(defun ai-dungeon-buyn-continue ()
  "continue last result to Ai dangeon
		and send result in repel log
	"
	(ai-dungeon-buyn-string-to-log "==========================")
	(ai-dungeon-buyn-press-send)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last))

;; ** ai-dungeon-buyn-corectlast
(defun ai-dungeon-buyn-corectlast ()
  "corectlast result Ai dangeon
		and send result in repel log
	"
	(ai-dungeon-buyn-press-editlast)
	(ai-dungeon-buyn-set-focus-to-textarea)
	(ai-dungeon-buyn-send-string-to-textarea
		(buffer-substring (region-beginning) (region-end)))
	(evil-normal-state)
	(ai-dungeon-buyn-set-focus-to-textarea)
	(ai-dungeon-buyn-ahk-for-char-in-textarea)
	(sit-for 1)
	;; (ai-dungeon-buyn-press-send)
	(ai-dungeon-buyn-set-focus-to-textarea)
	;; (sit-for 4)
	;; (ai-dungeon-buyn-log-the-last)
	)

;; ** ai-dungeon-buyn-send-region
(defun ai-dungeon-buyn-send-region (&optional status-text)
  "continue last result to Ai dangeon
		and send result in repel log
	"
	(when status-text
		(ai-dungeon-buyn-set-send status-text))
	(ai-dungeon-buyn-send-string  
		(buffer-substring (region-beginning) (region-end))))

;; ** ai-dungeon-buyn-send-string
(defun ai-dungeon-buyn-send-string (string-text)
  "send string to Ai dangeon with default
		and send result in repel log
	"
	(ai-dungeon-buyn-send-string-to-textarea string-text)
	(ai-dungeon-buyn-ahk-for-char-in-textarea)
	(ai-dungeon-buyn-string-to-log "-------------------------------")
	(sit-for 1)
	(ai-dungeon-buyn-press-send)
	(sit-for 4)
	(ai-dungeon-buyn-log-the-last)
	(ai-dungeon-buyn-set-focus-to-textarea))

;; * Emaks string control
;; ** ai-dungeon-buyn-send-region-to-emacs
(defun ai-dungeon-buyn-send-region-to-emacs-buffer(to-buffer-name)
  "result from Ai dangeon log
		send to target buffer"
	(let ((cur-region-text (buffer-substring (region-beginning) (region-end))))
  (set-text-properties 0 (length cur-region-text) nil cur-region-text)
	(with-current-buffer to-buffer-name (insert
																			 (ai-dungeon-buyn-filter-from-aidungeon cur-region-text)))))

;; * filters commands
;; ** ai-dungeon-buyn-filter-from-emaks : 
(defun ai-dungeon-buyn-filter-from-emaks (string-text)
  "Filter string for browser to maskig
		simbils with sleshes"
	(replace-regexp-in-string "\\\"" "\"" 
			(replace-regexp-in-string "\\\\n$" "" string-text)))
;; ** ai-dungeon-buyn-filter-from-aidungeon : 
(defun ai-dungeon-buyn-filter-from-aidungeon (string-text)
  "Filter string for browser to maskig
		simbils with sleshes"
	(replace-regexp-in-string "\\\\n" "\n"
		(replace-regexp-in-string "\\\\\"" "\""
			(replace-regexp-in-string "^\"\\|\"$" "" string-text)))
	)
;; * Hidra menu
;; ** defhydra
(defhydra spc-ai-dungeon-menu (:color red)
;; *** hint
    "
    _q_ quit     _j_retry    c_o_ntinue  _SPC_menu _l_og2buffer
    _L_loglast   _C_ancel    _R_etryP    _U_ndo
    _c_orectlast _d_oRegion  _s_ayRegion s_t_oryRegion 
    "
;; *** keys
    ("q" nil)
    ("SPC" (spc-main-menu01/body))
    ("j" (ai-dungeon-buyn-retry))
    ("o" (ai-dungeon-buyn-continue))
    ("L" (ai-dungeon-buyn-log-the-last) :color blue)
		("C" (ai-dungeon-buyn-press-cancel) )
		("R" (ai-dungeon-buyn-press-retry))
		("c" (ai-dungeon-buyn-corectlast) :color blue)
		("U" (ai-dungeon-buyn-press-undo))
		("d" (ai-dungeon-buyn-send-region "Do") :color blue)
		("s" (ai-dungeon-buyn-send-region "Say") :color blue)
		("t" (ai-dungeon-buyn-send-region "Story") :color blue)
		("l" (ai-dungeon-buyn-send-region-to-emacs-buffer "Story.org") :color blue)
;; *** END of def
	)
;; --------------------------------------
;; ** Bind
(global-set-key (kbd "S-<SPC>") 'spc-ai-dungeon-menu/body)


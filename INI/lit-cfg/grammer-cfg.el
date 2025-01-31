;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/lit-cfg.el")
;; (find-file-other-frame "~/INI/lit-cfg.el") 
;; --------------------------------------
;; *  --------------------------------------
;; * GRAMMER-MOD CUSTOMIZATION 
;; *** ispell
;; (setq ispell-program-name "~/AddApps/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")   
;; **** use-package  
(use-package ispell   
	:config   
  ;; :init
		;; (setq ispell-program-name "~/AddApps/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")   
		;; (setq ispell-program-name "D:/Development/lisp/HOME/AddApps/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")   
	)
;; **** Docs
;; ***** exempls
;; (use-package ispell   
;; 	:config   
;; 		(setq ispell-program-name "C:/Program Files (x86)/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")   
;; 		(setq ispell-local-dictionary "en_US")    
;; 		(setq ispell-local-dictionary-alist       
;; 			'(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
;; 	)


;; ***** Commands
;; (ispell)  to run check
;; (ispell-change-dictionary) to RU
;; *  --------------------------------------

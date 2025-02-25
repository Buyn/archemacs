;; * READ-ALOUD-MOD CUSTOMIZATION 
;; *** load
;; (find-file-other-frame "~/INI/lit-cfg/read-aloud-cfg.el") 
;; (load "~/ELs/text-to-speech/read-aloud/read-aloud.el")
;; *** use-package read-aloud : 
;; (add-to-list 'load-path "~/ELs/text-to-speech/read-aloud")
(use-package read-aloud
  :defer t
  :load-path "ELs/text-to-speech/read-aloud"
  ;; :ensure t
;; *** :config : 
  :config
;; **** plist read-aloud-engines : 
;; ***** ru : 
;; ****** elena : 
(lax-plist-put read-aloud-engines "bal.ru.elena"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Elena" "-i" "-enc" "utf8")))
;; ****** Alyona22k : 
(lax-plist-put read-aloud-engines "bal.ru.Alyona22k"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Alyona22k" "-i" "-enc" "utf8")))
;; ****** anna : 
(lax-plist-put read-aloud-engines "bal.ru.anna"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "RHVoice Anna" "-i" "-enc" "utf8")))
;; ****** Irina : 
(lax-plist-put read-aloud-engines "bal.ru.Irina"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Irina" "-i" "-enc" "utf8")))
;; ****** Katerina : 
(lax-plist-put read-aloud-engines "bal.ru.Katerina"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Katerina" "-i" "-enc" "utf8")))
;; ****** Tatyana : 
(lax-plist-put read-aloud-engines "bal.ru.Tatyana"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Tatyana" "-i" "-enc" "utf8")))
;; ****** Milena : 
(lax-plist-put read-aloud-engines "bal.ru.Milena"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Milena" "-i" "-enc" "utf8")))
;; ***** ua : 
;; ******  Natalia : 
(lax-plist-put read-aloud-engines "bal.ua.Natalia"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Natalia" "-i" "-enc" "utf8")))
;; ***** en : 
;; ****** Slt : 
(lax-plist-put read-aloud-engines "bal.en.Slt"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Slt" "-i" "-enc" "utf8")))
;; ****** Bdl : 
(lax-plist-put read-aloud-engines "bal.en.Bdl"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Bdl" "-i" "-enc" "utf8")))
;; ****** Clb : 
(lax-plist-put read-aloud-engines "bal.en.Clb"
  '(cmd "~/AddApps/balcon/balcon.exe"
    args ( "-n" "Clb" "-i" "-enc" "utf8")))

;; ****** Heather
  (lax-plist-put read-aloud-engines "bal.en.Heather"
    '(cmd "~/AddApps/balcon/balcon.exe"
      args ( "-n" "Heather" "-i" "-enc" "utf8")))
;; ****** Lucy
(lax-plist-put read-aloud-engines "bal.en.Lucy"
  '(cmd "~/AddApps/balcon/balcon.exe"
      args ( "-n" "Lucy" "-i" "-enc" "utf8")))
;; ****** Jane22k
(lax-plist-put read-aloud-engines "bal.en.Jane"
  '(cmd "~/AddApps/balcon/balcon.exe"
      args ( "-n" "Jane" "-i" "-enc" "utf8")))
;; ****** jampal.en : 
  (lax-plist-put read-aloud-engines "jampal.en"
    '(cmd "cscript"
          args ("D:\\Development\\lisp\\Home\\AddApps\\Jampal\\ptts.vbs" "-r" "1")))
;; **** setq read-aloud-engine : 
;; (setq read-aloud-engine "jampal.en"))
;; (setq read-aloud-engine "balcon.ru")
;; (setq read-aloud-engine "bal.en.Slt")
  (setq read-aloud-engine "bal.en.Lucy")
;; *** ===========END========= ) : 
  )
;; ** Docs
;; *** Usage 
;; M-x read-aloud-this -- pronounce either the selection or a word under the pointer.
;; M-x read-aloud-buf -- read the buffer starting from the current cursor position, highlighting the text as it moves down the buffer. Useful only for plain text files.
;; top reading at any time you either run any of the commands above again, or do M-x read-aloud-stop.
;; M-x read-aloud-change-engine -- select another engine (for this Emacs session). It also shows which one is the current.

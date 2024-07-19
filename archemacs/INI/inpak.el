;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; * used in
;; (find-file "~/INI/init.el")
;; --------------------------------------
;; --------------------------------------
;; * INSTALL PACKAGES
;; --------------------------------------
;; ** add package-archives
;; --------------------------------------
(require 'package)
;; add from melpa site;  {{{
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
; }}}
;; (add-to-list 'package-archives
;; ;;        '("melpa" . "http://melpa.org/packages/") t)
;;        '("melpa" . "http://melpa.org/packages/") )
;; (add-to-list 'package-archives 
;; 		 '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives 
		 '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; --------------------------------------
;; ** Automatically Installing Packages
;; --------------------------------------
;; D:\Development\lisp\doc\Cfg\use-pac.txt
;; --------------------------------------
;; M-x package-refresh-contents
;; before
;; M-x package-install RET evil
;; if you're going to call (package-initialize) yourself.
;;(setq package-enable-at-startup nil)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages '(
	better-defaults
	use-package
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
;; (require 'use-package)

;; tar not found when trying to install from melpa 
;; You probably have an outdated package database
;; (package-refresh-contents)
;; ;; This is only needed once, near the top of the file
;; (eval-when-compile
;;   ;; Following line is not needed if use-package.el is in ~/.emacs.d
;;   (add-to-list 'load-path "<path where use-package is installed>")
;;   (require 'use-package))
;; --------------------------------------
;; ** quelpa-use-package :
;; --------------------------------------
(require 'use-package) 
(use-package quelpa-use-package :ensure t)
;; --------------------------------------
;; * --------------------------------------

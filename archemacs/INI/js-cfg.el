;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; * not used in
;; (find-file "~/INI/dev-cfg.el")
;; --------------------------------------
;; * Setting up js2-mode
;; ** use-package js2-mode
(use-package js2-mode :ensure t
  ;; :disabled
  ;; :config
;; *** END of use-package 
  )
(require 'js2-mode)
;; --------------------------------------
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
;; js2-refactor and xref-js2
;; ** D use-package js2-refactor
(use-package js2-refactor
  :disabled
	:ensure t
;; *** END of use-package hydra
  )
;; ** D use-package xref-js2
(use-package xref-js2 :ensure t
  :disabled
  :config
  ;; :defer 2
	(require 'js2-refactor)
	(add-hook 'js2-mode-hook #'js2-refactor-mode)
	(js2r-add-keybindings-with-prefix "C-c C-r")
	(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
	;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
	;; unbind it.
	(define-key js-mode-map (kbd "M-.") nil)
	(add-hook 'js2-mode-hook (lambda ()
		(add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
;; *** END of use-package hydra
  )

;; --------------------------------------
;; * D ---------      Tern & Company     ----
;; may need add this commands for node.js
;; set "PATH=%PATH%;D:\Development\JS\nodejs\"
;; (setenv "PATH" (concat (getenv "PATH") "D:/Development/JS/nodejs"))
;; (setq exec-path (append exec-path '("D:/Development/JS/nodejs/")))
;; ** terns 
;; This is Tern. Tern is a stand-alone, editor-independent
;; JavaScript analyzer that can be used to improve the JavaScript
;; integration of existing editors.
(add-to-list 'load-path "~/.emacs.d/Els/Tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; ** company-tern
(use-package company-tern :ensure t
  :disabled
  ;; :defer 2
  ;; :bind ("C-c c" hydra-clock/body)
	:config
	(add-to-list 'company-backends 'company-tern)
	;; (add-hook 'js2-mode-hook (lambda ()
	;;                            (tern-mode)
	;;                            (company-mode)))
	(add-hook 'js-mode-hook (lambda ()
														(tern-mode)
														(company-mode)))
;; ***  END of use-package 
  )
;; --------------------------------------
;; * skewer-mode
;; --------------------------------------
;; ** use-package skewer-mode
(use-package skewer-mode :ensure t
  ;; :disabled
;; ** :config : 
  :config
	(add-hook 'js2-mode-hook 'skewer-mode)
	(add-hook 'css-mode-hook 'skewer-css-mode)
	(add-hook 'html-mode-hook 'skewer-html-mode)
;; ** END of use-package
  )
;; --------------------------------------

;; * JS-MOD CUSTOMIZATION
;; --------------------------------------
;; ** Docs
;; --------------------------------------
;; Refactorings
;;     ee is expand-node-at-point: Expand bracketed list according to node type at point (array, object, function, call args).
;;     cc is contract-node-at-point: Contract bracketed list according to node type at point (array, object, function, call args).
;;     ef is extract-function: Extracts the marked expressions out into a new named function.
;;     em is extract-method: Extracts the marked expressions out into a new named method in an object literal.
;;     tf is toggle-function-expression-and-declaration: Toggle between function name() {} and var name = function ();
;;     ta is toggle-arrow-function-and-expression: Toggle between function expression to arrow function.
;;     ts is toggle-function-async: Toggle between an async and a regular function.
;;     ip is introduce-parameter: Changes the marked expression to a parameter in a local function.
;;     lp is localize-parameter: Changes a parameter to a local var in a local function.
;;     wi is wrap-buffer-in-iife: Wraps the entire buffer in an immediately invoked function expression
;;     ig is inject-global-in-iife: Creates a shortcut for a marked global by injecting it in the wrapping immediately invoked function expression
;;     ag is add-to-globals-annotation: Creates a /*global */ annotation if it is missing, and adds the var at point to it.
;;     ev is extract-var: Takes a marked expression and replaces it with a var.
;;     el is extract-let: Similar to extract-var but uses a let-statement.
;;     ec is extract-const: Similar to extract-var but uses a const-statement.
;;     iv is inline-var: Replaces all instances of a variable with its initial value.
;;     rv is rename-var: Renames the variable on point and all occurrences in its lexical scope.
;;     vt is var-to-this: Changes local var a to be this.a instead.
;;     ao is arguments-to-object: Replaces arguments to a function call with an object literal of named arguments.
;;     3i is ternary-to-if: Converts ternary operator to if-statement.
;;     sv is split-var-declaration: Splits a var with multiple vars declared, into several var statements.
;;     ss is split-string: Splits a string.
;;     st is string-to-template: Converts a string into a template string.
;;     uw is unwrap: Replaces the parent statement with the selected region.
;;     lt is log-this: Adds a console.log() statement for what is at point (or region). With a prefix argument, use JSON pretty-printing.
;;     dt is debug-this: Adds a debug() statement for what is at point (or region).
;;     sl is forward-slurp: Moves the next statement into current function, if-statement, for-loop or while-loop.
;;     ba is forward-barf: Moves the last child out of current function, if-statement, for-loop or while-loop.
;;     k is kill: Kills to the end of the line, but does not cross semantic boundaries.

;; There are also some minor conveniences bundled:

;;     C-S-down and C-S-up moves the current line up or down. If the line is an element in an object or array literal, it makes sure that the commas are still correctly placed.
;; https://github.com/magnars/js2-refactor.el
;; --------------------------------------
;; Using xref-js2
;;     M-. Jump to definition
;;     M-? Jump to references
;;     M-, Pop back to where M-. was last invoked.

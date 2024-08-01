;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; --------------------------------------
;; INSTALL IRONY
;; --------------------------------------
;; (package-install irony)
;; Configuration
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; irony-mode should work fine on Windows but there are some things to take care of first.
;; libclang.dll is expected to be available in the PATH or in Emacs' exec-path.
;;     w32-pipe-read-delay default value of 50 should be changed. This should not cause any issue on today's version of Windows. The default value of 50 may be lowered in mainline Emacs in future versions, until then, I suggest to set it to 0.
;;     w32-pipe-buffer-size, introduced by Emacs 25, can be set to a larger value than the default to improve irony-server communication performances (c.f. https://github.com/Sarcasm/irony-mode/issues/321). The variable to customize is irony-server-w32-pipe-buffer-size.
;; Windows performance tweaks
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

;; Usage
;; On the first run, irony-mode will ask you to build and install irony-server. To do so, type M-x
irony-install-server
;; To tune irony-mode, use customize:
;; (
;;  customize-group irony
;; 				 )
;; In order to provide context sensitive and accurate information, irony-mode needs to know about the compiler flags used to parse the current buffer. The best way to achieve this is to use a Compilation Database.
;; Right now irony-cdb supports the following compilation databases:
;;     JSON Compilation Database - A JSON formatted file generated by various build tools. The file is named compile_commands.json, it lists the compile options associated to each file in the project.
;;         CMake >= 2.8.5 will generate a compilation database in the build directory when issuing the following command cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON <...>.
;;         ninja >= 1.2 will generate a JSON Compilation Database when using the compdb tool.
;;         Bear generates a JSON Compilation Database file by "monitoring" the build of a project. The typical usage for a make-based project will be bear -- make -B.
;;     .clang_complete - A file at the root of your project containing the compilation flags, one per line. This is compatible with the with plugin Rip-Rip/clang_complete. If you want to generate the .clang_complete automatically, take a look at the cc_args.py documentation.
;; More detailed information on compilation database is available here:
;;     https://sarcasm.github.io/notes/dev/compilation-database.html
;; --------------------------------------
(
 package-install
 company-irony
 )
;; Configuration
;; Add company-irony to your company backends.
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
;; --------------------------------------
(package-install flycheck-irony)
;; Configuration
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; --------------------------------------
;; irony-eldoc - irony-mode support for eldoc-mode
(package-install irony-eldoc)
;; This implements eldoc support in irony-mode. eldoc is a built-in Emacs mode for displaying documentation about a symbol or function call at point in the message buffer (see eldoc-mode).
;; To use
;; Enable the minor mode irony-eldoc, as well as eldoc-mode. For an example, place point on top of a symbol, or inside a function call.
;; It is easiest to add irony-eldoc to irony-mode-hook, if you already have irony-mode set up.
(add-hook 'irony-mode-hook #'irony-eldoc)
;; --------------------------------------
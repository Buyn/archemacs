;; --------------------------------------
;; init.el --- Emacs configuration
;; --------------------------------------
;; (setq wakatime-api-key '1c5b877e-c9e1-4c6f-8767-0f2b91713cad
;;       wakatime-python-bin 'python
;;       )
;; (global-wakatime-mode)
;; (load "~/INI/time-tracking-cfg.el")
(load "~/.emacs.d/Els/code-stats/code-stats-emacs/code-stats.el")
(load "~/.emacs.d/Els/code-stats/code-stats-emacs/code-stats-tests.el")
(require 'code-stats)
(setq code-stats-token "SFMyNTY.UW5WWmJnPT0jI05qQXdNZz09.1h4hpvckNRH1BiYBcsaJmzeKYp_-HvbAzwkIcpEkHNg")
(add-hook 'prog-mode-hook #'code-stats-mode)
(run-with-idle-timer 30 t #'code-stats-sync)
(add-hook 'kill-emacs-hook (lambda () (code-stats-sync :wait)))

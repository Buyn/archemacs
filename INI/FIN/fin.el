(use-package hledger-mode
  ;; :disabled
  :ensure t
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :init
  (setq hledger-jfile
        (expand-file-name "~/Dropbox/Office/finance/hledger/personal/accounting.journal"))
  :config
  (add-hook 'hledger-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (add-to-list 'company-backends 'hledger-company)))
  :preface
  (defun hledger/next-entry ()
    "Move to next entry and pulse."
    (interactive)
    (hledger-next-or-new-entry)
    (hledger-pulse-momentary-current-entry))
  (defun hledger/prev-entry ()
    "Move to last entry and pulse."
    (interactive)
    (hledger-backward-entry)
    (hledger-pulse-momentary-current-entry))
  :bind (("C-c M-j" . hledger-jentry)
         :map hledger-mode-map
         ("C-c e" . hledger-run-command)
         ("M-N" . hledger/prev-entry)
         ("M-n" . hledger/next-entry))
  )

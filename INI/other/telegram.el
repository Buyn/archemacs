(use-package telega
  ;; :disabled
  :ensure t
  :defer t

  :config
    (setq telega-server-libs-prefix "/usr")
    (setq telega-emoji-use-images nil)

    (setq telega-chat--display-buffer-action
          '((display-buffer-reuse-window display-buffer-pop-up-frame)
            (reusable-frames . visible)
            (inhibit-same-window . t)))

)

(setq display-buffer-alist
      '(("^\\*telega-chat:"  ; буферы чатов Telega
         (display-buffer-pop-up-frame)  ; открывать в новом фрейме
         (inhibit-same-window . t))))

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

(defhydra telega-menu (:color blue)
  ("t" (progn
        (switch-to-buffer-other-frame "*scratch*")
        (telega)) "telega")
  ("s" telega-switch-buffer "tg buffer swch")
  ("c" telega-chat-with "chat with")
  ("S" telega-buffer-file-send "send file")
    ;; Prepare FILE to be sent as document or photo to CHAT. If C-u is specified, then always send as a file. Otherwise FILE type is automatically detected. If called interactively, then file associated with current buffer is used as FILE. If current buffer is dired, then send all marked files.
  ("u" telega-switch-unread-chat "2unread")
  ("o" telega-browse-url "open url")
    ;; Open the URL. If URL can be opened directly inside telega, then do it. Invite links and link to users can be directly opened in telega. If IN-WEB-BROWSER is non-nil then force opening in web browser.
  ("i" telega-switch-important-chat "2important")

  ("q" nil "quit"))

(setq display-buffer-alist
      '(("^\\*telega-chat:"  ; буферы чатов Telega
         (display-buffer-pop-up-frame)  ; открывать в новом фрейме
         (inhibit-same-window . t))))

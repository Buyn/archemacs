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
  ("b" telega-switch-buffer "tg buffer swch")
  ("s" telega-sticers-menu/body "sticers")
  ("c" telega-chats-menu/body "chats")
  ("k" telega-kanals-menu/body "chanels")
  ("S" telega-buffer-file-send "send file")
    ;; Prepare FILE to be sent as document or photo to CHAT. If C-u is specified, then always send as a file. Otherwise FILE type is automatically detected. If called interactively, then file associated with current buffer is used as FILE. If current buffer is dired, then send all marked files.
  ("u" telega-switch-unread-chat "2unread")
  ("o" telega-browse-url "open url")
    ;; Open the URL. If URL can be opened directly inside telega, then do it. Invite links and link to users can be directly opened in telega. If IN-WEB-BROWSER is non-nil then force opening in web browser.
  ("i" telega-switch-important-chat "2important")

  ("q" nil "quit"))

(defhydra telega-chats-menu (:color blue)
  ("S" telega-saved-messages "my saved")
  ("c" telega-chat-with "chat with")
  ("w"(telega-chat-with (telega-chat-get 333446310)) "Witch_stitch")
  ("M"(telega-chat-with (telega-chat-get 385863809)) "Mama")
  ("v"(telega-chat-with (telega-chat-get 330057169)) "Vadim")
  ("v"(telega-chat-with (telega-chat-get 377971359)) "Gladun")
  ("s"(telega-chat-with (telega-chat-get 312609632)) "Sofist")
  ("z"(telega-chat-with (telega-chat-get 7966334078)) "zmei")
  ("t"(telega-chat-with (telega-chat-get 449609352)) "tut uni")

  ("m"(telega-chat-with (telega-chat-get -1002463244025)) "memgumin")
  ("n"(telega-chat-with (telega-chat-get -1001232115728)) "novators")
  ("P"(telega-chat-with (telega-chat-get -1001274893255)) "polden")
  ("g"(telega-chat-with (telega-chat-get -1001709303239)) "Godess")

  ("q" nil "quit"))

(defhydra telega-kanals-menu (:color blue)
  ("k"(telega-chat-with (telega-chat-get -1001084173001)) "Kac")
  ("n"(telega-chat-with (telega-chat-get -1001231519967)) "Nevsorov")
  ("b"(telega-chat-with (telega-chat-get -1001231519967)) "Be or")
  ("c"(telega-chat-with (telega-chat-get -1002001086400)) "Creators")
  ("s"(telega-chat-with (telega-chat-get -1001709303239)) "Shulman")
  ("g"(telega-chat-with (telega-chat-get -1001188997171)) "Glupov")
  ("t"(telega-chat-with (telega-chat-get -1001403554585)) "tabakerk")
  ("V"(telega-chat-with (telega-chat-get -1001662388432)) "Vanek")
  ("p"(telega-chat-with (telega-chat-get -1001098515055)) "Portikov")
  ("P"(telega-chat-with (telega-chat-get -1001348775964)) "Proxima")
  ("v"(telega-chat-with (telega-chat-get -1001727795284)) "Volya")
  ("e"(telega-chat-with (telega-chat-get -1001188837703)) "epic")
  ("g"(telega-chat-with (telega-chat-get -1001251600941)) "gameOver")


  ("q" nil "quit"))

(defhydra telega-sticers-menu (:color blue)
  ("s" telega-sticker-choose-favorite-or-recent "recent")
  ("S" telega-stickerset-choose "stickerset")
  ("n" (insert "⟬Sticker XXX Id: 6553⟭")  "Nochy")
  ("l" (insert "⟬Sticker XXX Id: 6595⟭")  "Laghf knite")


  ("q" nil "quit"))

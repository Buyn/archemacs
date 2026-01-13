(use-package telega
  ;; :disabled
  :ensure t
  :defer t

  :config
    (setq telega-server-libs-prefix "/usr")
    (setq telega-emoji-use-images nil)
    (setq telega-use-docker t)
    (evil-mode 1)

(evil-define-key 'normal telega-chat-mode-map
  (kbd "t r") 'telega-sticker-choose-favorite-or-recent
  (kbd "t s") 'telega-stickerset-choose

  (kbd "C-c C-c") 'telega-chatbuf-send)

(evil-define-key 'insert telega-chat-mode-map
  (kbd "C-c C-c") 'telega-chatbuf-send)

      (setq telega-chat--display-buffer-action
            '((display-buffer-reuse-window display-buffer-pop-up-frame)))

    (add-hook 'telega-chat-mode-hook
              (lambda ()
                (evil-local-mode 1)
                (ispell-change-dictionary "ru_RU")
                (flyspell-mode t)
                (evil-normalize-keymaps)))

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
  ("G"(telega-chat-with (telega-chat-get 377971359)) "Gladun")
  ("s"(telega-chat-with (telega-chat-get 312609632)) "Sofist")
  ("z"(telega-chat-with (telega-chat-get 7966334078)) "zmei")
  ("t"(telega-chat-with (telega-chat-get 449609352)) "tut uni")

  ("m"(telega-chat-with (telega-chat-get -1002463244025)) "memgumin")
  ("n"(telega-chat-with (telega-chat-get -1001232115728)) "novators")
  ("P"(telega-chat-with (telega-chat-get -1001274893255)) "polden")
  ("g"(telega-chat-with (telega-chat-get -1001709303239)) "Godess")
  ("T"(telega-chat-with (telega-chat-get -1002362784223)) "TechoMagic")
  ("Z"(telega-chat-with (telega-chat-get -1002389433036)) "Zombrex")


  ("q" nil "quit"))

(defhydra telega-kanals-menu (:color blue)
  ("v"(telega-chat-with (telega-chat-get -1001727795284)) "Volya")
  ("V"(telega-chat-with (telega-chat-get -1001662388432)) "Vanek")
  ("b"(telega-chat-with (telega-chat-get -1001169049438)) "Be or")
  ("n"(telega-chat-with (telega-chat-get -1001231519967)) "Nevsorov")
  ("k"(telega-chat-with (telega-chat-get -1001084173001)) "Kac")
  ("s"(telega-chat-with (telega-chat-get -1001485724714)) "Shulman")
  ("S"(telega-chat-with (telega-chat-get -1002224420961)) "Svet")
  ("p"(telega-chat-with (telega-chat-get -1001098515055)) "Portikov")
  ("P"(telega-chat-with (telega-chat-get -1001348775964)) "Proxima")
  ("c"(telega-chat-with (telega-chat-get -1002001086400)) "Creators")
  ("t"(telega-chat-with (telega-chat-get -1001403554585)) "tabakerk")
  ("e"(telega-chat-with (telega-chat-get -1001188837703)) "epic")
  ("g"(telega-chat-with (telega-chat-get -1001251600941)) "gameOver")


  ("q" nil "quit"))

(defhydra telega-sticers-menu (:color blue)
  ("s" telega-sticker-choose-favorite-or-recent "recent")
  ("S" telega-stickerset-choose "stickerset")
  ("n" (insert "⟬Sticker XXX Id: 6553⟭")  "Nochy")
  ("l" (insert "⟬Sticker XXX Id: 6595⟭")  "Laghf knite")


  ("q" nil "quit"))

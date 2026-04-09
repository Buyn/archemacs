(use-package read-aloud
  :ensure t
  :defer t
  :load-path "ELs/text-to-speech/read-aloud/"
  :config
    (lax-plist-put read-aloud-engines "spd.ru.irina"
      '(cmd "spd-say"
        args ("-t" "FEMALE1" "-l" "ru" "-e"))) 

    (lax-plist-put read-aloud-engines "spd.en.hfc_female"
      '(cmd "spd-say"
        args ("-t" "FEMALE1" "-l" "en" "-e"))) 

    (lax-plist-put read-aloud-engines "spd.en.amy"
      '(cmd "spd-say"
        args ("-t" "amy" "-l" "en" "-e"))) 

    (lax-plist-put read-aloud-engines "google.tr.ru"
      '(cmd "google-tts"
        args ("ru")))
    (lax-plist-put read-aloud-engines "google.tr.en"
      '(cmd "google-tts"
        args ("en")))
    (lax-plist-put read-aloud-engines "google.tr.uk"
      '(cmd "google-tts"
        args ("uk")))
    )

(defvar buyn/read-aloud-origin-buffer nil
  "Buffer from which read aloud was started.")

(defvar buyn/read-aloud-buffer nil
  "Buffer where read aloud is active.")

(defvar buyn/read-aloud-paused nil
  "State of read aloud: nil = playing, t = paused.")

(defun buyn/read-aloud-start ()
  "Toggle read aloud play/pause with buffer switching."
  (interactive)
  (setq buyn/read-aloud-origin-buffer (current-buffer))
  (call-interactively #'read-aloud-buf)
  (setq buyn/read-aloud-buffer (current-buffer))
  (setq buyn/read-aloud-paused nil)
  (global-set-key (kbd "<f9> <f9>") #'buyn/read-aloud-toggle)
  (message "Read aloud started. f9 f9 set to pause"))

(defun buyn/read-aloud-toggle ()
  "Toggle read aloud play/pause with buffer switching."
  (interactive)
  (cond
   ;; пауза
   ((not buyn/read-aloud-paused)
    (let ((origin (current-buffer)))
      (when (buffer-live-p buyn/read-aloud-buffer)
        (switch-to-buffer buyn/read-aloud-buffer)
        (call-interactively #'read-aloud-stop))
      (switch-to-buffer origin))
    (setq buyn/read-aloud-paused t)
    (message "Read aloud paused"))

   ;; продолжение
   (buyn/read-aloud-paused
    (let ((origin (current-buffer)))
      (when (buffer-live-p buyn/read-aloud-buffer)
        (switch-to-buffer buyn/read-aloud-buffer)
        (call-interactively #'read-aloud-buf))
      (switch-to-buffer origin))
    (setq buyn/read-aloud-paused nil)
    (message "Read aloud resumed"))))

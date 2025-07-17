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
  )

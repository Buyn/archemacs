(fset 'mac-done-copy
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("zodzadd`dpza``" 0 "%d")) arg)))
(global-set-key (kbd "<f5>") 'mac-done-copy)

;; ‘insert-kbd-macro’
;; (insert-kbd-macro)


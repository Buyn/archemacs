(fset 'calc-and-save
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([3 42 f2 105] 0 "%d")) arg)))

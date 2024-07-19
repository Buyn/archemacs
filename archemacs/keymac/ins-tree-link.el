(fset 'ins-tree-link
   (lambda (&optional arg) "Keyboard macro."
		(interactive "p") (kmacro-exec-ring-item '([C-return 32 32 3 12 return return] 0 "%d") arg)))
(global-set-key (kbd "<f6>") 'ins-tree-link)

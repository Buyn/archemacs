(fset 'ins_bufer_next
   (kmacro-lambda-form [?o escape ?\C-v escape ?\M-c ?\M-o] 0 "%d"))

(global-set-key (kbd "<f5>") 'ins_bufer_next)

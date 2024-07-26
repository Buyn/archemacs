(fset 'calc-all
   (kmacro-lambda-form [escape ?\C-u ?\C-c ?*] 0 "%d"))
(global-set-key (kbd "<f5>") 'calc-all)


(fset 'convert-ru-point
   (kmacro-lambda-form [?ð ?ð ?J ?F ?, ?r ?.] 0 "%d"))
(global-set-key (kbd "<f6><f6>") 'convert-ru-point)

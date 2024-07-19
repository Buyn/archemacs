(fset 'mask_win_path
   (kmacro-lambda-form [?\C-\M-  ?\M-% ?\\ return ?\\ ?\\ return ?! ?g ?v ?\M-% ?\" delete return ?\\ ?\" return ?!] 0 "%d"))

(global-set-key (kbd "<f6>") 'mask_win_path)

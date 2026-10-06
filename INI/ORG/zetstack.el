(use-package zetstack
  :straight (:host github
             :repo "Buyn/zetstack.el")
  :config
  (defhydra hydra-zetstack-menu (:color blue)
      ("P" zetstack-create-prev "create-prev")
      ("N" zetstack-create-next "create-next")
      ("s" zetstack-rename-and-save "rename&save" :color red)
      ("p" zetstack-goto-prev "goto-prev" :color pink)
      ("n" zetstack-goto-next "goto-next" :color pink)
      ("in" zetstack-insert-current-at-name-next "insert-at-next")
      ("ip" zetstack-insert-current-at-name-prev "insert-at-prev")
      ("cp" zetstack-insert-new-prev-to-name "creat-new-before")
      ("cn" zetstack-insert-new-next-to-name "creat-new-after")
      ("o" zetstack-open-by-name "open-by-name")
      ("L" zetstack-add-link "add-link")
      ("l" zetstack-add-stub-link "stub-link") 
      ("DD" zetstack-remove-current-file "Del") 
      ("q" nil "quit")))

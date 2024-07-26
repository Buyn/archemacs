(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(

    (python . t)

    (eshell . t)

    (shell       . t)
    (clojure     . t)
    (lua         . t)
    (sql        . t)
    (sqlite     . t)
    (js         . t)
    (css        . t)
    (plantuml   . t)

   ))

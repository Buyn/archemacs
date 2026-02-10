(use-package renpy-mode
  :ensure t
  :defer t
  :custom
    (renpy-program "/home/buyn/Game/Tools/renpy-8.5.2-sdk/renpy.sh")
  :hook
    ;; Enable on-the-fly linting and code overview.
    ((renpy-mode . flymake-mode)
    (renpy-mode . outline-minor-mode)))

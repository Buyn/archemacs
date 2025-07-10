;; * FULLSCREEN-MOD CUSTOMIZATION
;; --------------------------------------

(defun toggle-fullscreen-smart ()
  "Toggle fullscreen and font size based on current state."
  (interactive)
  (let* ((fullscreen (frame-parameter nil 'fullscreen))
         (is-fullscreen (memq fullscreen '(maximized fullboth fullheight)))
         (font-scale (if (boundp 'text-scale-mode-amount)
                         text-scale-mode-amount
                       0))
         (is-large-font (> font-scale 0)))

    (cond
     ;; Шрифт большой, окно не fullscreen → включить fullscreen
     ((and is-large-font (not is-fullscreen))
      (toggle-frame-maximized))

     ;; Шрифт обычный, окно fullscreen → выключить fullscreen
     ((and (not is-large-font) is-fullscreen)
      (toggle-frame-maximized))

     ;; Шрифт обычный, окно не fullscreen → включить fullscreen и увеличить шрифт
     ((and (not is-large-font) (not is-fullscreen))
      (toggle-frame-maximized)
      (text-scale-set +3))

     ;; Шрифт большой, окно fullscreen → уменьшить шрифт и выйти из fullscreen
     ((and is-large-font is-fullscreen)
      (text-scale-set 0)
      (toggle-frame-maximized)))))

(global-set-key [(control shift f)]  'toggle-fullscreen-smart)

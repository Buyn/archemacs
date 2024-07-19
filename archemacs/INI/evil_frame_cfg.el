;; --------------------- 
;; open comand on new frame 
;; --------------------- 
(defun run-command-in-new-frame (prefixarg command-name)
 (interactive (list current-prefix-arg (read-extended-command)))
 (let ((command (intern-soft command-name)))
   (unless command
    (error "%s is not a valid command name" command-name))
  (select-frame (make-frame))
  (let ((prefix-arg prefixarg))
    (command-execute command))))

(defun simple-run-command-in-new-frame (command)
  (select-frame (make-frame))
  (funcall command)
  (delete-other-windows))
;; --------------------- 
;; key for open comand on new frame 
;; --------------------- 
(define-key evil-normal-state-map "gtc" 'run-command-in-new-frame)
;; --------------------- 
;; key for open help on new frame 
;; --------------------- 
(define-key evil-normal-state-map "gthf" (lambda () (interactive) (simple-run-command-in-new-frame 'describe-function)))
(define-key evil-normal-state-map "gthk" (lambda () (interactive) (simple-run-command-in-new-frame 'describe-key)))

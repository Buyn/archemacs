(use-package gptel
  ;; :disabled
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "M-a M-j M-S-h") 'gptel-system-prompt)
  (define-key evil-normal-state-map (kbd "M-a M-j M-j") 'gptel-send)
  (define-key evil-normal-state-map (kbd "M-a M-j M-h") 'gptel-mode)
  ;; (setq gpt-openai-key "sk-*")
  (setq gptel-default-mode 'org-mode)
  (custom-set-variables '(gptel-model 'gemini-flash-lite-latest))
  ;; (let* ((additional-models
  ;;         '(gemini-flash-latest
  ;;           gemini-2.5-flash
  ;;           gemini-2.0-flash-exp-image-generation
  ;;           gemini-2.5-flash-preview-tts
  ;;           gemini-flash-lite-latest
  ;;           gemini-pro-latest
  ;;           nano-banana-pro-preview
  ;;           veo-3.0-generate-001
  ;;           veo-3.0-fast-generate-001)))
  ;;   (setf (gptel-backend-models gptel-backend)
  ;;         (delete-dups
  ;;           (append additional-models
  ;;                   (gptel-backend-models gptel-backend))))) 
  )

(defhydra hydra-ai-menu (:color blue)
  "
  gptel-model: %`gptel-model
  "
  ("a" (hydra-ai-commands-menu/body) "AI commands")
  ("c" (hydra-ai-chat-menu/body) "AI chat")
  ("m" (hydra-ai-model-menu/body) "AI model")
  ("r" (hydra-ai-role-menu/body) "AI roles")
  ("d" (hydra-ai-docs-menu/body) "AI docs")
  ("q" nil) 
  )

(defhydra hydra-ai-commands-menu (:color blue)
  ("o" gptel-org-set-properties "add orgprops")
  ("f" gptel-add-file "add file")
  ("a" gptel-add "add buffer/region")
  ;; gptel-add  Add/remove a region or buffer to gptel’s context. In Dired, add/remove marked files.  
  ("r" gptel-rewrite "add buffer/region")
  ;; gptel-rewrite  Rewrite, refactor or change the selected region. Can diff/ediff changes before merging/applying.  
  ("c" gptel-context-visit "context-visit")
  ("P" gptel-system-prompt "system-prompt")

  ("q" nil) 
  )

(defhydra hydra-ai-model-menu (:color blue)
  "
  gptel-model: %`gptel-model
  "
  ;; (find-file-other-frame "~/Dropbox/backup/models/gemeni1-5.el")
  ("g" (load "~/Dropbox/backup/models/gemeni1-5.el") "Gemeni")
  ;; (find-file-other-frame "~/Dropbox/backup/models/fast-gemeni.el")
  ("f" (load "~/Dropbox/backup/models/fast-gemeni.el") "FastGemeni")
  ;; (find-file-other-frame "~/Dropbox/backup/models/claude.el")
  ("c" (load "~/Dropbox/backup/models/claude.el") "Claude")
  ;; (find-file-other-frame "~/Dropbox/backup/models/openai.el")
  ("o" (load "~/Dropbox/backup/models/openai.el") "gpt-4o-mini")
  ;; (find-file-other-frame "~/Dropbox/backup/models/mixtral.el")
  ("m" (load "~/Dropbox/backup/models/mixtral.el") "mixtral")
  ;; (find-file-other-frame "~/Dropbox/backup/models/llama70v.el")
  ("l" (load "~/Dropbox/backup/models/llama70v.el") "llama70v")
  ("q" nil) 
  )

(defhydra hydra-ai-docs-menu (:color blue)
  ("c" (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/open-al-chat.org") "open-al-chat")
  ("m" (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/multiagent-ai.org") "multiagent-ai")
  ("a" (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/al-Audio-gen.org") "al-Audio-gen")
  ("s" (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/Stable_Diffusion.org") "Stable_Diffusion")
  ("S" (find-file-other-frame "~/Dropbox/Office/Games/Game-logs/AI/2024-06-07-SD-story.org") "SD-log")
  ("d" (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/worlds.org") "aiworlds")
  ("C" (find-file-other-frame "~/Dropbox/Office/Research/Doc/Codex/BuYn_Codex.org") "BuYn_Codex")
  ("q" nil) 
  )

(defhydra hydra-ai-role-menu (:color blue)
  ("e" (load "~/Dropbox/Office/Games/aidungeon/els/acid-elisp.el") "elisp Acid")
  ("p" (load "~/Dropbox/Office/Games/aidungeon/els/acid-python.el") "Py Acid")
  ("s" (load "~/Dropbox/Office/Games/aidungeon/els/ai-synod.el")
   "Synode AI")
  ("l" (load "~/Dropbox/Office/Games/aidungeon/els/leeloo-chat.el") "LeeLoo")
  ("t" (load "~/Dropbox/Office/Games/aidungeon/els/ted-dan.el") "Ted DAN")
  ("h" (load "~/Dropbox/Office/Games/aidungeon/els/ted-dan.el") "Ted holodeck")
  ("S" org-roam-menu/body "Sasha")
  ("g" (load "~/Dropbox/Office/Games/aidungeon/els/glados-daen.el") "GLaDOS")
  ("d" (load "~/Dropbox/Office/Games/aidungeon/els/catherine-tramell-daen.el") "DAEN Tramell")
  ("o" (load "~/Dropbox/Office/Games/aidungeon/els/rpm-4options.el") "RPM 4option")
  ("m" (load "~/Dropbox/Office/Games/aidungeon/els/rpm-malu.el") "RPM MALU")
  ("q" nil) 
  )

(defhydra hydra-ai-chat-menu (:color blue)
  ("a" (progn
         (load "~/Dropbox/Office/Games/aidungeon/els/acid-chat.el")
         (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/chars-chat/2024-05-17-Acid_Burn.org")
         ) "Acid Burn")
  ("m" (progn
         (load "~/Dropbox/Office/Games/aidungeon/els/McDuck-chat.el")
         (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/chars-chat/2026-01-24-McDuck.org")
         ) "McDuck")
  ("L" (progn
         (load "~/Dropbox/Office/Games/aidungeon/els/leeloo-chat.el")
         (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/chars-chat/2024-09-18-Leeloo.org")
         ) "LeeLoo")
  ("l" (progn
         (load "~/Dropbox/Office/Games/aidungeon/els/ai-synod.el")
         (find-file-other-frame "~/Dropbox/Office/Games/Game-logs/Tomb-of-Tyrants/2023-09-09-AI-story.org")
         ) "LogFile")
  ("t" (progn
         (load "~/Dropbox/Office/Games/aidungeon/els/tpol-chat.el")
         (find-file-other-frame "~/Dropbox/Office/Games/aidungeon/chars-chat/2024-05-18-T-Pol.org"))
   "T'pol")
  ("q" nil) 
  )

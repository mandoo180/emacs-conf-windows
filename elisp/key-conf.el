(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package evil
  :config
  (evil-global-set-key 'insert (kbd "C-f") 'forward-char)
  (evil-global-set-key 'insert (kbd "C-b") 'backward-char)
  (evil-global-set-key 'insert (kbd "C-n") 'forward-line)
  (evil-global-set-key 'insert (kbd "C-p") 'previous-line)
  (evil-global-set-key 'insert (kbd "C-d") 'delete-char)
  (evil-global-set-key 'insert (kbd "C-k") 'kill-line)
  (evil-global-set-key 'insert (kbd "C-e") 'move-end-of-line)
  (evil-global-set-key 'insert (kbd "C-a") 'move-beginning-of-line)

  (evil-global-set-key 'insert (kbd "M-m") 'back-to-indentation)
  (evil-global-set-key 'insert (kbd "M-f") 'forward-word)
  (evil-global-set-key 'insert (kbd "M-b") 'backward-word)
  (evil-global-set-key 'insert (kbd "M-<DEL>") 'backward-kill-word)
  (evil-global-set-key 'insert (kbd "M-d") 'kill-word)
  
  (evil-global-set-key 'normal (kbd "<SPC><SPC>") 'execute-extended-command)
  (evil-global-set-key 'normal (kbd "<SPC>ff") 'find-file)
  (evil-global-set-key 'normal (kbd "<SPC>fo") 'find-file-other-window)
  (evil-global-set-key 'normal (kbd "<SPC>ft") 'find-file-other-tab)
  (evil-global-set-key 'normal (kbd "<SPC>fr") 'consult-recent-file)

  (evil-global-set-key 'normal (kbd "<SPC>bb") 'consult-buffer)
  (evil-global-set-key 'normal (kbd "<SPC>bo") 'consult-buffer-other-window)
  (evil-global-set-key 'normal (kbd "<SPC>bt") 'consult-buffer-other-tab)
  (evil-global-set-key 'normal (kbd "<SPC>bk") 'kill-current-buffer)
  (evil-global-set-key 'normal (kbd "<SPC>bn") 'next-buffer)
  (evil-global-set-key 'normal (kbd "<SPC>bp") 'previous-buffer)

  (evil-global-set-key 'normal (kbd "<SPC>gg") 'consult-ripgrep)
  (evil-global-set-key 'normal (kbd "<SPC>gi") 'consult-imenu)

  (add-hook 'prog-mode-hook (lambda ()
                              (evil-local-mode 1))))

(use-package key-chord
  :config
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(provide 'key-conf)

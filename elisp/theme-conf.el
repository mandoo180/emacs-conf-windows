;; scoop install nerd-fonts/JetBrainsMono-NF
;; M: (font-family-list) shows available fonts
(set-face-attribute 'default nil :font "JetBrainsMono NF Thin" :height 110)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one))

(use-package rainbow-mode
  :config
  (rainbow-mode t))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package all-the-icons
  :ensure t)

(use-package nerd-icons
  :ensure nil) ;; M-x nerd-icons-install-fonts

(use-package beacon
  :config
  (beacon-mode nil))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

(use-package paren
  :init
  (set-face-background 'show-paren-match (face-background 'default))
  (set-face-foreground 'show-paren-match "#afa")
  (set-face-attribute  'show-paren-match nil :weight 'black)
  (set-face-background 'show-paren-mismatch (face-background 'default))
  (set-face-foreground 'show-paren-mismatch "#c66")
  (set-face-attribute  'show-paren-mismatch nil :weight 'black))

(use-package paren-face
  :ensure t
  :init
  (global-paren-face-mode))

(add-hook 'after-save-hook 'check-parens nil t)

(provide 'theme-conf)

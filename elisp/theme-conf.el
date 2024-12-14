;; scoop install nerd-fonts/JetBrainsMono-NF
;; M: (font-family-list) shows available fonts
(set-face-attribute 'default nil :font "JetBrainsMono NF Thin" :height 100)

;; (load-theme 'modus-vivendi)

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

(use-package doom-themes
  :config
  (load-theme 'doom-one))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1))
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

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

;; Custom mode line
;; (defun simple-mode-line-render (left right)
;;   "Return a string of `window-width' length containing LEFT, and RIGHT
;;  aligned respectively."
;;   (let* ((available-width (- (window-width) (length left) 2)))
;;     (format (format " %%s %%%ds " available-width) left right)))

;; (setq-default mode-line-format '((:eval (simple-mode-line-render (format-mode-line '(("%b[%*]")
;;                                                                                      "[" (:eval mode-line-mule-info) "]"
;;                                                                                      "[" (:eval mode-name) "]"
;;                                                                                      "[" (:eval vc-mode) "]"))
;;                                                                  (format-mode-line '((:eval "%p%%")))))))

(provide 'theme-conf)

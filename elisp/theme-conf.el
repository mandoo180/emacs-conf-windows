;; -*- lexical-binding: t; -*-


(setq ks/frame-transparency '(95 . 95))
(set-frame-parameter (selected-frame) 'alpha ks/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,ks/frame-transparency))

(use-package rainbow-mode)

;; (use-package rainbow-delimiters
;;   :hook
;;   (prog-mode . rainbow-delimiters-mode))

;; (use-package all-the-icons
;;   :ensure t)

;; (use-package nerd-icons
;;   :ensure nil) ;; M-x nerd-icons-install-fonts

(defun ks/theme-config ()
  ;; (load-file (expand-file-name "hasliberg-theme.el" "~/.emacs.d/custom/hasliberg-theme"))
  ;; (enable-theme 'hasliberg)
  ;; (hasliberg-theme-use-dark-monotonic-colour-palette)
  ;; scoop install nerd-fonts/JetBrainsMono-NF
  ;; scoop install nerd-fonts/Iosevka-NF
  ;; M: (font-family-list) shows available fonts
  
  (doom-modeline-mode 1)
  (set-face-attribute 'mode-line nil :box nil)
  (set-face-attribute 'mode-line-inactive nil :box nil)
  (set-face-attribute 'default nil :font "Iosevka NF")
  (set-face-attribute 'default nil :height 110)
  (set-fontset-font t 'hangul (font-spec :name "D2Coding"))
  (setq face-font-rescale-alist '(("D2Coding" . 1.1)))
  (load-theme 'hasliberg 'noerror)
  (hasliberg-theme-use-dark-monotonic-colour-palette))

(defun handle-frame-hook (frame)
  (with-selected-frame frame (ks/theme-config)))

(if (daemonp)
    (add-hook 'after-make-frame-functions 'handle-frame-hook)
  (ks/theme-config))

;; (use-package doom-themes
;;   :config
;;   (load-theme 'doom-one))

;; (use-package doom-modeline
;;   :init
;;   (doom-modeline-mode 1))

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

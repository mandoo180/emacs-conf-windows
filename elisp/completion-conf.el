;; -*- lexical-binding: t; -*-


(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (setq vertico-cycle t))

;; (use-package vertico-multiform
;;   :hook (after-init . vertico-multiform-mode)
;;   :init
;;   (setq vertico-multiform-commands
;;         '((consult-line (:not posframe))
;;           (gopar/consult-line (:not posframe))
;;           (consult-ag (:not posframe))
;;           (consult-grep (:not posframe))
;;           (consult-imenu (:not posframe))
;;           (xref-find-definitions (:not posframe))
;;           (t posframe))))

;; (defun handle-before-make-frame-hook ()
;;   (setq vertico-posframe-width (frame-width)))

;; (use-package vertico-posframe
;;   :hook
;;   (after-init . vertico-posframe-mode)
;;   :custom
;;   (vertico-posframe-border-width 0)
;;   (vertico-posframe-poshandler #'posframe-poshandler-frame-bottom-center)
;;   :config
;;   (add-hook 'before-make-frame-hook #'handle-before-make-frame-hook))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :diminish
  :config
  (marginalia-mode t))

(use-package consult
  :ensure t
  :bind
  ;; C-x bindings
  ("C-x C-r" . consult-recent-file)
  ("C-x b" . consult-buffer)
  ("C-x C-b" . consult-buffer)
  ("C-x 4 b" . consult-buffer-other-window)
  ("C-x 5 b" . consult-buffer-other-frame)
  ("C-x t b" . consult-buffer-other-tab)
  ("C-x r b" . consult-bookmark)
  ("C-x p b" . consult-project-buffer)
  ;; Custom M-# bindings for fast register access
  ("M-#" . consult-register-load)
  ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
  ("C-M-#" . consult-register)
  ("M-y" . consult-yank-pop)
  ;; M-g bindings
  ("M-g M-g" . consult-goto-line)
  ;; M-s bindings in `search-map'
  ("M-s e" . consult-complie-error)
  ("M-s f" . consult-fly-make)
  ("M-s s o" . consult-outline)
  ("M-s m" . consult-mark)
  ("M-s g m" . consult-global-mark)
  ("M-s i" . consult-imenu)
  ("M-s I" . consult-imenu-multi)
  ("M-s d" . consult-find)                  ;; Alternative: consult-fd
  ("M-s c" . consult-locate)
  ("M-s g g" . consult-grep)
  ("M-s g v" . consult-git-grep)
  ("M-s g r" . consult-ripgrep)
  ("M-s l" . consult-line)
  ("M-s L" . consult-line-multi)
  ("M-s k" . consult-keep-lines)
  ("M-s u" . consult-focus-lines)
  ("M-s h" . consult-org-heading))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 3)
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  :hook ((prog-mode . corfu-mode))
  :config
  (keymap-set corfu-map "RET" #'corfu-send))

(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets)

(setq-default grep-highlight-matches t
              grep-scroll-output t)

(use-package wgrep
  :ensure t
  :config
  (define-key grep-mode-map (kbd "C-c C-q") 'wgrep-change-to-wgrep-mode)
  (define-key grep-mode-map (kbd "w") 'wgrep-change-to-wgrep-mode))

(use-package recentf
  :ensure t
  :config
  (setq recentf-max-saved-items 200)
  (setq recentf-filename-handlers
    (append '(abbreviate-file-name) recentf-filename-handlers))
  (define-key recentf-mode-map (kbd "C-x r e") 'recentf)
  (recentf-mode))


(provide 'completion-conf)

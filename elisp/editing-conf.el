;; -*- lexical-binding: t; -*-


(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda ()
                   ;; (hl-line-mode 1)
                   (display-line-numbers-mode 1)
                   (setq display-line-numbers-width 6)
                   (display-fill-column-indicator-mode 0))))

(add-hook 'after-init-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'after-init-hook 'global-auto-revert-mode)
(add-hook 'after-init-hook 'delete-selection-mode)
(add-hook 'after-init-hook 'transient-mark-mode)
(add-hook 'after-init-hook 'subword-mode)

(use-package move-dup
  :ensure t
  :config
  (global-set-key (kbd "s-<down>") 'move-dup-move-lines-down)
  (global-set-key (kbd "s-<up>") 'move-dup-move-lines-up)
  (global-set-key (kbd "s-d") 'duplicate-line)
  (global-set-key (kbd "C-c d") 'move-dup-duplicate-down)
  (global-set-key (kbd "C-c u") 'move-dup-duplicate-up))

(use-package repeat
  :ensure t
  :diminish
  :config
  (repeat-mode t))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click))

(use-package hungry-delete
  :ensure t
  :diminish
  :config
  (global-hungry-delete-mode t))

(use-package expand-region
  :ensure t
  :bind
  ("M-h" . er/expand-region)
  ("M-H" . er/contract-region))

(use-package so-long
  :ensure t
  :config
  (global-so-long-mode 1))

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

(defun kill-curr-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-curr-buffer)

(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-x a k") 'kill-all-buffers)

(defun next-open-line ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))
(global-set-key (kbd "S-<return>") 'next-open-line)

(defun copy-to-eol ()
  (interactive)
  (kill-ring-save (point) (pos-eol)))
(global-set-key (kbd "C-c e") 'copy-to-eol)

(defun copy-region-or-line ()
  (interactive)
  (if (and (mark) (use-region-p))
      (kill-ring-save (min (point) (mark)) (max (point) (mark)))
    (kill-ring-save (pos-bol) (pos-eol))))
;; (global-set-key (kbd "s-c") 'copy-region-or-line)

(defun upcase-word-backwards ()
  "Uppercase word backwards."
  (interactive)
  (backward-word)
  (upcase-word 1)
  (backward-word))
(global-set-key (kbd "M-U") 'upcase-word-backwards)

(defun downcase-word-backwards ()
  "Lowercase word backwards."
  (interactive)
  (backward-word)
  (downcase-word 1)
  (backward-word))
(global-set-key (kbd "M-L") 'downcase-word-backwards)

(if (functionp 'er/mark-word)
    (defun upcase-word-at-point ()
      (interactive)
      (er/mark-word)
      (upcase-region (min (point) (mark))
                     (max (point) (mark)))))

(global-unset-key (kbd "S-<SPC>"))
(setq default-input-method "korean-hangul")
;; (global-set-key (kbd "S-<SPC>") 'toggle-input-method)
;; use C-\ instead

(global-set-key (kbd "<escape>") 'keyboard-quit)

;; Don't disable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
;; Don't disable case-change functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(use-package sudo-edit
  :ensure t)

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1)
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo-tree-history")))
  :bind (("C-/" . undo-tree-undo)
         ("C-?" . undo-tree-redo)
         ("C-z" . undo-tree-undo)     ; Zap to character isn't helpful
         ("C-S-z" . undo-tree-redo)))

(bind-keys :map isearch-mode-map
           ("<left>"  . isearch-repeat-backward)
           ("<right>" . isearch-repeat-forward)
           ("<up>"    . isearch-ring-retreat)
           ("<down>"  . isearch-ring-advance))

(use-package visual-regexp
  :ensure t
  :init
  (use-package visual-regexp-steroids :ensure t)
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)))

(global-set-key (kbd "C-<tab>") #'next-buffer)
(global-set-key (kbd "C-S-<tab>") #'previous-buffer)

(provide 'editing-conf)

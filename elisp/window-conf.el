;; -*- lexical-binding: t; -*-


(use-package winner
  :ensure t
  :config
  (winner-mode t))

(use-package ace-window)

(defun k/split-window()
  "Split the window to see the most recent buffer in the other window.
Call a second time to restore the original window configuration."
  (interactive)
  (if (eq last-command 'k/split-window)
      (progn
        (jump-to-register :k/split-window)
        (setq this-command 'k/unsplit-window))
    (window-configuration-to-register :k/split-window)
    (switch-to-buffer-other-window nil)))
(global-set-key (kbd "<f5>") 'k/split-window)


(provide 'window-conf)

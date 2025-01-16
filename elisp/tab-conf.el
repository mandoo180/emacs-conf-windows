;; -*- lexical-binding: t; -*-


(use-package tab-bar
  :ensure nil
  ;; tab-bar prefix = C-x t
  :bind (("s-[" . tab-bar-switch-to-prev-tab)
         ("s-]" . tab-bar-switch-to-next-tab)
         ("s-{" . (lambda ()
                    (interactive)
                    (tab-move -1)))
         ("s-}" . (lambda ()
                    (interactive)
                    (tab-move 1)))
         ("s-<f4>" . tab-bar-close-tab))
  :custom
  (tab-bar-show t)
  (tab-bar-close-button-show nil)
  (tab-bar-auto-width nil)
  (tab-bar-format '(tab-bar-format-menu-bar
                    tab-bar-format-tabs-groups
                    tab-bar-separator
                    tab-bar-separator
                    tab-bar-format-align-right
                    tab-bar-format-global))
  ;; Like winner-mode for tabs
  (tab-bar-history-mode 1)
  (tab-bar-mode 1))

(defun k/sync-tab-bar-to-theme ()
  "Synchronize tab-bar faces with the current theme."
  (interactive)
  (let ((default-bg (face-background 'default))
         (default-fg (face-foreground 'default))
         (inactive-fg (face-foreground 'mode-line-inactive)))
    (custom-set-faces
      `(tab-bar ((t (:inherit default :background ,default-bg :foreground ,default-fg))))
      `(tab-bar-tab ((t (:inherit default :background ,default-fg :foreground ,default-bg))))
      `(tab-bar-tab-inactive ((t (:inherit default :background ,default-bg :foreground ,inactive-fg))))))
  (setq tab-bar-new-button-show nil)
  (setq tab-bar-menu-bar-button nil))
(k/sync-tab-bar-to-theme)

(provide 'tab-conf)

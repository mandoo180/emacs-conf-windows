;; (use-package dired-single
;;   :commands (dired dired-jump))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
				("mkv" . "mpv"))))

;; macos issue -> Listing directory failed but 'access-file' worked
;; brew install coreutils
;; then do below -> it worked!
;; (setq insert-directory-program "gls" dired-use-ls-dired t)
;; (setq dired-listing-switches "-al --group-diretories-first")

(setq-default dired-dwim-target t)
(setq dired-recursive-deletes 'top
      dired-listing-switches "-agho --group-directories-first"
      dired-omit-files "^\\.[^.].*"
      dired-omit-verbose nil
      dired-dwim-target 'dired-dwim-target-text
      dired-hide-details-hide-symlink-targets nil
      dired-kill-when-opening-new-dired-buffer t
      delete-by-moving-to-trash t)

(add-hook 'dired-mode-hook (lambda() (dired-hide-details-mode t)))

(define-key dired-mode-map (kbd "b") 'dired-up-directory)
(define-key dired-mode-map (kbd "H") 'dired-hide-details-mode)


(provide 'dired-conf)

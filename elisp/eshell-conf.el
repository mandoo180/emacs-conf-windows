;; -*- lexical-binding: t; -*-


(defun eshell-new ()
  "Open a new insctance of eshell."
  (interactive)
  (eshell 'N))

;; toggle eshell prompt by kyeongsoo
;; debugging with C-h e (message buffer on the side)

(defun eshell-below()
  "Split window below with eshell buffer."
  (interactive)
  (let* ((height (/ (window-total-height) 3)))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell)))

(defun toggle-eshell()
  "Toggle split window with eshell buffer below."
  (interactive)
  (let* ((w (window-in-direction 'below)))
    (with-current-buffer (window-buffer w)
      (if (eq major-mode 'eshell-mode)
          (delete-window w)
        (eshell-below)))))

;; no use but think it's good to know
(defun eshell-buffers()
  "Returns eshell buffer list."
  (delq nil (mapcar (lambda (buf)
                      (with-current-buffer buf
                        (if (eq major-mode 'eshell-mode)
                            buf)))
                    (buffer-list))))

(defun handle-eshell-exit()
  "Deletes the window when eshell buffer exits."
  (if (> (count-windows 1))
      (delete-window)))


(defun k/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Prompt settings
  ;; (setq-default eshell-prompt-function #'eshell/eshell-local-prompt-function)

  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input 'all
        eshell-error-if-no-glob t
        eshell-save-history-on-exit t
        eshell-prefer-lisp-functions nil
        eshell-destroy-buffer-when-process-dies t)

  (add-hook 'eshell-mode-hook
            (lambda ()
              (add-to-list 'eshell-visual-commands "ssh")
              (add-to-list 'eshell-visual-commands "tail")
              (add-to-list 'eshell-visual-commands "top")
              (add-to-list 'eshell-visual-commands "htop")
              (add-to-list 'eshell-visual-commands "zsh")
              (add-to-list 'eshell-visual-commands "vim")

              (eshell/alias "l" "ls -hl $1")
              (eshell/alias "ll" "ls -ahl $1")
              (eshell/alias "ff" "find-file $1")
              (eshell/alias "emacs" "find-file $1")
              (eshell/alias "ffo" "find-file-other-window $1")))
  ;; (add-hook 'eshell-exit-hook  #'handle-eshell-exit)
  )

(use-package eshell
  :hook
  (eshell-first-time-mode . k/configure-eshell))

;; (global-set-key (kbd "C-`") #'toggle-eshell)

(setq eshell-windows-shell-file (executable-find "bash"))
(setq explicit-shell-file-name (executable-find "bash"))
(setq shell-file-name (executable-find "bash"))
(setenv "SHELL" shell-file-name)
(setenv "BASH_ENV" "~/.bashrc")


(provide 'eshell-conf)

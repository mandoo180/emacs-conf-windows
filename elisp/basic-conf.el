(setenv "HOME" (concat "C:/Users/" user-login-name))
(setenv "PAGER" "cat")
(setq-default default-directory "~/")
(setq-default user-emacs-directory "~/.emacs.d/")

(setq gc-cons-threshold (* 50 1000 1000))

(defun k/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'k/display-startup-time)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(setq package-native-complie t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package diminish
  :ensure t)
(require 'diminish)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)                    ; if file doesn't exist make one

(use-package no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(column-number-mode 1)
(cua-mode 1)

(setq-default inhibit-startup-screen t)
(setq-default inhibit-startup-message t)

;; Quite essential on Korean environment
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-unset-key (kbd "S-SPC"))

(setq-default locale-coding-system 'utf-8)
(setq-default keyboard-coding-system 'utf-8)
(setq-default locale-coding-system 'utf-8)
(setq-default savehist-coding-system 'utf-8)
(setq-default file-name-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

(setq-default tab-width 2)
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)
(setq-default line-move-visual t)
(setq-default sentence-end-double-space nil)
(setq-default scroll-step 1)
(setq-default scroll-margin 8)
(setq-default scroll-conservatively 1)
(setq-default delete-by-moving-to-trash t)
(setq-default trash-directory (concat (getenv "HOME") ".Trash"))
(setq-default blink-cursor-interval 0.4)
(setq-default buffers-menu-max-size 30)
(setq-default case-fold-search t)
(setq-default column-number-mode t)
(setq-default indicate-buffer-boundaries 'left)
(setq-default ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-window-setup-function 'ediff-setup-windows-plain)
(setq-default indent-tabs-mode nil)
(setq-default create-lockfiles)
(setq-default auto-save-default nil)
(setq-default make-backup-files nil)
(setq-default backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))
(setq-default backup-by-copying nil)
(setq-default mouse-yank-at-point t)
(setq-default save-interprogram-paste-before-kill t)
(setq-default scroll-preserve-screen-position 'always)
(setq-default set-mark-command-repeat-pop t)
(setq-default tooltip-delay 0.5)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(provide 'basic-conf)

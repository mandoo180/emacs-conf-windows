;; -*- lexical-binding: t; -*-


(setenv "HOME" (concat "C:/Users/" user-login-name))
(setenv "PAGER" "cat")
(setq-default default-directory "~/")
(setq-default user-emacs-directory "~/.emacs.d/")

;; to use on msys2
(setq package-gnupg-home "/c/Users/douzone/.emacs.d/elpa/gnupg/")
(setq package-gnupghome-dir "/c/Users/douzone/.emacs.d/elpa/gnupg/")

(setq gc-cons-threshold (* 50 1000 1000))

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(setq package-enable-at-startup nil)
(setq package-native-complie t)
(setq warning-minimum-level 'error)

(use-package diminish)
(require 'diminish)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)                    ; if file doesn't exist make one

;; (use-package no-littering)
;; (setq auto-save-file-name-transforms
;;       `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)
(set-fringe-mode 10)
(menu-bar-mode 0)
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
(setq-default create-lockfiles nil)
(setq-default auto-save-default nil)
(setq-default make-backup-files nil)
(setq-default backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))
(setq-default backup-by-copying nil)
(setq-default mouse-yank-at-point t)
(setq-default save-interprogram-paste-before-kill t)
(setq-default scroll-preserve-screen-position nil) ;; 'always
(setq-default set-mark-command-repeat-pop t)
(setq-default tooltip-delay 0.1)
(setq-default use-short-answers t)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq system-time-locale "C")

(provide 'basic-conf)

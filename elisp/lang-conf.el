;; -*- lexical-binding: t; -*-


;; M-. goto definition
;; M-, goto implementation
;; M-? xref-find-references
(use-package eglot
  :defer t
  :hook
  (c-mode . eglot-ensure) ;; scoop bucket add versions; scoop install versions/mingw-winlibs-llvm // install clang, clangd
  (mhtml-mode . eglot-ensure) ;; npm i -g vscode-langservers-extracted
  (python-mode . eglot-ensure) ;; pip install python-lsp-server flake8 // ;; python-lsp-server's executable is pylsp
  (javascript-mode . eglot-ensure) ;; npm i -g install typescript typescript-language-server
  (js2-mode . eglot-ensure)
  (typescript-ts-mode . eglot-ensure))

(use-package tree-sitter)

(use-package tree-sitter-langs)

(require 'treesit)
(add-to-list 'treesit-language-source-alist '(python "https://github.com/tree-sitter/tree-sitter-python.git"))
(add-to-list 'treesit-language-source-alist '(c "https://github.com/tree-sitter/tree-sitter-c.git"))
(add-to-list 'treesit-language-source-alist '(java "https://github.com/tree-sitter/tree-sitter-java.git"))
(add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript.git"))
(add-to-list 'treesit-language-source-alist '(javascript "https://github.com/tree-sitter/tree-sitter-javascript.git"))
(add-to-list 'treesit-language-source-alist '(css "https://github.com/tree-sitter/tree-sitter-css.git"))
(add-to-list 'treesit-language-source-alist '(html "https://github.com/tree-sitter/tree-sitter-html.git"))
(add-to-list 'treesit-language-source-alist '(bash "https://github.com/tree-sitter/tree-sitter-bash.git"))

(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(java-mode . java-ts-mode))
(add-to-list 'major-mode-remap-alist '(tsx-mode . typescript-ts-mode))
(add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
(add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))
(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(lua-mode . lua-ts-mode))

;; (global-tree-sitter-mode t)

(setq-default initial-scratch-message
              (concat ";; scratch pad\n\n"))

(use-package ielm
  :init
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

(use-package eros
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook (lambda () (eros-mode 1))))

(defun k/headerise-elisp ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (let ((fname (if (buffer-file-name)
                   (file-name-nondirectory (buffer-file-name))
                 (error "This buffer is not visiting a file"))))
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
              ";;; Commentary:\n"
              ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " fname " ends here\n"))))

;; pp-eval-last-sexp
(defun k/eval-last-sexp-or-region (prefix)
  "Eval region from BEG to END if active, otherwise the last sexp."
  (interactive "P")
  (if (and (mark) (use-region-p))
      (eval-region (min (point) (mark)) (max (point) (mark)))
    (eval-last-sexp prefix)))

;; (global-set-key [remap eval-expression] 'pp-eval-expression)

(defun k/load-this-file ()
  "Load the current file or buffer.
The current directory is temporarily added to `load-path'.  When
there is no current file, eval the current buffer."
  (interactive)
  (let ((load-path (cons default-directory load-path))
        (file (buffer-file-name)))
    (if file
        (progn
          (save-some-buffers nil (apply-partially 'derived-mode-p 'emacs-lisp-mode))
          (load-file (buffer-file-name))
          (message "Loaded %s" file))
      (eval-buffer)
      (message "Evaluated %s" (current-buffer)))))

(define-key emacs-lisp-mode-map (kbd "C-c C-l") 'k/load-this-file)
(define-key emacs-lisp-mode-map (kbd "C-x C-e") 'k/eval-last-sexp-or-region)
(define-key emacs-lisp-mode-map (kbd "C-<return>") 'k/eval-last-sexp-or-region)
(define-key lisp-interaction-mode-map (kbd "C-c C-l") 'k/load-this-file)
(define-key lisp-interaction-mode-map (kbd "C-x C-e") 'k/eval-last-sexp-or-region)
(define-key lisp-interaction-mode-map (kbd "C-<return>") 'k/eval-last-sexp-or-region)

;; npm install -g javacript-typescript-langserver
;; npm install -g typescript-language-server

(use-package tagedit
  :ensure t
  :config
  (tagedit-add-paredit-like-keybindings)
  (define-key tagedit-mode-map (kbd "M-?") nil)
  (define-key tagedit-mode-map (kbd "M-s") nil)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

;; for emmet for html
(use-package zencoding-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'zencoding-mode))

(use-package css-mode
  :ensure t
  :config
  (setq-default css-indent-offset 2))

(use-package js2-mode
  :ensure t
  :init
  (setq js2-basic-indent 2
        ;; js2-basic-offset 2
        js-indent-level 2
        js2-auto-indent-p t
        ;; js2-cleanup-whitespace t
        js2-enter-indents-newline t
        js2-indent-on-enter-key t
        js2-global-externs (list "window" "module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "jQuery" "$"))

  (add-to-list 'auto-mode-alist '("\\.js$" . js-mode)))

(use-package powershell)

(defun scratch-buffer-string(mode)
  (with-current-buffer (concat "*scratch " mode "*" ) (buffer-substring-no-properties (point-min) (point-max))))

(defun scratch-buffer-open(mode)
  (switch-to-buffer (get-buffer-create (concat "*scratch " mode "*"))))

(defun scratch-pwsh-buffer-string()
  (scratch-buffer-string "pwsh"))

(defun scratch-pwsh()
  (interactive)
  (scratch-buffer-open "pwsh")
  (if (not (string-equal major-mode "powershell-mode"))
      (powershell-mode)))

(defun scratch-buffer-run(mode command)
  (get-buffer-create (concat "*scratch " mode " output*"))
  (with-current-buffer (concat "*scratch " mode " output*")
    (goto-char (point-max))
    (switch-to-buffer-other-window (concat "*scratch " mode " output*"))
    (insert (eshell-command-result command))))

(defun scratch-pwsh-buffer-run()
  (interactive)
  (scratch-buffer-run "pwsh" "pwsh -Command (scratch-pwsh-buffer-string)"))

(defun scratch-js-buffer-string()
  (scratch-buffer-string "js"))

(defun scratch-js()
  (interactive)
  (scratch-buffer-open "js")
  (if (not (string-equal major-mode "js2-mode"))
      (js2-mode)))

(defun scratch-js-buffer-run()
  (interactive)
  (scratch-buffer-run "js" "node -e (scratch-js-buffer-string)"))

(use-package flycheck
  :ensure t
  :init
  ;; (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package eldoc
  :diminish eldoc-mode
  :init  (setq eldoc-idle-delay 0.1))

;; use pyvenv-activate/deactivate
(use-package pyvenv)


;; sql settings
;; give me nice indenting for sql
(use-package sql-indent
  :config
  (add-hook 'sql-mode-hook #'sqlind-minor-mode))

;; scheme settings -> guile
(use-package geiser-guile
  :config
  (setq geiser-scheme-implementation 'guile))

(provide 'lang-conf)

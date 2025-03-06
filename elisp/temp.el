;; -*- lexical-binding: t; -*-


;; Only for temporary use

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult)

(global-set-key (kbd "M-o") 'ace-window)
(setq aw-dispatch-always t)

(use-package popper
  :bind (("C-`" . popper-toggle)
         ("M-`" . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          ;; eshell-mode
          help-mode
          compliation-mode))
  (popper-mode 1)
  (popper-echo-mode 1))

(use-package gptel
  :config
  (exec-path-from-shell-copy-env "OPENAI_API_KEY")
  (setq gptel-api-key (getenv "OPENAI_API_KEY"))
  (setq gptel-default-mode 'org-mode))

(defun dz-copy-to-html-cx ()
  "Copy html file to CX directory."
  (interactive)
  (let* ((srcfile (f-filename (buffer-file-name)))
         (src (buffer-file-name))
         (destbase "C:/Users/douzone/Projects/douzone/dews-web/repository/view/html/CX/")
         (dest (expand-file-name srcfile destbase)))
    (message "src: %s, dest: %s" src dest)
    (copy-file src dest t)))

(unless (require 'ultra-scroll nil 'noerror)
  (package-vc-install '(ultra-scroll
                        :vc-backend Git
                        :url  "https://github.com/jdtsmith/ultra-scroll")))
(setq scroll-conservatively 101 ; important!
        scroll-margin 0)
(ultra-scroll-mode 1)

(provide 'temp)


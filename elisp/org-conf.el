(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :config
  (display-line-numbers-mode 0)
  (setq org-agenda-start-with-log-mode t
        org-catch-invisible-edits 'show
        org-edit-timestamp-down-means-later t
        org-ellipsis " ... "
        org-export-coding-system 'utf-8
        org-export-kill-product-buffer-when-displayed t
        org-fast-tag-selection-single-key 'expert
        org-hide-emphasis-markers t
        org-html-validation-link nil
        org-image-actual-width '(450)
        org-log-done 'time
        org-log-into-drawer t
        org-pretty-entities t
        org-startup-indented t
        org-startup-with-inline-images t
        org-tags-column 80)
  (setq-local electric-pair-inhibit-predicate `(lambda (c)
                                                 (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))
  )

;; Lots of stuff from http://doc.norang.ca/org-mode.html
(with-eval-after-load 'org
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("js" . "src javascript"))
  (add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
  (add-to-list 'org-structure-template-alist '("java" . "src java"))
  (add-to-list 'org-structure-template-alist '("sql" . "src sql"))
  (add-to-list 'org-structure-template-alist '("rust" . "src rust"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   (seq-filter
    (lambda (pair)
      (locate-library (concat "ob-" (symbol-name (car pair)))))
    '((dot . t)
      (gnuplot . t)
      (latex . t)
      (python . t)
      (javascript . t)
      (typescript . t)
      (shell . t)
      (sql . t)
      (sqlite . t)))))

(use-package org-appear
  :hook
  (org-mode . org-appear-mode))

(use-package org-fragtog
  :after org
  :hook
  (org-mode . org-fragtog-mode)
  :custom
  (org-startup-with-latex-preview nil)
  (org-format-latex-options
   (plist-put org-format-latex-options :scale 2)
   (plist-put org-format-latex-options :foreground 'auto)
   (plist-put org-format-latex-options :background 'auto)))

(use-package org-modern
  :hook
  (org-mode . org-modern-mode))


(provide 'org-conf)

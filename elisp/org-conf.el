(defun k/org-mode-setup ()
  (org-indent-mode)
  (display-line-numbers-mode 0)
  ;; (variable-pitch-mode 1)
  (setq-local electric-pair-inhibit-predicate `(lambda (c)
                                                 (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))
  (visual-line-mode -1))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook (org-mode . k/org-mode-setup)
  :config
  (setq org-ellipsis " ... "
        org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t
        org-edit-timestamp-down-means-later t
        org-hide-emphasis-markers t
        org-catch-invisible-edits 'show
        org-export-coding-system 'utf-8
        org-fast-tag-selection-single-key 'expert
        org-html-validation-link nil
        org-export-kill-product-buffer-when-displayed t
        org-tags-column 80))

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
    '((R . t)
      (dot . t)
      (gnuplot . t)
      (latex . t)
      (python . t)
      (javascript . t)
      (typescript . t)
      (shell . t)
      (sql . t)
      (sqlite . t)))))


(provide 'org-conf)

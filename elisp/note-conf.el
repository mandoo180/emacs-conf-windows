(use-package denote
  :custom
  (denote-sort-keywords t)
  :hook
  (dired-mode . denote-dired-mode)
  :init
  (require 'denote-org-extras))

;; Consult-Notes for easy access to notes

(use-package consult-notes
  ;; :bind
  ;; (("C-c w d f" . consult-notes)
  ;;  ("C-c w d g" . consult-notes-search-in-all-notes))
  :init
  (consult-notes-denote-mode))

;; Citar-Denote to manage literature notes

;; (use-package citar-denote
;;   :custom
;;   (citar-open-always-create-notes t)
;;   :init
;;   (citar-denote-mode)
;;   :bind
;;   (("C-c w b c" . citar-create-note)
;;    ("C-c w b n" . citar-denote-open-note)
;;    ("C-c w b x" . citar-denote-nocite)
;;    :map org-mode-map
;;    ("C-c w b k" . citar-denote-add-citekey)
;;    ("C-c w b K" . citar-denote-remove-citekey)
;;    ("C-c w b d" . citar-denote-dwim)
;;    ("C-c w b e" . citar-denote-open-reference-entry)))

;; Explore and manage your Denote collection

;; (use-package denote-explore
;;   :bind
;;   (;; Statistics
;;    ("C-c w x c" . denote-explore-count-notes)
;;    ("C-c w x C" . denote-explore-count-keywords)
;;    ("C-c w x b" . denote-explore-barchart-keywords)
;;    ("C-c w x e" . denote-explore-barchart-filetypes)
;;    ;; Random walks
;;    ("C-c w x r" . denote-explore-random-note)
;;    ("C-c w x l" . denote-explore-random-link)
;;    ("C-c w x k" . denote-explore-random-keyword)
;;    ("C-c w x x" . denote-explore-random-regex)
;;    ;; Denote Janitor
;;    ("C-c w x d" . denote-explore-identify-duplicate-notes)
;;    ("C-c w x z" . denote-explore-zero-keywords)
;;    ("C-c w x s" . denote-explore-single-keywords)
;;    ("C-c w x o" . denote-explore-sort-keywords)
;;    ("C-c w x w" . denote-explore-rename-keyword)
;;    ;; Visualise denote
;;    ("C-c w x n" . denote-explore-network)
;;    ("C-c w x v" . denote-explore-network-regenerate)
;;    ("C-c w x D" . denote-explore-degree-barchart)))


(provide 'note-conf)

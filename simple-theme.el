(require 'autothemer)

(autothemer-deftheme simple
                     "A simple theme."

                     ((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

                      ;; Define our color palette
                      (paper-black        "#373A40")
                      (paper-white        "#EEEEEE")
                      (paper-orange       "#F7954A")
                      (paper-dark-orange  "#DC5F00")
                      (paper-light-orange "#FCDAC0")
                      (paper-gray         "#D9D9D9")
                      (paper-dark-gray    "#686D76"))

                     ;; Customize faces
                     ((default                      (:foreground paper-white :background paper-black))
                      (cursor                       (:background paper-dark-orange))
                      (region                       (:background paper-dark-gray))
                      (fringe                       (:background paper-black))
                      (mode-line                    (:background paper-black))

                      (font-lock-keyword-face       (:foreground paper-white :weight 'regular))
                      (font-lock-constant-face      (:foreground paper-white :weight 'regular))
                      (font-lock-string-face        (:foreground paper-gray))
                      (font-lock-builtin-face       (:foreground paper-white))
                      (font-lock-comment-face       (:foreground paper-dark-gray))
                      (font-lock-type-face          (:foreground paper-white))
                      (font-lock-function-name-face (:foreground paper-white :weight 'light))
                      (font-lock-variable-name-face (:foreground paper-white :weight 'light))
                      (font-lock-warning-face       (:foreground paper-white :weight 'light))

                      (link                         (:foreground paper-light-orange :underline t))
                      (link-visited                 (:foreground paper-gray :underline t))
                      (highlight                    (:foreground paper-white :background paper-dark-gray :underline t))
                      (isearch                      (:background paper-gray))

                      (org-ellipsis                 (:foreground paper-dark-gray))
                      (org-tag                      (:foreground paper-dark-gray :height 0.95))

                      (org-block                    (:foreground paper-gray))
                      (org-table                    (:foreground paper-white))

                      ))

(provide-theme 'simple)

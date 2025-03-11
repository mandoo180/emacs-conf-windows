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

(getenv "OPENAI_API_KEY")

(use-package gptel
  :config
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

(defun dz-copy-to-js-cz ()
  "Copy javascript file to CZ directory."
  (interactive)
  (let* ((srcfile (f-filename (buffer-file-name)))
         (src (buffer-file-name))
         (destbase "C:/Users/douzone/Projects/douzone/dews-web/repository/view/js/CZ")
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


;; custom eshell switcher for practice not for real use
(require 'cl-lib)

(defun list-eshell-buffer()
  (cl-remove-if-not (lambda (buf)
                      (string= (with-current-buffer buf major-mode) "eshell-mode"))
                    (buffer-list)))

(defun map-to-buffer-name(bufl)
  (mapcar (lambda(buf)
            (buffer-name buf)) bufl))

(defun prompt-eshell-buffers()
  (interactive)
  (let* ((bufl (list-eshell-buffer))
         (buf (completing-read "Select a buffer: " (map-to-buffer-name bufl))))
    (switch-to-buffer buf)))

;; restclient
(use-package restclient)
(use-package restclient-jq)

(defun restclient-scratch-buffer()
  "Usage:
:header = <<
Content-Type: application/json
X-Authenticate-Token: :token
#

GET http://localhost:8080/api/list
:header
#

POST http://localhost:8080/api/login
Content-Type: application/x-www-form-urlencoded
-> jq-set-var :token .data.access_token

userid=userid&password=1111
#

for more details
https://github.com/pashky/restclient.el/"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch-restclient*"))
  (restclient-mode))

;; https://github.com/tkf/emacs-request
(use-package request)

;; (request "http://localhost:8080/api/CM/AccountService/login"
;;   :type "POST"
;;   ;; :headers '(("Content-Type" . "application/x-www-form-urlencoded"))
;;   :data '(("userid" . "userid") ("password" . "password"))
;;   :parser 'json-read
;;   :success (cl-function
;;             (lambda (&key data &allow-other-keys)
;;               (setq token (assoc-default 'access_token (assoc-default 'data data))))))

;; (request "http://localhost:8080/api/HR/Evarpt00400_Z20313Service/listMenu"
;;   :headers `(("Content-Type" . "application/json")
;;              ("X-Authenticate-Token" . ,token))
;;   :parser 'json-read
;;   :success (cl-function
;;             (lambda (&key data &allow-other-keys)
;;               (message "%S" (recurse-alist (assoc-default 'data data))))))

(defun scratch-buffer-new (&optional buf-name)
  "Create new scratch buffer."
  (interactive)
  (let* ((buf (if buf-name
                  buf-name
                (concat "*scratch-" (number-to-string (random)) "*"))))
    (switch-to-buffer buf)))

(provide 'temp)


;;; init.el --- file di inizializzazione di emacs

;; Copyleft

;; Author: Giancarlo Rosso
;; URL:
;; Version:
;; Created:
;; Keywords:

;;; Commentary:

;; Questo file di inizializzazione è il risulato dei miei esperimenti
;; con Emacs.  Ispirato alla pulizia di better-defaults.el e soprattutto a
;; https://github.com/kovan/dopemacs
;; https://github.com/technomancy/better-defaults

;;; License:

;; None

;;; Code:

;;;###
;; environment for fineco
(progn
  (defvar before-user-init-time (current-time)
    "Value of `current-time' when Emacs begins loading `user-init-file'.")
  (message "Loading Emacs...done (%.3fs)"
           (float-time (time-subtract before-user-init-time
                                      before-init-time)))
  (setq user-init-file (or load-file-name buffer-file-name))
  (setq user-emacs-directory (file-name-directory user-init-file))
  (message "Loading %s..." user-init-file)
  
  ;; saving customisations
  (setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file))

  (package-initialize)
  ;; GENERAL
  (require 'package)
  (require 'org)
  (require 'saveplace)
  (require 'uniquify)
  (require 'whitespace)
  (require 'projectile)

  ;; HOOKS
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (add-hook 'after-init-hook 'global-company-mode)

  ;; ASSOCIATIONS
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

  ;; KEYBINDINGS
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)
  ;;(global-set-key (kbd "C-x g") 'magit-status)

  (define-key global-map "\C-c c" 'org-capture)

  ;; Projectile
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)

  ;; FUNCTIONS
  ;; (defun nxml-pretty-format ()
  ;;   "Invokes xmllint on selected text."
  ;;   (interactive)
  ;;   (save-excursion
  ;;     (shell-command-on-region (point-min) (point-max) "xmllint --format -" (buffer-name) t)
  ;;     (nxml-mode)
  ;;     (indent-region 0 (count-lines (point-min) (point-max))))
  ;;   )

  ;; saving customisations
  (defvar functions-file
    "Library for functions.")
  (setq functions-file (expand-file-name "packages/functions.el" user-emacs-directory))
  (when (file-exists-p functions-file)
    (load functions-file))

  ;;; % like in vi
  ;; (global-set-key "%" 'match-paren)
  ;; (defun match-paren (arg)
  ;;   "Go to the matching paren if on a paren; otherwise insert %."
  ;;   (interactive "p")
  ;;   (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
  ;;         ((looking-at "\\s)") (forward-char 1) (backward-list 1))
  ;;         (t (self-insert-command (or arg 1)))))
  ;;; org crypt
  ;; (org-crypt-use-before-save-magic)
)
(server-start)
(provide 'init)
;;; init.el ends here

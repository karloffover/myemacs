;;; init.el --- file di inizializzazione di emacs

;; Copyleft

;; Author: Giancarlo Rosso
;; URL:
;; Version:
;; Created:
;; Keywords:

;;; Commentary:

;; This file is the result of my experimenting in emacs and init.el
;; inspired by better-defaults and dopemacs
;; https://github.com/kovan/dopemacs
;; https://github.com/technomancy/better-defaults

;;; License:

;; Apache License 2.0

;;; Code:

;;;###
;; environment for workplace
;; sometimes a proxy is needed for internet
;; (progn
;;   (when (or (string-equal system-name "FQHN") (string-equal system-name "HOSTNAME") (string-equal system-name "hostname"))
;;     (defvar url-proxy-services
;;       "list of proxy properties.")
;;     (setq url-proxy-services
;;           '(("http"."proxy:3128")
;;             ("https"."proxy:3128")
;;             ("no_proxy"."^.*somehost")))
;;    (load-theme 'wheatgrass t))

  (when (>= emacs-major-version 24)
    (defvar package-list
      "list of packages to be installed at bootstrap.")
    (setq package-list '(
                         company
                         ;; dired+
                         json-mode
                         flycheck
                         org
                         projectile
                         smex
                         undo-tree
                         yaml-mode
                         cider))

    (require 'package)

    (defvar package-archives
      "list of repositories.")
    (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
    ;;    (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
    ;;    (add-to-list 'package-archives '("SC" . "http://joseito.republika.pl/sunrise-commander/") t)

    ;; activate all the packages (in particular autoloads)
    (package-initialize)

    ;; get list of packages
    (defvar package-archive-contents
      "used to refresh packages contents.")
      (unless package-archive-contents
	(package-refresh-contents))

      (dolist (package package-list)
	(unless (package-installed-p package)
	  (package-install package)))
      )

    ;; CUSTOMIZE
    (custom-set-variables
     '(apropos-do-all t)
     '(backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
     '(global-undo-tree-mode t)
     '(ido-enable-flex-matching t)
     '(ido-mode t)
     '(mouse-yank-at-point t)
     '(org-capture-templates '(("n" "Note" entry (file+headline (concat org-directory "/notes.org") "Notes"))))
     '(org-directory "~/Documents/Agenda")
     '(projectile-global-mode t)
     '(save-interprogram-paste-before-kill t)
     '(save-place t)
     '(save-place-file (concat user-emacs-directory "places"))
     '(setq inhibit-startup-screen t)
     '(show-paren-mode 1)
     '(smex-save-file (concat user-emacs-directory ".smex-items"))
     '(uniquify-buffer-name-style 'forward)
     '(x-select-enable-clipboard t)
     '(x-select-enable-primary t)
     '(global-company-mode t)
     '(global-hl-line-mode t)
     )

    ;; GENERAL
    (require 'org)
    (require 'saveplace)
    (require 'uniquify)
    ;;  (require 'yaml-mode)
    (setq-default indent-tabs-mode nil)
    (setq-default save-place t)

    ;; HOOKS
    (add-hook 'after-init-hook #'global-flycheck-mode)

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

    (define-key global-map "\C-cc" 'org-capture)

    ;; FACE
    (when (eq system-type 'darwin)
      (set-face-attribute 'default nil :family "Unifont")
      (set-face-attribute 'default nil :height 165))

    (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
    (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
    (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
    (setq inhibit-startup-screen t)
    )

  (provide 'init)
;;; init.el ends here

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
  ;; (when (or (string-equal (system-name) "fbmi01342pc.milano.banca.fineco.it") (compare-strings (system-name) nil nil "FBMI01342PC" nil nil t))
  ;;   (defvar url-proxy-services
  ;;     "list of proxy properties.")
  ;;   (setq url-proxy-services
  ;;         '(("http"."proxy-v1.fineco.it:3128")
  ;;           ("https"."proxy-v1.fineco.it:3128")
  ;;           ("no_proxy"."^.*fineco.it")))
  ;;   (load-theme 'wombat t)
  ;;   )

  ;; saving customisations
  (setq custom-file "~/.emacs.d/emacs-custom.el")
  (load custom-file)

  (when (string-equal system-type "windows-nt")
    (let (
	  (mypaths
	   '(
    "c:/Program Files (x86)/Common Files/Oracle/Java/javapath" "c:/Windows/system32" "c:/Windows" "c:/Windows/System32/Wbem" "c:/Windows/System32/WindowsPowerShell/v1.0" "c:/Windows/System32/OpenSSH" "c:/Program Files (x86)/CheckPoint/Endpoint Security/Endpoint Common/bin" "c:/Program Files/TortoiseSVN/bin" "c:/Program Files/Git/cmd" "c:/Users/giancarlorosso/AppData/Local/Microsoft/WindowsApps" "." "c:/Users/giancarlorosso/Applications/emacs/libexec/emacs/26.1/x86_64-w64-mingw32" "c:/msys64/usr/bin"
	     )))
      (setenv "PATH" (mapconcat 'identity mypaths ";") )
      (setq exec-path (append mypaths (list "." exec-directory))))
    )

  ;; (when (>= emacs-major-version 24)
  ;;   (defvar package-list
  ;;     "list of packages to be installed at bootstrap.")
  ;;   (setq package-list '(
  ;;                        ;; dired+
  ;;                        ;; cider
  ;;                        company
  ;;                        flx-ido
  ;;                        flycheck
  ;;                        groovy-mode
  ;;                        json-mode
  ;;                        magit
  ;;                        magit-gerrit
  ;;                        org
  ;;                        projectile
  ;;                        smex
  ;;                        undo-tree
  ;;                        yaml-mode
  ;;                        jinja2-mode
  ;;                        ))

  ;;   (require 'package)

  ;;   ;; activate all the packages (in particular autoloads)
  ;;   (package-initialize)

  ;;   ;; get list of packages
  ;;   (defvar package-archive-contents
  ;;     "used to refresh packages contents.")
  ;;   (unless package-archive-contents
  ;;     (package-refresh-contents))

  ;;   (dolist (package package-list)
  ;;     (unless (package-installed-p package)
  ;;       (package-install package)))
  ;;   )

  ;; GENERAL
  (require 'package)
  (require 'org)
  (require 'saveplace)
  (require 'uniquify)
  (require 'whitespace)
  (require 'magit-gerrit)
  ;; flx-ido for projectile
  (require 'flx-ido)
  ;; crypt org entries
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq epa-pinentry-mode 'ask)
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
  (setq org-crypt-key "237BFD753F23A07FEDFCA79FA418FD130C08336D")

  ;; (ido-mode 1)
  ;; (ido-everywhere 1)
  (flx-ido-mode 1)
  (projectile-mode +1)
  (setq ido-use-faces nil)
  (setq ido-enable-flex-matching t)

  ;;  (require 'yaml-mode)
  (setq-default indent-tabs-mode nil) ;; enable/disable tab-stop
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
  (global-set-key (kbd "C-x g") 'magit-status)

  (define-key global-map "\C-cc" 'org-capture)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  
  ;; FACE
  (when (string-equal system-type 'darwin)
    (set-face-attribute 'default nil :family "Unifont")
    (set-face-attribute 'default nil :height 165))
  (when (string-equal system-type 'windows-nt)
    (set-face-attribute 'default nil :family "Source Code Pro")
    (set-face-attribute 'default nil :height 113))
 (when (string-equal system-type 'gnu/linux)
   (set-face-attribute 'default nil :family "Source Code Pro")
   (set-face-attribute 'default nil :height 120))

  (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (setq inhibit-startup-screen t)

  ;; FUNCTIONS
  (defun nxml-pretty-format ()
    "Invokes xmllint on selected text."
    (interactive)
    (save-excursion
      (shell-command-on-region (point-min) (point-max) "xmllint --format -" (buffer-name) t)
      (nxml-mode)
      (indent-region 0 (count-lines (point-min) (point-max))))
    )

  ;;; % like in vi
  (global-set-key "%" 'match-paren)
  (defun match-paren (arg)
    "Go to the matching paren if on a paren; otherwise insert %."
    (interactive "p")
    (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s)") (forward-char 1) (backward-list 1))
          (t (self-insert-command (or arg 1)))))

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-do-load-languages
   '(;; other Babel languages
     (plantuml . t)))
  (setq org-plantuml-jar-path
        (expand-file-name "~/Applications/plantuml.jar"))
)
(server-start)
(provide 'init)
;;; init.el ends here
